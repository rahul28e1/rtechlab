// =============================================================================
// CHAPTER 02: ENTERPRISE LAB SETUP & WINDOWS SERVER 2025 INSTALLATION
// =============================================================================

[#metadata("ch2") <chapter-2>]

#chapter-header(
  chapter-num: "CHAPTER 02",
  category: "ભાગ 2 : વર્ચ્યુઅલ લેબ નિર્માણ (Hands-On Lab Setup)",
  title: "પ્રેક્ટિકલ હોમ લેબ સેટઅપ: Windows Server 2025 ISO અને VM કન્ફિગરેશન",
  subtitle: "સિસ્ટમ આવશ્યકતાઓ · આઇસોલેટેડ નેટવર્ક ટોપોલોજી · Microsoft Evaluation Center · VirtualBox VM નિર્માણ · Desktop Experience vs Core"
)

#v(6pt)

=== 2.1 હોમ લેબની આવશ્યકતાઓ (System & Hardware Requirements)
વિન્ડોઝ સર્વર શીખવા માટે તમારે કોઈ મોંઘા ફિઝિકલ સર્વર રેકની જરૂર નથી. તમે તમારા સામાન્ય લેપટોપ અથવા ડેસ્કટોપ પર #hl-yellow[ટાઇપ-2 હાઇપરવાઇઝર (Type-2 Hypervisor)] નો ઉપયોગ કરીને સંપૂર્ણ એન્ટરપ્રાઇઝ લેબ તૈયાર કરી શકો છો.

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "ન્યૂનતમ હાર્ડવેર (Minimum Specs)")[
      - #text(weight: "bold")[CPU:] 64-બીટ 1.4 GHz પ્રોસેસર (VT-x/AMD-V સક્ષમ).
      - #text(weight: "bold")[RAM:] ઓછામાં ઓછી #hl-orange[8 GB RAM] (જેથી હોસ્ટ OS અને 1 Server VM સરળતાથી ચાલી શકે).
      - #text(weight: "bold")[Storage:] ઓછામાં ઓછી 60 GB ખાલી SSD સ્પેસ.
    ]
  ],
  [
    #info-box(title: "ભલામણ કરેલ હાર્ડવેર (Recommended Specs)")[
      - #text(weight: "bold")[CPU:] 4-કોર / 8-થ્રેડ આધુનિક પ્રોસેસર (i5/i7 અથવા Ryzen 5).
      - #text(weight: "bold")[RAM:] #hl-green[16 GB અથવા 32 GB RAM] (1 DC Server + 1 Client PC + 1 ADC Server એક સાથે ચલાવવા માટે).
      - #text(weight: "bold")[Storage:] NVMe SSD (ઝડપી બૂટ અને સ્નેપશોટ માટે).
    ]
  ]
)

#v(4pt)

#warning-box(title: "BIOS / UEFI માં વર્ચ્યુઅલાઇઝેશન સક્ષમ કરો (Virtualization Error Fix)")[
  જો વર્ચ્યુઅલ મશીન બનાવતી વખતે 'VT-x/AMD-V is not available' ની એરર આવે, તો તમારા લેપટોપને રીસ્ટાર્ટ કરીને BIOS/UEFI સેટિંગ્સમાં (F2 / F10 / Del) જાઓ અને #hl-orange['Intel Virtualization Technology' અથવા 'AMD-SVM'] ને #hl-green[Enabled] કરો.
]

#v(6pt)

=== 2.2 લેબ ટોપોલોજી અને નેટવર્ક આર્કિટેક્ચર (Isolated Virtual Network)
આપણી હોમ લેબમાં બે મુખ્ય વર્ચ્યુઅલ મશીનો હશે જે એક સુરક્ષિત આઇસોલેટેડ વર્ચ્યુઅલ નેટવર્ક પર પરસ્પર સંવાદ કરશે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/lab_topology_virtualbox.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 2.1: વિદ્યાર્થી હોમ લેબ ટોપોલોજી — ફિઝિકલ હોસ્ટ, આઇસોલેટેડ વર્ચ્યુઅલ સ્વિચ, #hl-yellow[ડોમેન કંટ્રોલર] અને ક્લાયન્ટ વર્કસ્ટેશન]
]

#v(4pt)

