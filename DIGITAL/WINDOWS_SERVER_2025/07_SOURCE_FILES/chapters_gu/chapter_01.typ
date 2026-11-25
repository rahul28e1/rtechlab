// =============================================================================
// CHAPTER 01: INTRODUCTION, ARCHITECTURE, TYPES & EVOLUTION
// =============================================================================

[#metadata("ch1") <chapter-1>]

#chapter-header(
  chapter-num: "CHAPTER 01",
  category: "ભાગ 1 : સિદ્ધાંત અને વિકાસક્રમ (Foundation Architecture)",
  title: "સર્વર આર્કિટેક્ચર, સર્વરના પ્રકારો અને વિન્ડોઝ સર્વરનો 32-વર્ષીય ઇતિહાસ",
  subtitle: "ક્લાયન્ટ-સર્વર મોડેલ · 8 મુખ્ય સર્વર પ્રકારો · ફિઝિકલ vs વર્ચ્યુઅલ vs અઝૂર આર્ક હાઇબ્રિડ · 1993 થી 2025 નો સંપૂર્ણ વિકાસક્રમ"
)

#v(6pt)

=== 1.1 સર્વર શું છે? (What is a Server?)
એક સામાન્ય કમ્પ્યુટર અને એન્ટરપ્રાઇઝ સર્વર વચ્ચેનો તફાવત માત્ર હાર્ડવેરનો નથી, પરંતુ તેની #hl-yellow[ભૂમિકા (Role) અને ઉપલબ્ધતા (Availability)] નો છે.

#mark-yellow[સર્વર એ એક એવું શક્તિશાળી કેન્દ્રીય કમ્પ્યુટર અથવા સોફ્ટવેર પ્રોગ્રામ છે જે નેટવર્ક પરના અન્ય કમ્પ્યુટર્સને (જેમને ક્લાયન્ટ્સ કહેવામાં આવે છે) વિવિધ સેવાઓ, સંસાધનો, ડેટા અને સુરક્ષા નીતિઓ 24 કલાક, સાતેય દિવસ (24/7/365) નિરંતર પ્રદાન કરે છે.]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "ક્લાયન્ટ (Client) ની વ્યાખ્યા")[
      ક્લાયન્ટ એ એન્ડ-યુઝર ડિવાઇસ (લેપટોપ, ડેસ્કટોપ, સ્માર્ટફોન) છે જે કોઈ સેવા મેળવવા માટે સર્વરને વિનંતી (#hl-green[Request]) મોકલે છે. ઉદાહરણ: તમારું વેબ બ્રાઉઝર, આઉટલુક ઇમેઇલ ક્લાયન્ટ, અથવા ફાઇલ એક્સપ્લોરર.
    ]
  ],
  [
    #info-box(title: "સર્વર (Server) ની વ્યાખ્યા")[
      સર્વર એ એક કેન્દ્રીય સિસ્ટમ છે જે ક્લાયન્ટ્સની વિનંતીઓ સાંભળે છે (#hl-green[Listening on Ports]), તેમની અધિકૃતતા ચકાસે છે, અને સંબંધિત સેવાનો પ્રત્યુત્તર (#hl-green[Response]) પાછો મોકલે છે.
    ]
  ]
)

#v(4pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/client_server_architecture.png", width: 72%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 1.1: એન્ટરપ્રાઇઝ ક્લાયન્ટ-સર્વર નેટવર્ક આર્કિટેક્ચર — કેન્દ્રીય #hl-yellow[એક્ટિવ ડિરેક્ટરી], સ્વિચિંગ અને ક્લાયન્ટ્સ]
]

#v(6pt)

=== 1.2 કોર્પોરેટ નેટવર્કમાં ઉપયોગ થતા 8 મુખ્ય સર્વર પ્રકારો (8 Major Server Types)
કોઈપણ બહુરાષ્ટ્રીય કંપની (MNC) કે બેંકમાં એક જ સર્વર તમામ કાર્યો કરતું નથી. વિશિષ્ટ કાર્યો માટે સર્વર્સને અલગ-અલગ ભૂમિકાઓ સોંપવામાં આવે છે:

