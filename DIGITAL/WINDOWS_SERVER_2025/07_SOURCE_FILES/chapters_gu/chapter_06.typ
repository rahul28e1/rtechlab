// =============================================================================
// CHAPTER 06: CLIENT DOMAIN JOIN & AUTHENTICATION WALKTHROUGH
// =============================================================================

[#metadata("ch6") <chapter-6>]

#chapter-header(
  chapter-num: "CHAPTER 06",
  category: "ભાગ 6 : એન્ડપોઇન્ટ એકીકરણ અને ઓથેન્ટિકેશન (Client Domain Join & Authentication)",
  title: "ક્લાયન્ટ મશીન (Windows 10/11) ને ડોમેન સાથે જોડવું (Domain Join Walkthrough)",
  subtitle: "ક્લાયન્ટ પૂર્વ-જરૂરિયાતો · ક્લાયન્ટ DNS IP મેપિંગ નિયમ · નેટવર્ક કનેક્ટિવિટી અને nslookup ટેસ્ટ · વર્કગ્રુપથી ડોમેન માઇગ્રેશન · ટોપ 5 એરર્સ અને ફિક્સ · પ્રથમ ડોમેન લોગિન"
)

=== 6.1 ક્લાયન્ટ વર્કસ્ટેશનની પૂર્વ-જરૂરિયાતો (Client Prerequisites)
#hl-yellow[ડોમેન કંટ્રોલર] અને યુઝર એકાઉન્ટ્સ તૈયાર થયા પછી, આગળનું પગલું કર્મચારીના લેપટોપ/ડેસ્કટોપને #hl-yellow[એક્ટિવ ડિરેક્ટરી] ડોમેન સાથે જોડવાનું છે જેથી તેના પર કેન્દ્રીય નીતિઓ અને સુરક્ષા લાગુ કરી શકાય.

#warning-box(title: "વિન્ડોઝ એડિશન પ્રતિબંધ (Windows Home Edition Trap)")[
  Microsoft Windows 10/11 #hl-orange[Home Edition ને ક્યારેય #hl-yellow[એક્ટિવ ડિરેક્ટરી] ડોમેન સાથે જોડી શકાતું નથી.] ડોમેન જોઈન કરવા માટે ક્લાયન્ટ મશીન પર #mark-green[Windows 10/11 Pro, Enterprise, અથવા Education] સંસ્કરણ હોવું ફરજિયાત છે.
]

#v(4pt)
*લેબમાં ક્લાયન્ટ મશીનનું સ્પેસિફિકેશન:*
- VM નામ: #hl-yellow[`CLT-WIN11-01`]
- ઓપરેટિંગ સિસ્ટમ: Windows 11 Pro 64-bit
- નેટવર્ક એડેપ્ટર: Internal Network (એ જ નેટવર્ક ફેબ્રિક જેના પર `SRV-2025-DC01` ચાલે છે)

#v(6pt)

=== 6.2 ક્લાયન્ટ પર DNS IP ને #hl-yellow[ડોમેન કંટ્રોલર] પર પોઇન્ટ કરવું (The #1 Golden Rule)
નવા વિદ્યાર્થીઓ અને જુનિયર આઇટી સપોર્ટ એન્જિનિયર્સ દ્વારા કરવામાં આવતી 99% ભૂલો અહીં થાય છે:

#mark-yellow[ક્લાયન્ટ મશીન જ્યાં સુધી તેના નેટવર્ક એડેપ્ટરના 'Preferred DNS Server' માં #hl-yellow[ડોમેન કંટ્રોલર]નો IP એડ્રેસ દાખલ ન કરે, ત્યાં સુધી તે #hl-yellow[એક્ટિવ ડિરેક્ટરી] ડોમેનને ક્યારેય શોધી શકશે નહીં!]

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/domain_join_flow.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 6.1: ક્લાયન્ટ મશીન ડોમેન જોઈન 5-ચરણીય જીવન ચક્ર — DNS મેપિંગ, ડિસ્કવરી, ઓથેન્ટિકેશન અને પ્રથમ લોગિન]
]