- #text(weight: "bold", fill: rtech-blue)[VM 1 (Primary DC - `SRV-2025-DC01`):] આ આપણું મુખ્ય #hl-yellow[ડોમેન કંટ્રોલર] મશીન હશે જેના પર Windows Server 2025 Datacenter ઇન્સ્ટોલ થશે. આમાં AD DS, DNS, DHCP અને ફાઇલ સર્વર રોલ્સ ચાલશે.
- #text(weight: "bold", fill: rtech-emerald)[VM 2 (Client PC - `CLT-WIN11-01`):] આ આપણા કર્મચારીનું વર્કસ્ટેશન મશીન હશે જેના પર Windows 10 અથવા 11 Pro ચાલશે અને જેને આપણે ડોમેન સાથે જોડીશું.

#v(6pt)

=== 2.3 સત્તાવાર Windows Server 2025 ISO કેવી રીતે ડાઉનલોડ કરવું? (Microsoft Evaluation Center)
માઇક્રોસોફ્ટ વિદ્યાર્થીઓ અને IT પ્રોફેશનલ્સને શીખવા માટે 180 દિવસની નિઃશુલ્ક પૂર્ણ-સુવિધા યુક્ત ટ્રાયલ પ્રદાન કરે છે:

1. તમારા બ્રાઉઝરમાં જાઓ: #hl-green[`https://www.microsoft.com/en-us/evalcenter/download-windows-server-2025`].
2. #text(weight: "bold")[Download the ISO] વિકલ્પ પસંદ કરો અને તમારું સામાન્ય નામ તેમજ ઇમેઇલ દાખલ કરો.
3. ભાષામાં #hl-yellow['English (United States)'] પસંદ કરો અને 64-બીટ એડિશન ISO ફાઇલ (કદ: આશરે 5.2 GB) ડાઉનલોડ કરો.

#pro-tip(title: "180-દિવસીય ટ્રાયલ Re-arm કમાન્ડ")[
  180 દિવસની ટ્રાયલ સમાપ્ત થવા પર તમે કમાન્ડ પ્રોમ્પ્ટમાં #hl-green[`slmgr.vbs /rearm`] ચલાવીને તેને 5 વખત સુધી રીસેટ (મહત્તમ 3 વર્ષ સુધી માન્ય) કરી શકો છો!
]

#v(6pt)

=== 2.4 વર્ચ્યુઅલ મશીન નિર્માણના પગલાં (Step-by-Step VM Creation in VirtualBox)
#step-screenshot(
  step-num: "પગલું 1",
  title: "VirtualBox માં નવી વર્ચ્યુઅલ મશીનનું કન્ફિગરેશન નક્કી કરવું",
  img-path: "../02_BRAND_ASSETS/screenshots/lab_topology_virtualbox.png",
  caption: "VM Name: SRV-2025-DC01 | Type: Microsoft Windows | Version: Windows 2025 (64-bit)"
)

1. VirtualBox ખોલો અને #hl-green['New'] બટન પર ક્લિક કરો.
2. Name માં લખો: #hl-yellow[`SRV-2025-DC01`]. Type માં #hl-yellow[`Microsoft Windows`] અને Version માં #hl-yellow[`Windows 2025 (64-bit)`] પસંદ કરો.
3. #text(weight: "bold")[Memory (RAM):] સ્લાઇડરને ઓછામાં ઓછી #hl-green[4096 MB (4 GB)] પર સેટ કરો. Processors માં #hl-green[2 vCPUs] ફાળવો.
4. #text(weight: "bold")[Virtual Hard Disk:] 'Create a Virtual Hard Disk Now' પસંદ કરો. સાઇઝ: #hl-yellow[60.00 GB] (Dynamically Allocated) રાખો જેથી તમારી વાસ્તવિક હાર્ડ ડિસ્ક સ્પેસ ત્યારે જ વપરાય જ્યારે VM માં ડેટા લખાય.
5. #text(weight: "bold")[Network Settings:] VM ના Settings -> Network માં જાઓ અને Attached to માં #hl-orange['Internal Network' અથવા 'NAT Network'] પસંદ કરો જેથી તમારી લેબ તમારા ઘરના વાઇ-ફાઇ નેટવર્કથી સુરક્ષિત રીતે અલગ રહે.

#v(6pt)