1. #text(weight: "bold", fill: rtech-navy)[ડોમેન કંટ્રોલર (Domain Controller / AD DS):] સમગ્ર સંસ્થાની કેન્દ્રીય ઓળખ (Identity) સંભાળે છે. યુઝરનેમ, પાસવર્ડ, કમ્પ્યુટર એકાઉન્ટ્સ અને સુરક્ષા નીતિઓ આના પર જ સંગ્રહિત હોય છે. #hl-green[પોર્ટ્સ: 88 (#hl-orange[Kerberos]), 389 (LDAP)].
2. #text(weight: "bold", fill: rtech-navy)[ફાઇલ અને સ્ટોરેજ સર્વર (File & Storage Server):] તમામ કર્મચારીઓના ડેટાને કેન્દ્રીયકૃત રીતે સંગ્રહિત કરે છે. કયા વિભાગને (HR, Sales) કયા ફોલ્ડરનો એક્સેસ મળશે, તે NTFS અને SMB દ્વારા નક્કી થાય છે. #hl-green[પોર્ટ: 445 (SMB)].
3. #text(weight: "bold", fill: rtech-navy)[વેબ સર્વર (Web Server - IIS / Apache):] કંપનીના આંતરિક પોર્ટલ, વેબસાઇટ્સ અને વેબ એપ્લિકેશન્સ હોસ્ટ કરે છે. #hl-green[પોર્ટ્સ: 80 (HTTP), 443 (HTTPS)].
4. #text(weight: "bold", fill: rtech-navy)[ડેટાબેઝ સર્વર (Database Server - MS SQL / Oracle):] બેંક બેલેન્સ, ગ્રાહક રેકોર્ડ્સ અને ઇ-કોમર્સ ઇનવોઇસ જેવી સંરચિત માહિતી પ્રોસેસ કરે છે. #hl-green[પોર્ટ: 1433 (SQL Server)].
5. #text(weight: "bold", fill: rtech-navy)[DNS સર્વર (Domain Name System):] કમ્પ્યુટર નામોને (દા.ત. `portal.rtechlab.local`) IP એડ્રેસમાં (`192.168.1.50`) રૂપાંતરિત કરે છે. #hl-green[પોર્ટ: 53 (UDP/TCP)].
6. #text(weight: "bold", fill: rtech-navy)[DHCP સર્વર (Dynamic Host Configuration Protocol):] નેટવર્ક સાથે જોડાતા દરેક કમ્પ્યુટરને આપમેળે IP એડ્રેસ, ગેટવે અને સબનેટ માસ્ક લીઝ પર આપે છે. #hl-green[UDP પોર્ટ્સ: 67, 68].
7. #text(weight: "bold", fill: rtech-navy)[મેઇલ સર્વર (Mail Server - Exchange Server):] કર્મચારીઓના ઇમેઇલ મોકલવા, પ્રાપ્ત કરવા અને મેઇલબોક્સ સુરક્ષિત રાખવાનું કાર્ય કરે છે. #hl-green[પોર્ટ્સ: 25 (SMTP), 587, 993 (IMAP)].
8. #text(weight: "bold", fill: rtech-navy)[પ્રોક્સી અને સુરક્ષા સર્વર (Proxy / Firewall Server):] કર્મચારીઓના ઇન્ટરનેટ વપરાશને ફિલ્ટર કરે છે અને અનધિકૃત વેબસાઇટ્સ બ્લોક કરીને નેટવર્કને સુરક્ષિત રાખે છે. #hl-green[પોર્ટ: 8080].

#v(4pt)

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/types_of_servers_infographic.png", width: 72%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 1.2: એન્ટરપ્રાઇઝમાં સક્રિય 8 મુખ્ય સર્વર પ્રકારો, તેમના કાર્યો અને IANA ડિફોલ્ટ પોર્ટ નંબર્સ]
]