#v(4pt)

*ક્લાયન્ટ નેટવર્ક સેટિંગ્સ:*
1. ક્લાયન્ટ મશીન પર Run (`Win + R`) ખોલો અને ટાઇપ કરો: #hl-green[`ncpa.cpl`].
2. Ethernet એડેપ્ટર Properties -> #hl-yellow[Internet Protocol Version 4 (TCP/IPv4)] -> Properties માં જાઓ.
3. IP Address: #hl-green[`192.168.1.50`]
4. Subnet Mask: #hl-green[`255.255.255.0`]
5. Default Gateway: #hl-green[`192.168.1.1`]
6. #text(weight: "bold", fill: rtech-navy)[Preferred DNS Server:] #mark-orange[`192.168.1.10`] (આપણા DC સર્વરનો IP).

#v(6pt)

=== 6.3 નેટવર્ક કનેક્ટિવિટી અને DNS રિઝોલ્યુશન ટેસ્ટ (Pre-flight Checks)
ડોમેન જોઈન વિઝાર્ડ શરૂ કરતા પહેલા કમાન્ડ પ્રોમ્પ્ટમાં બે ઝડપી ટેસ્ટ કરવા ફરજિયાત છે:

1. #text(weight: "bold")[Ping કનેક્ટિવિટી ટેસ્ટ:]
```cmd
ping 192.168.1.10
```
જો Reply મળી રહ્યો હોય, તો ફિઝિકલ/વર્ચ્યુઅલ નેટવર્ક કનેક્શન 100% બરાબર છે.

2. #text(weight: "bold")[DNS અને SRV રેકોર્ડ રિઝોલ્યુશન ટેસ્ટ:]
```cmd
nslookup corp.rtechlab.local
```
જો જવાબોમાં Server: `SRV-2025-DC01.corp.rtechlab.local` અને Address: `192.168.1.10` દેખાય, તો તેનો અર્થ એ છે કે ક્લાયન્ટ હવે #hl-yellow[ડોમેન કંટ્રોલર]ને શોધવામાં સંપૂર્ણપણે સક્ષમ છે.

#v(6pt)

=== 6.4 વર્કગ્રુપમાંથી ડોમેનમાં માઇગ્રેશન વિઝાર્ડ (Full Join Walkthrough)
1. ક્લાયન્ટ મશીન પર Run (`Win + R`) ખોલો અને ટાઇપ કરો: #hl-green[`sysdm.cpl`] (System Properties).
2. 'Computer Name' ટેબ પર નીચે સ્થિત #hl-yellow['Change...'] બટન પર ક્લિક કરો.
3. Computer name માં લખો: #hl-yellow[`CLT-WIN11-01`].
4. 'Member of' વિભાગમાં 'Workgroup' માંથી બદલીને #mark-yellow[Domain] રેડિયો બટન પસંદ કરો.
5. ડોમેન નામ બોક્સમાં દાખલ કરો: #hl-green[`corp.rtechlab.local`] અને 'OK' દબાવો.
6. સ્ક્રીન પર ક્રેડેન્શિયલ પ્રોમ્પ્ટ (Windows Security) ખુલશે. ડોમેન એડમિનના ક્રેડેન્શિયલ્સ દાખલ કરો:
   - Username: #hl-yellow[`corp.rtechlab.local\Administrator`] (અથવા ફક્ત `Administrator`)
   - Password: #hl-green[`P@ssw0rd2025!`]
7. 5 થી 10 સેકન્ડમાં એક સુંદર પોપ-અપ સંદેશ આવશે:
   #align(center)[#box(fill: rgb("#DCFCE7"), stroke: 1pt + rgb("#86EFAC"), radius: 4pt, inset: 6pt)[
     #text(size: 9pt, weight: "black", fill: rgb("#166534"))[✓ Welcome to the corp.rtechlab.local domain.]
   ]]