=== 2.5 Windows Server 2025 ઇન્સ્ટોલેશન પ્રક્રિયા (Full Wizard Walkthrough)
1. વર્ચ્યુઅલ મશીનને સ્ટાર્ટ કરો. સ્ક્રીન પર 'Press any key to boot from CD or DVD...' દેખાય કે તરત જ #hl-green[Enter] દબાવો.
2. ભાષા પસંદગી વિંડોમાં Language: #hl-yellow[English (United States)], Time & Currency Format: #hl-yellow[English (India)] અને Keyboard: #hl-yellow[US] પસંદ કરીને 'Next' દબાવો.
3. આગળની સ્ક્રીન પર #hl-green['Install Now'] પર ક્લિક કરો.
4. 'Activate Windows' સ્ક્રીન પર લાયસન્સ કી માંગવામાં આવે ત્યારે નીચે આપેલ #hl-yellow['I don't have a product key'] લિંક પર ક્લિક કરો.

#v(4pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/server_setup_os_selection.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 2.2: ઓપરેટિંગ સિસ્ટમ સંસ્કરણ પસંદગી — 'Windows Server 2025 Datacenter (Desktop Experience)' ની અનિવાર્ય પસંદગી]
]

#v(4pt)

#warning-box(title: "સૌથી ગંભીર ભૂલથી બચો: #hl-yellow[Server Core] vs Desktop Experience")[
  વિઝાર્ડમાં 4 વિકલ્પો દેખાય છે. જો તમે ભૂલથી માત્ર 'Windows Server 2025 Datacenter' પસંદ કરી લીધું (કૌંસ વગરનું નામ), તો #hl-orange[Server Core (માત્ર બ્લેક કમાન્ડ પ્રોમ્પ્ટ)] ઇન્સ્ટોલ થઈ જશે અને કોઈ ડેસ્કટોપ કે માઉસ મળશે નહીં! હંમેશા #mark-green[Windows Server 2025 Datacenter (Desktop Experience)] જ પસંદ કરો જેમાં સંપૂર્ણ ગ્રાફિકલ ઇન્ટરફેસ અને #hl-yellow[સર્વર મેનેજર] સામેલ હોય છે.
]

#v(6pt)

5. લાયસન્સ શરતો સ્વીકારીને (Accept License Terms) 'Next' દબાવો.
6. ઇન્સ્ટોલેશન પ્રકારમાં #hl-yellow['Custom: Install Windows Server only (advanced)'] પસંદ કરો.
7. ડિસ્ક પાર્ટીશન સ્ક્રીન પર 'Drive 0 Unallocated Space (60.0 GB)' ને પસંદ કરો અને સીધા જ #hl-green['Next'] પર ક્લિક કરો. વિન્ડોઝ આપમેળે જરૂરી EFI અને રિકવરી પાર્ટીશન્સ બનાવી દેશે.
8. ઇન્સ્ટોલેશન પ્રગતિ 0% થી 100% સુધી ચાલશે અને સિસ્ટમ આપમેળે રીબૂટ થશે.

#v(6pt)

=== 2.6 પ્રથમ બૂટ અને એડમિનિસ્ટ્રેટર પાસવર્ડ સેટઅપ (First Boot Configuration)
રીબૂટ થયા પછી સ્ક્રીન પર #hl-yellow['Customize settings'] વિંડો ખુલશે જેમાં લોકલ એડમિનિસ્ટ્રેટરનો પાસવર્ડ સેટ કરવો ફરજિયાત રહેશે:

- #text(weight: "bold")[User name:] `Administrator` (ડિફોલ્ટ રૂપે લોક હોય છે).
- #text(weight: "bold")[Password:] વિન્ડોઝ સર્વર જટિલ પાસવર્ડ (Complex Password) ની માંગ કરે છે જેમાં કેપિટલ અક્ષરો, સ્મોલ અક્ષરો, અંકો અને સ્પેશિયલ કેરેક્ટર્સ હોવા જોઈએ. ઉદાહરણ તરીકે: #hl-green[`P@ssw0rd2025!`] અથવા #hl-green[`Rtechlab@2025`].
- પાસવર્ડની પુષ્ટિ કરો અને #hl-green['Finish'] પર ક્લિક કરો.
- સ્ક્રીન પર લોક સ્ક્રીન દેખાશે. વર્ચ્યુઅલ મશીનમાં લોગિન કરવા માટે VirtualBox ના મેનૂમાં જાઓ: #hl-yellow[Input -> Keyboard -> Insert Ctrl+Alt+Del] દબાવો અને તમારો બનાવેલો પાસવર્ડ દાખલ કરીને લોગિન કરો.
- લોગિન થતાં જ સ્ક્રીન પર #mark-yellow[Server Manager Dashboard] આપમેળે ખુલી જશે!