#v(6pt)

=== 1.3 ફિઝિકલ (Bare-Metal) vs વર્ચ્યુઅલ મશીન vs ક્લાઉડ સર્વર (Azure & Hybrid)
આજના આધુનિક IT ઇન્ફ્રાસ્ટ્રક્ચરમાં સર્વર ડિપ્લોય કરવા માટેના 3 પ્રાથમિક મોડેલ ઉપલબ્ધ છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/physical_virtual_cloud_comparison.png", width: 72%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 1.3: સર્વર ડિપ્લોયમેન્ટના 3 આધુનિક સ્વરૂપો — ફિઝિકલ બેઅર-મેટલ, વર્ચ્યુઅલાઇઝેશન (Hyper-V) અને અઝૂર હાઇબ્રિડ ક્લાઉડ]
]

#v(4pt)

- #text(weight: "bold", fill: rtech-navy)[1. ફિઝિકલ સર્વર (On-Premises Bare-Metal):] જ્યારે હાર્ડવેર (Dell PowerEdge અથવા HP ProLiant રેક સર્વર) પર સીધું જ ઓપરેટિંગ સિસ્ટમ ઇન્સ્ટોલ કરવામાં આવે છે. ખૂબ જ ભારે ડેટાબેઝ માટે આદર્શ છે, પરંતુ તેમાં હાર્ડવેરનો વ્યય (ઓછો વપરાશ) વધુ થાય છે.
- #text(weight: "bold", fill: rtech-navy)[2. વર્ચ્યુઅલ મશીન (Hyper-V / VMware ESXi):] એક જ મોટા ફિઝિકલ સર્વર પર હાઇપરવાઇઝર ચલાવીને 10 થી 20 અલગ-અલગ વર્ચ્યુઅલ સર્વર્સ બનાવવામાં આવે છે. આનાથી હાર્ડવેરનો 85% થી વધુ કાર્યક્ષમ ઉપયોગ સુનિશ્ચિત થાય છે.
- #text(weight: "bold", fill: rtech-navy)[3. માઇક્રોસોફ્ટ અઝૂર અને હાઇબ્રિડ ક્લાઉડ (#hl-green[Azure Arc]):] #mark-green[Windows Server 2025 નું સૌથી ક્રાંતિકારી ફીચર #hl-green[Azure Arc] ઇન્ટિગ્રેશન છે.] તમે તમારા ઓન-પ્રિમાઇસિસ લોકલ સર્વર્સને ક્લાઉડ સાથે જોડી શકો છો, અને #hl-yellow[હોટપેચિંગ (#hl-yellow[Hotpatching])] દ્વારા સર્વરને રીબૂટ કર્યા વિના સીધા જ રેમ (RAM) માં સિક્યુરિટી અપડેટ્સ લાગુ કરી શકો છો!

#v(6pt)