8. 'OK' દબાવો -> 'You must restart your computer to apply these changes' -> #hl-green['Restart Now'] પર ક્લિક કરો.

#v(6pt)

=== 6.5 ડોમેન જોઈનિંગ વખતે આવતી ટોપ 5 એરર્સ અને તેમનું સચોટ નિવારણ
પ્રોડક્શન અને ઇન્ટરવ્યુ બંનેમાં ડોમેન જોઈનિંગ એરર્સ ખૂબ સામાન્ય છે:

1. #text(weight: "bold", fill: rtech-rose)[એરર 1: 'An Active Directory Domain Controller for the domain could not be contacted':]
   - *કારણ:* ક્લાયન્ટના DNS માં #hl-yellow[ડોમેન કંટ્રોલર]નો IP નથી (ક્લાયન્ટ સાર્વજનિક Google DNS 8.8.8.8 અથવા હોમ વાઇ-ફાઇ રાઉટરનો DNS વાપરી રહ્યો છે).
   - *નિવારણ:* `ncpa.cpl` માં જઈને Preferred DNS ને `192.168.1.10` પર સેટ કરો.
2. #text(weight: "bold", fill: rtech-rose)[એરર 2: 'The network path was not found (0x80070035)':]
   - *કારણ:* #hl-yellow[ડોમેન કંટ્રોલર] પર Windows Firewall દ્વારા SMB (#hl-green[Port 445]) અથવા RPC પોર્ટ્સ બ્લોક છે.
   - *નિવારણ:* DC પર 'File and Printer Sharing' ફાયરવોલ નિયમો સક્ષમ (Enable) કરો.
3. #text(weight: "bold", fill: rtech-rose)[એરર 3: 'There is a time and/or date difference between the client and server':]
   - *કારણ:* ક્લાયન્ટ અને DC ના સમય વચ્ચે 5 મિનિટ કરતાં વધુનો #hl-orange[Kerberos] ટાઇમ ડ્રિફ્ટ (Clock Skew) છે.
   - *નિવારણ:* ક્લાયન્ટની ઘડિયાળ અને ટાઇમ ઝોનને DC સાથે મેળવો અથવા `w32tm /resync` ચલાવો.
4. #text(weight: "bold", fill: rtech-rose)[એરર 4: 'Access is denied':]
   - *કારણ:* જોઈન કરતી વખતે દાખલ કરેલા ક્રેડેન્શિયલ્સ પાસે કમ્પ્યુટર જોડવાનો અધિકાર નથી.
   - *નિવારણ:* Domain Admins ક્રેડેન્શિયલ્સનો ઉપયોગ કરો અથવા લક્ષ્ય OU પર Join Permissions ડેલિગેટ કરો.
5. #text(weight: "bold", fill: rtech-rose)[એરર 5: 'The computer account already exists in the domain':]
   - *કારણ:* એ જ નામે જૂનું કમ્પ્યુટર એકાઉન્ટ ADUC માં પહેલાથી હાજર છે અને તેનો SID મેળ ખાતો નથી.
   - *નિવારણ:* ADUC માં જઈને જૂના કમ્પ્યુટર એકાઉન્ટને ડિલીટ અથવા રીસેટ કરો.

#v(6pt)

=== 6.6 સિસ્ટમ રીસ્ટાર્ટ અને ડોમેન યુઝર એકાઉન્ટથી પ્રથમ લોગિન
રીસ્ટાર્ટ થયા પછી ક્લાયન્ટની લોક સ્ક્રીન બદલાઈ જશે:

1. લોક સ્ક્રીન પર નીચે ડાબી બાજુએ #mark-yellow['Other user'] પર ક્લિક કરો.
2. નીચે લખેલું દેખાશે: *Sign in to: CORP*.
3. Username: #hl-green[`rpatel`] (જે યુઝર આપણે પ્રકરણ 05 માં બનાવ્યો હતો).
4. Password: #hl-green[`Welcome@2025#`].
5. સ્ક્રીન પર તરત સંદેશ આવશે: #text(weight: "bold", fill: rtech-blue)['The user\'s password must be changed before signing in'].
6. 'OK' પર ક્લિક કરો. કર્મચારી પોતાનો નવો વ્યક્તિગત સુરક્ષિત પાસવર્ડ દાખલ કરશે (દા.ત. #hl-green[`MySecurePass@2025`]).
7. વિન્ડોઝ નવી યુઝર પ્રોફાઇલ તૈયાર કરશે (`C:\Users\rpatel`) અને ડેસ્કટોપ ખુલી જશે!
8. ચકાસણી માટે કમાન્ડ પ્રોમ્પ્ટ ખોલો અને ટાઇપ કરો: #hl-green[`whoami`]. સ્ક્રીન પર જવાબ મળશે: #mark-green[`corp\rpatel`].

#v(8pt)

// =============================================================================
// CHAPTER 06 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  જ્યારે કોઈ કમ્પ્યુટર ડોમેન જોઈન કરે છે, ત્યારે કમ્પ્યુટરનું પોતાનું એક ગુપ્ત મશીન ખાતું (Machine Account - `CLT-WIN11-01$`) #hl-yellow[એક્ટિવ ડિરેક્ટરી]માં બને છે. શું તમે જાણો છો કે કમ્પ્યુટર અને ડોમેન કંટ્રોલર વચ્ચેનો સિક્યોર્ડ ચેનલ પાસવર્ડ દર #hl-yellow[30 દિવસમાં બેકગ્રાઉન્ડમાં આપોઆપ બદલાય છે]? જો કોઈ કમ્પ્યુટર 90 દિવસથી વધુ સમય માટે નેટવર્કથી ડિસ્કનેક્ટ રહે, તો આ ટ્રસ્ટ રિલેશનશિપ તૂટી જાય છે (Trust Relationship Failed Error)!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 06 પ્રેક્ટિસ બહુવિકલ્પી પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "વિન્ડોઝની કઈ આવૃત્તિને #hl-yellow[એક્ટિવ ડિરેક્ટરી] ડોમેન સાથે જોડવાની મંજૂરી હોતી નથી?",
  optA: "Windows 11 Enterprise",
  optB: "Windows 11 Pro",
  optC: "Windows 11 Home Edition",
  optD: "Windows 11 Education",
  ans: "C",
  exp: "Windows Home Edition માં કોર્પોરેટ ડોમેન જોઈનિંગ અને ગ્રુપ પોલિસીની સુવિધા માઇક્રોસોફ્ટ દ્વારા અક્ષમ રાખવામાં આવે છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "ક્લાયન્ટ કમ્પ્યુટર પર ડોમેન જોઈન કરતી વખતે 'Domain Controller could not be contacted' એરર આવવાનું સૌથી મુખ્ય કારણ શું છે?",
  optA: "ક્લાયન્ટનું કીબોર્ડ ખરાબ હોવું",
  optB: "ક્લાયન્ટના Preferred DNS માં ડોમેન કંટ્રોલરનો IP ન હોવો",
  optC: "ક્લાયન્ટમાં 16 GB રેમ ન હોવી",
  optD: "ગૂગલ ક્રોમ ઇન્સ્ટોલ ન હોવું",
  ans: "B",
  exp: "ક્લાયન્ટ ડોમેન કંટ્રોલરના SRV રેકોર્ડ્સને માત્ર AD DNS સર્વર પર જ શોધી શકે છે; ખોટો DNS હોવા પર જોઈનિંગ નિષ્ફળ જાય છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "વિન્ડોઝમાં સિસ્ટમ પ્રોપર્ટીઝ (System Properties) વિન્ડો ખોલીને કમ્પ્યુટરને ડોમેન સાથે જોડવા માટેનો શોર્ટકટ રન કમાન્ડ કયો છે?",
  optA: "ncpa.cpl",
  optB: "sysdm.cpl",
  optC: "appwiz.cpl",
  optD: "services.msc",
  ans: "B",
  exp: "sysdm.cpl (System Properties) કમ્પ્યુટર રીનેમ અને ડોમેન મેમ્બરશિપ વિન્ડો ખોલે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "ક્લાયન્ટ મશીન પર હાલમાં કયો ડોમેન યુઝર લોગ-ઇન છે તે તપાસવા માટે કયા કમાન્ડનો ઉપયોગ થાય છે?",
  optA: "getmac",
  optB: "whoami",
  optC: "hostname",
  optD: "netstat",
  ans: "B",
  exp: "whoami કમાન્ડ વર્તમાન લોગ-ઇન યુઝરનું ડોમેન અને યુઝરનેમ (દા.ત. corp\\rpatel) દર્શાવે છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "ક્લાયન્ટ કમ્પ્યુટર અને ડોમેન કંટ્રોલર વચ્ચે મશીન એકાઉન્ટનો સિક્રેટ પાસવર્ડ આપોઆપ કેટલા દિવસોમાં બદલાય છે?",
  optA: "7 દિવસ",
  optB: "30 દિવસ",
  optC: "90 દિવસ",
  optD: "365 દિવસ",
  ans: "B",
  exp: "નેટલોગઓન સર્વિસ ડિફોલ્ટ રૂપે પ્રત્યેક 30 દિવસમાં કમ્પ્યુટર એકાઉન્ટનો પાસવર્ડ આપોઆપ બદલે છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'ક્લાયન્ટ મશીન પર એરર આવી રહ્યો છે: 'The trust relationship between this workstation and the primary domain failed.' તેને ફરીથી ડોમેન જોઈન કર્યા વિના કેવી રીતે સુધારશો?'",
  a: "જવાબ: આ એરર ત્યારે આવે છે જ્યારે કમ્પ્યુટરનો મશીન પાસવર્ડ AD માં રહેલા પાસવર્ડ સાથે મેળ ખાતો નથી (જેમ કે સ્નેપશોટ રીસ્ટોર કરવા પર અથવા 30 દિવસથી વધુ ઑફલાઇન રહેવા પર). તેને સુધારવા માટે લોકલ એડમિનથી લોગિન કરીને PowerShell માં ચલાવીશું: 'Reset-ComputerMachinePassword -Credential (Get-Credential)' અથવા 'Test-ComputerSecureChannel -Repair'. આનાથી રીબૂટ કર્યા વિના ટ્રસ્ટ સીધું રીસેટ થઈ જાય છે.",
  tip: "Wipro, Infosys અને HCL ના L2 Desktop Support ઇન્ટરવ્યુમાં આ સવાલ 100% પૂછવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'એક સામાન્ય ડોમેન યુઝર (Non-Admin) ડિફોલ્ટ રૂપે કેટલા કમ્પ્યુટર્સને ડોમેનમાં જોઈન કરાવી શકે છે?'",
  a: "જવાબ: #hl-yellow[એક્ટિવ ડિરેક્ટરી]માં ડિફોલ્ટ રૂપે સામાન્ય 'Authenticated User' ને વધુમાં વધુ 10 કમ્પ્યુટર્સને ડોમેન સાથે જોડવાની (ms-DS-MachineAccountQuota) છૂટ હોય છે. જોકે પ્રોડક્શન સિક્યુરિટી માટે આપણે ADSI Edit માં જઈને આ ક્વોટાને 0 પર સેટ કરીએ છીએ અને માત્ર IT સપોર્ટ ટીમને જ ચોક્કસ OUs પર જોઈનિંગ રાઇટ્સ ડેલિગેટ કરીએ છીએ.",
  tip: "આ ઊંડો આર્કિટેક્ચરલ પ્રશ્ન ઇન્ટરવ્યુઅરને તરત પ્રભાવિત કરે છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'ક્લાયન્ટ મશીન પર Cached Credentials શું હોય છે, અને તેનું સુરક્ષા જોખમ શું છે?'",
  a: "જવાબ: જ્યારે કોઈ કર્મચારી પોતાના લેપટોપને ઓફિસ નેટવર્ક (DC) ની બહાર લઈ જાય છે (Work from Home), ત્યારે પણ તે પોતાના ડોમેન પાસવર્ડથી લોગિન કરી શકે છે કારણ કે વિન્ડોઝ છેલ્લા 10 સફળ લોગિનના પાસવર્ડ હેશ સ્થાનિક રીતે 'Cached Logons' માં સાચવી રાખે છે. સુરક્ષા ઓડિટ્સમાં આપણે GPO દ્વારા આ કેશ્ડ લોગિન્સની સંખ્યાને નિયંત્રિત કરીએ છીએ.",
  tip: "સિક્યુરિટી ઓપરેશન્સ અને રિમોટ વર્કફોર્સ મેનેજમેન્ટનો આ મુખ્ય ઇન્ટરવ્યુ ટોપિક છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'Domain Join પ્રક્રિયા દરમિયાન નેટવર્ક પર કયા પ્રોટોકોલ અને પોર્ટ્સ વપરાય છે?'",
  a: "જવાબ: Domain Join દરમિયાન મુખ્ય પ્રોટોકોલ્સ કાર્ય કરે છે: 1. DNS (Port 53) DC ના SRV રેકોર્ડ્સ શોધવા માટે, 2. #hl-orange[Kerberos] (#hl-green[Port 88]) ક્રેડેન્શિયલ ઓથેન્ટિકેશન માટે, 3. LDAP (#hl-green[Port 389]) કમ્પ્યુટર ઓબ્જેક્ટ બનાવવા માટે, અને 4. SMB (#hl-green[Port 445]) તથા RPC (Port 135) ડિરેક્ટરી અને પોલિસી સંચાર માટે.",
  tip: "નેટવર્કિંગ અને સર્વર ઇન્ફ્રાસ્ટ્રક્ચરના ક્રોસ-ડોમેન જ્ઞાનને ચકાસતો આ ક્લાસિક પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'ક્લાયન્ટ મશીન પર 'Sign in to:' માં ડોમેનને બદલે લોકલ પીસીનું નામ કેવી રીતે લાવી શકાય?'",
  a: "જવાબ: જો આપણે ડોમેનને બદલે ક્લાયન્ટના લોકલ કમ્પ્યુટર એકાઉન્ટથી લોગિન કરવું હોય, તો યુઝરનેમમાં '.\\Administrator' અથવા 'CLT-WIN11-01\\Administrator' ટાઇપ કરીએ છીએ. '.\\' (ડોટ-બેકસ્લેશ) ટાઇપ કરતાં જ સિસ્ટમ આપોઆપ સ્થાનિક મશીનના SAM ડેટાબેઝ પર સ્વિચ થઈ જાય છે.",
  tip: "હેલ્પડેસ્ક અને ડેસ્કટોપ સપોર્ટના ટેકનિકલ ટેસ્ટમાં આ મૂળભૂત યુક્તિ હંમેશા પૂછાય છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 06 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - ક્લાયન્ટનું Preferred DNS સર્વર હંમેશા ડોમેન કંટ્રોલરના IP પર પોઇન્ટ હોવું જોઈએ; તેના વિના ડોમેન ડિસ્કવરી અશક્ય છે.
      - ડોમેન જોઈન થતાં જ કમ્પ્યુટરનું પોતાનું મશીન ખાતું (`CLT-WIN11-01$`) બને છે અને ટ્રસ્ટ ચેનલ 30 દિવસમાં રીન્યૂ થાય છે.
      - `whoami` અને `Test-ComputerSecureChannel` ડોમેન ઓથેન્ટિકેશન ચકાસવાના પ્રાથમિક ટૂલ્સ છે.
    ]
  ]
)

#pagebreak()