#v(8pt)

// =============================================================================
// CHAPTER 02 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  માઇક્રોસોફ્ટ અનુસાર પ્રોડક્શન વાતાવરણ (Production Datacenters) માં ચાલતા 70% થી વધુ વિન્ડોઝ સર્વર્સ કોઈપણ GUI વગર #hl-yellow[Server Core] મોડમાં ચલાવવામાં આવે છે. #hl-yellow[Server Core] માં GUI ન હોવાને કારણે રેમનો વપરાશ 60% ઘટી જાય છે, ડિસ્ક સ્પેસ માત્ર 10 GB વપરાય છે, અને સૌથી મહત્વનું: એટેકર માટે કોઈ ગ્રાફિકલ એક્સપ્લોઇટ ઉપલબ્ધ રહેતું નથી જેનાથી સર્વર પર સુરક્ષા પેચ લગાવવાની આવૃત્તિ 50% ઘટી જાય છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 02 પ્રેક્ટિસ બહુવિકલ્પીય પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "માઇક્રોસોફ્ટ ઇવેલ્યુએશન સેન્ટર પરથી ડાઉનલોડ કરેલ Windows Server 2025 ટ્રાયલની સત્તાવાર માન્યતા કેટલી હોય છે?",
  optA: "30 દિવસ",
  optB: "90 દિવસ",
  optC: "180 દિવસ",
  optD: "365 દિવસ",
  ans: "C",
  exp: "વિન્ડોઝ સર્વર ઇવેલ્યુએશન એડિશન 180 દિવસના સંપૂર્ણ સુવિધા ધરાવતા સત્તાવાર મૂલ્યાંકન લાયસન્સ સાથે આવે છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "Windows Server 2025 માં સંપૂર્ણ ગ્રાફિકલ ડેસ્કટોપ અને #hl-yellow[સર્વર મેનેજર] મેળવવા માટે ઇન્સ્ટોલેશન સમયે કયો વિકલ્પ પસંદ કરવો અનિવાર્ય છે?",
  optA: "#hl-yellow[Server Core] Edition",
  optB: "Desktop Experience",
  optC: "Nano Server Edition",
  optD: "Hyper-V Server Edition",
  ans: "B",
  exp: "વિન્ડોઝ સર્વરમાં GUI ઇન્ટરફેસને સત્તાવાર રીતે 'Desktop Experience' કહેવામાં આવે છે; અન્ય વિકલ્પો કમાન્ડ લાઇન (CLI) સ્થાપિત કરે છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "વર્ચ્યુઅલ મશીનમાં હોસ્ટ કમ્પ્યુટરના કીબોર્ડ શોર્ટકટના ટકરાવથી બચવા માટે Ctrl+Alt+Del મોકલવાની સાચી રીત કઈ છે?",
  optA: "કીબોર્ડ પર સીધું Ctrl+Alt+Del દબાવવું",
  optB: "VirtualBox Input મેનૂ -> Keyboard -> Insert Ctrl+Alt+Del",
  optC: "કમાન્ડ પ્રોમ્પ્ટમાં exit ટાઇપ કરવું",
  optD: "કમ્પ્યુટરનું પાવર બટન દબાવવું",
  ans: "B",
  exp: "હોસ્ટ કીબોર્ડ પર સીધું Ctrl+Alt+Del દબાવવાથી હોસ્ટનું ટાસ્ક મેનેજર ખુલશે; VM માટે મેનૂમાંથી ઇન્સર્ટ કરવાનું રહે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "Windows Server 2025 ની 180-દિવસીય ઇવેલ્યુએશન અવધિને રીસેટ (re-arm) કરવા માટે કયા સત્તાવાર કમાન્ડનો ઉપયોગ થાય છે?",
  optA: "net stop license",
  optB: "slmgr.vbs /rearm",
  optC: "gpupdate /force",
  optD: "dism /online /enable-feature",
  ans: "B",
  exp: "slmgr.vbs /rearm કમાન્ડ લાયસન્સિંગ ગ્રેસ પિરિયડને ફરીથી 180 દિવસ માટે રીસેટ કરી દે છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "વર્ચ્યુઅલ લેબમાં હોસ્ટ મશીન અને અન્ય ફિઝિકલ નેટવર્કથી સુરક્ષા પૃથક્કરણ (Isolation) માટે વર્ચ્યુઅલ નેટવર્કનો કયો મોડ ભલામણ કરેલ છે?",
  optA: "Bridged Adapter",
  optB: "Internal Network / Host-Only",
  optC: "Direct Cloud Uplink",
  optD: "Promiscuous Mode All",
  ans: "B",
  exp: "Internal Network મોડ VM ને ઘરના વાઇ-ફાઇના DHCP અને અન્ય મશીનોથી અલગ રાખીને સુરક્ષિત લેબ વાતાવરણ પૂરું પાડે છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'એન્ટરપ્રાઇઝ પ્રોડક્શનમાં સર્વર ડિપ્લોય કરતી વખતે #hl-yellow[Server Core] અને Desktop Experience માંથી તમે કોને પ્રાથમિકતા આપશો અને શા માટે?'",
  a: "જવાબ: પ્રોડક્શનમાં આપણે હંમેશા '#hl-yellow[Server Core]' ને પ્રાથમિકતા આપીશું કારણ કે તે સિસ્ટમનું એટેક સરફેસ (Attack Surface) ઘટાડે છે, રીબૂટની જરૂરિયાત ઘટાડે છે અને હાર્ડવેર સંસાધનોની (RAM/CPU) બચત કરે છે. મેનેજમેન્ટ માટે આપણે રિમોટ ટૂલ્સ જેવા કે RSAT, PowerShell remoting અથવા Windows Admin Center નો ઉપયોગ કરીએ છીએ.",
  tip: "આ ઉત્તર દર્શાવે છે કે તમે માત્ર પુસ્તકીય જ્ઞાન ધરાવતા નથી, પરંતુ એન્ટરપ્રાઇઝ સિક્યુરિટીની ઊંડી સમજ ધરાવો છો."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'Windows Server 2025 ઇન્સ્ટોલેશન માટે ન્યૂનતમ ડિસ્ક સ્પેસ અને રેમની સત્તાવાર આવશ્યકતા શું છે?'",
  a: "જવાબ: ન્યૂનતમ સત્તાવાર આવશ્યકતા 512 MB રેમ (#hl-yellow[Server Core] માટે) અથવા 2 GB રેમ (Desktop Experience માટે), 1.4 GHz 64-બીટ પ્રોસેસર, અને ન્યૂનતમ 32 GB સ્ટોરેજ સ્પેસ છે. જો કે ઉત્પાદનમાં Active Directory અને રોલ્સના સરળ સંચાલન માટે ઓછામાં ઓછી 4 GB રેમ અને 60 GB SSD ભલામણ કરેલ છે.",
  tip: "TCS અને Cognizant ના ઇન્ફ્રાસ્ટ્રક્ચર સપોર્ટ ઇન્ટરવ્યુમાં આ બેઝિક સ્પેસિફિકેશન પૂછવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'Dynamically Allocated Virtual Disk અને Fixed Size Virtual Disk માં શું તફાવત હોય છે, અને પ્રોડક્શનમાં કોને પસંદ કરવામાં આવે છે?'",
  a: "જવાબ: Dynamically Allocated ડિસ્ક શરૂઆતમાં ખૂબ ઓછી સ્પેસ રોકે છે અને જેમ-જેમ ડેટા વધે છે તેમ-તેમ ફાઇલનું કદ વધે છે (આ હોમ લેબ માટે શ્રેષ્ઠ છે). પરંતુ પ્રોડક્શન એન્ટરપ્રાઇઝમાં (Hyper-V / VMware) હંમેશા 'Fixed Size' પસંદ કરવામાં આવે છે કારણ કે તેમાં ડિસ્ક ફ્રેગમેન્ટેશન થતું નથી અને I/O થ્રુપુટ ઘણું વધારે રહે છે.",
  tip: "સ્ટોરેજ અને વર્ચ્યુઅલાઇઝેશન ટીમના ટેકનિકલ ઇન્ટરવ્યુમાં આ પ્રશ્ન વારંવાર પૂછાય છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'જો Windows Server 2025 નો 180-દિવસીય ઇવેલ્યુએશન સમયગાળો સમાપ્ત થઈ જાય, તો શું સિસ્ટમ તરત જ બંધ થઈ જાય છે?'",
  a: "જવાબ: ટ્રાયલ સમાપ્ત થતાં સર્વર અચાનક બંધ થતું નથી, પરંતુ દર 1 કલાકે સિસ્ટમ આપમેળે શટડાઉન થવા લાગે છે અને સ્ક્રીનના ખૂણામાં લાયસન્સ એક્સપાયરીનું વોટરમાર્ક આવી જાય છે. તેને slmgr.vbs /rearm કમાન્ડ ચલાવીને 5 વખત સુધી રીસેટ (મહત્તમ 3 વર્ષ) કરી શકાય છે.",
  tip: "સિસ્ટમ સપોર્ટ અને ટ્રબલશૂટિંગ રોલ્સમાં લાયસન્સ એક્સપાયરી બિહેવિયરની સમજ ચકાસવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'VirtualBox અથવા Hyper-V માં Guest Additions / Integration Services ઇન્સ્ટોલ કરવું શા માટે અનિવાર્ય ગણાય છે?'",
  a: "જવાબ: Guest Additions (VirtualBox) અથવા Integration Services (Hyper-V) વર્ચ્યુઅલ મશીન માટે વિશિષ્ટ કર્નલ ડ્રાઇવર્સ પ્રદાન કરે છે. તેના વિના VM માં ઓટોમેટિક સ્ક્રીન રિસાઇઝિંગ (1080p), હોસ્ટ અને ગેસ્ટ વચ્ચે ક્લિપબોર્ડ શેરિંગ (Copy-Paste), સ્મૂથ માઉસ પોઇન્ટર ઇન્ટિગ્રેશન, અને બહેતર નેટવર્ક I/O પરફોર્મન્સ શક્ય બનતું નથી.",
  tip: "લેબ મેનેજમેન્ટ અને વર્ચ્યુઅલાઇઝેશન સપોર્ટના પ્રેક્ટિકલ રાઉન્ડમાં આ જ્ઞાન ચકાસવામાં આવે છે."
)