=== 1.4 વિન્ડોઝ સર્વરનો 32-વર્ષીય સંપૂર્ણ વિકાસક્રમ (1993 થી 2025 સુધી)
માઇક્રોસોફ્ટે 1993 માં પ્રથમ 32-બીટ ઓપરેટિંગ સિસ્ટમ Windows NT 3.1 Advanced Server તરીકે લોન્ચ કરી હતી. આજે Windows Server 2025 સુધીમાં આ ઓપરેટિંગ સિસ્ટમ વિશ્વનું સૌથી સુરક્ષિત એન્ટરપ્રાઇઝ પ્લેટફોર્મ બની ચૂક્યું છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/server_evolution_timeline.png", width: 72%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 1.4: વિન્ડોઝ સર્વરની 1993 થી 2025 સુધીની ઐતિહાસિક સફર — NT 4.0 થી આધુનિક Server 2025 સુધી]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[ઇતિહાસના મુખ્ય સીમાચિહ્નો (Key Historical Milestones):]\
    - #text(weight: "bold", fill: rtech-blue)[Windows NT 4.0 (1996):] પ્રથમ વખત Windows 95 જેવો ગ્રાફિકલ ઇન્ટરફેસ અને ડોમેન ટ્રસ્ટ મોડેલ રજૂ કરવામાં આવ્યું.
    - #text(weight: "bold", fill: rtech-emerald)[Windows 2000 Server (2000):] #hl-yellow[ક્રાંતિકારી વર્ષ!] #hl-yellow[એક્ટિવ ડિરેક્ટરી] (AD DS), DNS ઇન્ટિગ્રેશન અને ગ્રુપ પોલિસીનો જન્મ આ જ સંસ્કરણમાં થયો હતો.
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2008 / R2 (2008):] વર્ચ્યુઅલાઇઝેશન ક્રાંતિની શરૂઆત — #hl-green[Microsoft Hyper-V] અને GUI વગરનું #hl-orange[Server Core] પ્રથમ વખત સામેલ થયા.
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2012 / R2 (2012):] આધુનિક #hl-yellow[સર્વર મેનેજર] ડેશબોર્ડ, સ્ટોરેજ સ્પેસિસ (Storage Spaces) અને SMB 3.0 નો સમાવેશ થયો.
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2016 (2016):] વિન્ડોઝ કન્ટેનર્સ (Docker સપોર્ટ) અને સ્ટોરેજ સ્પેસિસ ડિરેક્ટ (S2D) ની શરૂઆત.
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2019 (2019):] વિન્ડોઝ એડમિન સેન્ટર (WAC) અને હાઇબ્રિડ ક્લાઉડ ઇન્ફ્રાસ્ટ્રક્ચરનો પાયો.
    - #text(weight: "bold", fill: rtech-navy)[Windows Server 2022 (2022):] સિક્યોર્ડ-કોર સર્વર (Secured-Core Server), ડિફોલ્ટ TLS 1.3 અને #hl-orange[SMB over QUIC].
    - #text(weight: "bold", fill: rtech-blue)[Windows Server 2025 (નવીનતમ ફ્લેગશિપ):] #hl-yellow[હોટપેચિંગ ફોર ઓલ (#hl-yellow[Hotpatching] for All)] (Zero-reboot patching), #hl-yellow[32KB AD ડેટાબેઝ પેજ સાઇઝ] (25 વર્ષમાં #hl-yellow[એક્ટિવ ડિરેક્ટરી]નો સૌથી મોટો સ્પીડ બૂસ્ટ), નેક્સ્ટ-જેન સ્ટોરેજ સ્પેસિસ ડિરેક્ટ ડિડ્યુપ્લિકેશન અને કોમ્પ્રેસન, તેમજ નેટિવ વાઇ-ફાઇ સપોર્ટ.
  ]
)

#v(6pt)

=== 1.5 ક્લાયન્ટ OS (Windows 11) વિરુદ્ધ સર્વર OS (Windows Server 2025)
ઘણા નવા વિદ્યાર્થીઓ પૂછે છે: *"જ્યારે Windows 11 પણ વિન્ડોઝ છે અને Server 2025 પણ, તો આપણે Windows 11 ને જ સર્વર તરીકે શા માટે વાપરી શકતા નથી?"*

કર્નલના સ્તરે બંને ઓપરેટિંગ સિસ્ટમ્સ વચ્ચે ખૂબ મોટો આંતરિક તફાવત હોય છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/windows_client_vs_server_architecture.png", width: 72%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 1.5: આર્કિટેક્ચરલ સરખામણી — Windows 11 Pro vs Windows Server 2025 Datacenter]
]

#v(4pt)

#warning-box(title: "હાર્ડ-કોડેડ નેટવર્ક કનેક્શન લિમિટ (ઇન્ટરવ્યુ ટ્રેપ)")[
  Windows 11 અથવા Windows 10 માં નેટવર્ક પર એક સમયે મહત્તમ #hl-orange[માત્ર 20 કમ્પ્યુટર્સ જ કનેક્ટ થઈ શકે છે] (Inbound Connections Limit). જો 21મું કમ્પ્યુટર જોડાવાનો પ્રયાસ કરશે તો એરર આવશે. તેનાથી વિપરીત, Windows Server 2025 માં #hl-green[અમર્યાદિત (Unlimited) સમાંતર કનેક્શન્સ] ની પરવાનગી હોય છે.
]