#v(5pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "black", fill: rtech-navy)[🛠️ હોમ લેબ ટ્રબલશૂટિંગ ગાઇડ: 4 સામાન્ય VM સમસ્યાઓ અને ઝડપી ઉકેલ]\
    #v(3pt)
    #text(size: 7.5pt, fill: rtech-text)[
      - #text(weight: "bold", fill: rtech-rose)[સમસ્યા 1: 'VT-x / AMD-V is not available':] તમારા ફિઝિકલ પીસીને રીસ્ટાર્ટ કરો, BIOS/UEFI માં જાઓ અને Intel Virtualization Technology ને Enable કરો.
      - #text(weight: "bold", fill: rtech-amber)[સમસ્યા 2: 'Ctrl+Alt+Del VM માં કામ નથી કરતું':] ફિઝિકલ કીબોર્ડ પર દબાવવાને બદલે VirtualBox ના ટોચના મેનૂ 'Input -> Keyboard -> Insert Ctrl+Alt+Del' નો ઉપયોગ કરો.
      - #text(weight: "bold", fill: rtech-blue)[સમસ્યા 3: 'ભૂલથી Server Core ઇન્સ્ટોલ થઈ ગયું (કોઈ ડેસ્કટોપ નથી)':] ISO વિઝાર્ડમાં ફરીથી જાઓ અને 'Desktop Experience' વાળા વિકલ્પને પસંદ કરીને ફ્રેશ ઇન્સ્ટોલ કરો.
      - #text(weight: "bold", fill: rtech-emerald)[સમસ્યા 4: 'સ્ક્રીન રિઝોલ્યુશન 1024x768 પર અટકેલું છે':] VirtualBox મેનૂમાં 'Devices -> Insert Guest Additions CD Image' ચલાવો અને VM ની અંદર `VBoxWindowsAdditions.exe` રન કરીને રીબૂટ કરો.
    ]
  ]
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[✅ લેબ 02 વેરિફિકેશન ચેકલિસ્ટ (Verification Checklist):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - [ ] વર્ચ્યુઅલ મશીન `SRV-2025-DC01` સફળતાપૂર્વક બૂટ થઈ ચૂકી છે.
      - [ ] લોકલ `Administrator` નો જટિલ પાસવર્ડ સુરક્ષિત રીતે નોંધી લેવામાં આવ્યો છે.
      - [ ] લોગિન પછી #hl-yellow[Server Manager] Dashboard સ્ક્રીન પર કોઈપણ ભૂલ વગર દર્શાવવામાં આવી રહ્યો છે.
    ]
  ]
)

#pagebreak()