#v(6pt)

=== 1.6 વિન્ડોઝ સર્વર 2025 ના 3 મુખ્ય સંસ્કરણો (Editions Comparison)
1. #text(weight: "bold", fill: rtech-navy)[Essentials Edition:] નાની સંસ્થાઓ અને ઓફિસો માટે (મહત્તમ 25 યુઝર્સ અને 50 ડિવાઇસિસ). આમાં યુઝર-આધારિત CALs (Client Access Licenses) ની જરૂર પડતી નથી.
2. #text(weight: "bold", fill: rtech-navy)[Standard Edition:] મધ્યમ અને મોટા ઉદ્યોગો માટે. આમાં કોર-આધારિત લાયસન્સિંગ હોય છે અને પ્રતિ લાયસન્સ માત્ર #hl-green[2 વર્ચ્યુઅલ મશીન (VMs)] ચલાવવાની પરવાનગી મળે છે.
3. #text(weight: "bold", fill: rtech-navy)[Datacenter Edition:] મોટા ડેટા સેન્ટર્સ, પ્રાઇવેટ ક્લાઉડ અને હાઇપર-કન્વર્જ્ડ ઇન્ફ્રાસ્ટ્રક્ચર (HCI) માટે. આમાં #mark-green[અમર્યાદિત (Unlimited) વર્ચ્યુઅલ મશીન્સ], સ્ટોરેજ સ્પેસિસ ડિરેક્ટ (S2D) અને શીલ્ડેડ VMs ની સુવિધા મળે છે.

#v(8pt)

// =============================================================================
// CHAPTER 01 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  Windows 2000 Server થી લઈને Windows Server 2022 સુધી પૂરા 25 વર્ષો સુધી Active Directory ની મુખ્ય ડેટાબેઝ ફાઇલ (#hl-yellow[`ntds.dit`]) નો આંતરિક ડેટાબેઝ પેજ સાઇઝ માત્ર #text(weight: "bold")[8 KB] રહેતો હતો. Windows Server 2025 માં માઇક્રોસોફ્ટે તેને વધારીને #text(weight: "bold")[32 KB] કરી દીધો છે, જેનાથી મોટા બહુરાષ્ટ્રીય સંગઠનોમાં #hl-yellow[એક્ટિવ ડિરેક્ટરી]ના ક્વેરી રિસ્પોન્સ ટાઇમમાં 300% થી વધુ ઝડપ આવી છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 01 પ્રેક્ટિસ બહુવિકલ્પીય પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "#hl-yellow[એક્ટિવ ડિરેક્ટરી] ડોમેન સર્વિસિસ (AD DS) અને ગ્રુપ પોલિસીને પ્રથમ વખત કયા વિન્ડોઝ સર્વર સંસ્કરણમાં રજૂ કરવામાં આવ્યા હતા?",
  optA: "Windows NT 4.0",
  optB: "Windows 2000 Server",
  optC: "Windows Server 2003",
  optD: "Windows Server 2008",
  ans: "B",
  exp: "#hl-yellow[એક્ટિવ ડિરેક્ટરી] અને ગ્રુપ પોલિસીનો જન્મ વર્ષ 2000 માં Windows 2000 Server સાથે થયો હતો."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "ક્લાયન્ટ કમ્પ્યુટર (Windows 11) માં એક સમયે મહત્તમ કેટલા ઇનબાઉન્ડ નેટવર્ક કનેક્શન્સની પરવાનગી હોય છે?",
  optA: "10 કનેક્શન્સ",
  optB: "20 કનેક્શન્સ",
  optC: "100 કનેક્શન્સ",
  optD: "અમર્યાદિત (Unlimited)",
  ans: "B",
  exp: "ક્લાયન્ટ ઓએસમાં લાયસન્સિંગ મર્યાદા હેઠળ કર્નલ-લેવલ પર હાર્ડ-કોડેડ મહત્તમ 20 સમવર્તી ઇનબાઉન્ડ કનેક્શન્સની સીમા હોય છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "Windows Server 2025 ના કયા ક્રાંતિકારી ફીચર દ્વારા સર્વરને રીબૂટ કર્યા વિના મેમરીમાં સુરક્ષા પેચ લાગુ કરી શકાય છે?",
  optA: "#hl-yellow[Storage Spaces Direct]",
  optB: "#hl-yellow[Hotpatching]",
  optC: "Hyper-V Live Migration",
  optD: "DirectAccess",
  ans: "B",
  exp: "#hl-yellow[Hotpatching] દ્વારા સર્વર રીબૂટ કર્યા વિના રનિંગ પ્રોસેસિસની મેમરીમાં સિક્યુરિટી પેચ લાગુ કરવામાં આવે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "Windows 2000 Server થી Windows Server 2022 સુધી Active Directory (ntds.dit) નો ડિફોલ્ટ પેજ સાઇઝ શું હતો, અને Server 2025 માં તેને વધારીને કેટલો કરવામાં આવ્યો?",
  optA: "4 KB થી વધારીને 16 KB",
  optB: "8 KB થી વધારીને 32 KB",
  optC: "16 KB થી વધારીને 64 KB",
  optD: "32 KB થી વધારીને 128 KB",
  ans: "B",
  exp: "Server 2025 માં 25 વર્ષ પછી AD ડેટાબેઝ પેજ સાઇઝ 8 KB થી વધારીને 32 KB કરવામાં આવ્યો છે જેનાથી ક્વેરી સ્પીડ 300% ઝડપી બને છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "Windows Server 2025 Standard એડિશનના એક સત્તાવાર લાયસન્સ પર હોસ્ટ મશીન પર મહત્તમ કેટલી વર્ચ્યુઅલ મશીનો (VMs) ચલાવી શકાય છે?",
  optA: "માત્ર 1 VM",
  optB: "મહત્તમ 2 VMs",
  optC: "મહત્તમ 8 VMs",
  optD: "અમર્યાદિત (Unlimited)",
  ans: "B",
  exp: "Standard એડિશનમાં પ્રતિ લાયસન્સ મહત્તમ 2 VMs ની મંજૂરી હોય છે, જ્યારે Datacenter એડિશનમાં અમર્યાદિત VMs ની પરવાનગી મળે છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'Client OS (Windows 11) અને Server OS (Server 2025) ના ઇન્ટરનલ ટાસ્ક શેડ્યૂલરમાં શું તફાવત હોય છે?'",
  a: "જવાબ: Client OS નું થ્રેડ શેડ્યૂલર 'Foreground Applications' (જેમ કે બ્રાઉઝર, ગેમ્સ, MS ઓફિસ) ને ઉચ્ચ પ્રાથમિકતા આપે છે જેથી યુઝરને સ્ક્રીન પર કોઈ લેગ ન દેખાય. તેનાથી વિપરીત, Server OS નું શેડ્યૂલર 'Background Services and Network I/O' ને સર્વોચ્ચ પ્રાથમિકતા આપે છે જેથી સેંકડો ક્લાયન્ટ્સની નેટવર્ક વિનંતીઓ કોઈપણ વિલંબ વગર પ્રોસેસ થઈ શકે.",
  tip: "Wipro અને Infosys ના L1 Desktop Support/SysAdmin રાઉન્ડમાં આ પ્રશ્ન ખૂબ જ લોકપ્રિય છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'Windows Server 2025 Standard અને Datacenter એડિશનમાં લાયસન્સિંગના દ્રષ્ટિકોણથી સૌથી મોટો તફાવત શું છે?'",
  a: "જવાબ: Standard એડિશનમાં એક લાયસન્સ હેઠળ ફિઝિકલ હોસ્ટ મશીન પર મહત્તમ 2 વર્ચ્યુઅલ મશીનો (VMs) ચલાવવાનો અધિકાર મળે છે, જ્યારે Datacenter એડિશનમાં તે જ હોસ્ટ હાર્ડવેર પર અમર્યાદિત (Unlimited) વિન્ડોઝ સર્વર વર્ચ્યુઅલ મશીનો ચલાવવાની મંજૂરી હોય છે.",
  tip: "વર્ચ્યુઅલાઇઝેશન આર્કિટેક્ટ અને સિસ્ટમ એડમિનિસ્ટ્રેટર બંને માટે આ પાયાનો પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'Windows Server 2025 માં 32KB AD DS ડેટાબેઝ પેજ સાઇઝથી એન્ટરપ્રાઇઝને કયો સીધો ફાયદો થાય છે?'",
  a: "જવાબ: 25 વર્ષ સુધી ntds.dit નો પેજ સાઇઝ 8 KB રહ્યો હતો. 32 KB પેજ સાઇઝ હોવાથી એક જ ડિસ્ક I/O ઓપરેશનમાં ચાર ગણો વધુ ડિરેક્ટરી ડેટા મેમરીમાં લોડ થાય છે. આનાથી હજારો કર્મચારીઓ ધરાવતી એન્ટરપ્રાઇઝમાં #hl-orange[Kerberos] ઓથેન્ટિકેશન અને LDAP સર્ચ ક્વેરીઝમાં 300% થી વધુ ઝડપ પ્રાપ્ત થાય છે.",
  tip: "Server 2025 ના નવીનતમ આર્કિટેક્ચર સાથે જોડાયેલો આ પ્રશ્ન L2/L3 ઇન્ટરવ્યુમાં તમારી ઊંડી તકનીકી નિપુણતા સાબિત કરે છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: '#hl-green[Azure Arc] હાઇબ્રિડ મોડેલ શું છે અને તે ઓન-પ્રિમાઇસિસ વિન્ડોઝ સર્વર્સને ક્લાઉડ સાથે કેવી રીતે જોડે છે?'",
  a: "જવાબ: #hl-green[Azure Arc] એક બ્રિજ તરીકે કાર્ય કરે છે જે ડેટા સેન્ટર અથવા લોકલ લેબમાં ચાલતા ફિઝિકલ કે વર્ચ્યુઅલ સર્વર્સને Azure Resource Manager સાથે જોડી દે છે. આનાથી એડમિનિસ્ટ્રેટર્સ Azure પોર્ટલ પરથી જ ઓન-પ્રિમ સર્વર્સ પર સુરક્ષા નીતિઓ, ઇનસાઇટ્સ અને #hl-yellow[Hotpatching] લાગુ કરી શકે છે.",
  tip: "TCS, Accenture અને Cognizant માં હાઇબ્રિડ ક્લાઉડ પ્રોજેક્ટ્સ માટે આ સવાલ વારંવાર પૂછવામાં આવે છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 01 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - સર્વર્સ 24/7/365 બેકગ્રાઉન્ડ સર્વિસિસ અને ક્લાયન્ટ વિનંતીઓને પ્રોસેસ કરવા માટે ઑપ્ટિમાઇઝ્ડ હોય છે.
      - વિન્ડોઝ સર્વર 2000 માં એક્ટિવ ડિરેક્ટરીનો જન્મ થયો હતો; 2025 સંસ્કરણ 32KB AD DB અને #hl-yellow[Hotpatching] સાથે તેનું સૌથી આધુનિક સ્વરૂપ છે.
      - પ્રોડક્શનમાં હંમેશા #hl-yellow[Server Core] ને પ્રાથમિકતા આપવામાં આવે છે, જ્યારે લેબમાં શીખવા માટે Desktop Experience અનિવાર્ય છે.
    ]
  ]
)

#pagebreak()
