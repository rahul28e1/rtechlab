// =============================================================================
// CHAPTER 11: IIS 10.X WEB SERVER, SECURE FTP & REMOTE DESKTOP SERVICES (RDS)
// =============================================================================

[#metadata("ch11") <chapter-11>]

#chapter-header(
  chapter-num: "CHAPTER 11",
  category: "ભાગ 11 : વેબ એપ્લિકેશન્સ અને રિમોટ ડેસ્કટોપ સેવાઓ (IIS & RDS)",
  title: "IIS વેબ સર્વર, સિક્યોર FTP અને રિમોટ ડેસ્કટોપ સર્વિસિસ (RDS)",
  subtitle: "IIS 10.x રોલ · આંતરિક પોર્ટલ · SSL/TLS સર્ટિફિકેટ બાઇન્ડિંગ HTTPS · સિક્યોર FTP સર્વર · રિમોટ ડેસ્કટોપ સર્વિસિસ (RDS / VDI) આર્કિટેક્ચર"
)

=== 11.1 Internet Information Services (IIS 10.x) રોલ અને આંતરિક પોર્ટલ
દરેક બહુરાષ્ટ્રીય કંપની (MNC) તેના આંતરિક કર્મચારીઓ માટે ઇન્ટ્રાનેટ પોર્ટલ, પે-રોલ એપ્સ, ટિકિટિંગ ટૂલ્સ અને ડોક્યુમેન્ટ્સ ડિરેક્ટરી ચલાવે છે.

#mark-yellow[Internet Information Services (IIS) એ માઇક્રોસોફ્ટનું ફ્લેગશિપ વેબ અને FTP સર્વર એન્જિન છે જે વિન્ડોઝ સર્વર પર ASP.NET, PHP, HTML5 અને સુરક્ષિત વેબ સેવાઓને ઉચ્ચ ગતિ અને એન્ટરપ્રાઇઝ સુરક્ષા સાથે હોસ્ટ કરે છે.]

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/iis_rds_architecture.png", width: 55%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 11.1: IIS 10.x વેબ સર્વર અને રિમોટ ડેસ્કટોપ સર્વિસિસ (RDS) એન્ટરપ્રાઇઝ આર્કિટેક્ચર]
]

#v(4pt)

*IIS 10.x ઇન્સ્ટોલેશન સ્ટેપ્સ:*
1. #hl-yellow[Server Manager] માં જાઓ -> #hl-green[Add Roles and Features] પર ક્લિક કરો.
2. Server Roles માં #mark-yellow[Web Server (IIS)] ચેકબોક્સ પર ટિક કરો.
3. 'Role Services' માં ખાતરી કરો કે #hl-green[Default Document], #hl-green[Directory Browsing], #hl-green[HTTP Errors], #hl-green[HTTP Redirection], અને #hl-green[FTP Server] પસંદ થયેલ છે.
4. 'Install' પર ક્લિક કરો. ઇન્સ્ટોલેશન પછી બ્રાઉઝરમાં `http://localhost/` ખોલતાં વાદળી રંગનું સત્તાવાર IIS વેલકમ પેજ પ્રદર્શિત થશે.

#v(6pt)

=== 11.2 નવી વેબસાઇટ બનાવવી, પોર્ટ બાઇન્ડિંગ્સ અને વર્ચ્યુઅલ ડિરેક્ટરી
1. Tools મેનૂમાંથી #hl-yellow[Internet Information Services (IIS) Manager] ખોલો (અથવા રનમાં ટાઇપ કરો: #mark-green[`inetmgr`]).
2. ડાબી પેનલમાં `Sites` પર રાઇટ-ક્લિક કરો -> #hl-green[Add Website...] પસંદ કરો.
3. #text(weight: "bold")[Site name:] `RTechLab-Portal`.
4. #text(weight: "bold")[Physical path:] તે ફોલ્ડર જ્યાં તમારી વેબસાઇટની HTML ફાઇલો આવેલી છે (દા.ત. `C:\inetpub\wwwroot\portal`).
5. #text(weight: "bold")[Binding:] Type: `http`, IP address: `All Unassigned` (અથવા `192.168.1.10`), Port: `80`. Host name: #hl-green[`portal.corp.rtechlab.local`].
6. 'OK' દબાવો. હવે આપણા DNS સર્વરમાં `portal` નામનો CNAME રેકોર્ડ પહેલેથી જ હોવાથી સમગ્ર નેટવર્કનું કોઈપણ કમ્પ્યુટર બ્રાઉઝરમાં `http://portal.corp.rtechlab.local` ખોલીને કંપનીના પોર્ટલ સુધી પહોંચી શકે છે!

#v(6pt)

=== 11.3 SSL/TLS HTTPS સર્ટિફિકેટ બાઇન્ડિંગ (#hl-green[Port 443])
પ્રોડક્શન વાતાવરણમાં કોઈપણ વેબ પોર્ટલ એન્ક્રિપ્શન વગર (HTTP #hl-green[Port 80]) ચલાવવામાં આવતું નથી:
- Server Certificates વિઝાર્ડમાં જઈને એન્ટરપ્રાઇઝ CA (Certificate Authority) અથવા સેલ્ફ-સાઇન્ડ સર્ટિફિકેટ જનરેટ કરો.
- Site Bindings માં જાઓ -> #hl-green[Add...] -> Type: #mark-yellow[https], Port: #hl-green[443], SSL certificate: `RTechLab-SSL-Cert` પસંદ કરીને 'OK' કરો.
- હવે વેબસાઇટ #hl-green[`https://portal.corp.rtechlab.local`] પર 256-બીટ TLS એન્ક્રિપ્શન સાથે સંપૂર્ણપણે સુરક્ષિત ચાલશે.

#v(6pt)

=== 11.4 સિક્યોર FTP સર્વર અને યુઝર આઇસોલેશન (FTP User Isolation)
જ્યારે ડેવલપર્સ અથવા બાહ્ય વેન્ડર્સને સર્વર પર મોટી ડેટા ફાઇલો અપલોડ કરવાની હોય છે, ત્યારે FTP નો ઉપયોગ કરવામાં આવે છે:
- IIS Manager માં Sites -> #hl-yellow[Add FTP Site...] પસંદ કરો.
- Authentication માં #hl-green[Basic], Authorization માં 'Specified users' (`corp\developers`) ને 'Read & Write' અધિકારો આપો.
- #text(weight: "bold", fill: rtech-navy)[User Isolation:] આ સુનિશ્ચિત કરે છે કે જ્યારે વપરાશકર્તા 'rpatel' FTP થી કનેક્ટ થાય, ત્યારે તે માત્ર પોતાના અંગત ફોલ્ડરને (`C:\FTPROOT\LocalUser\rpatel`) જ જોઈ શકે અને અન્ય કર્મચારીઓનો ડેટા તેના માટે અદ્રશ્ય રહે.

#v(6pt)

=== 11.5 રિમોટ ડેસ્કટોપ સર્વિસિસ (RDS / VDI) આર્કિટેક્ચર
જ્યારે કોઈ કંપનીમાં 5,000 રિમોટ કર્મચારીઓ ઘરેથી કામ કરતા હોય, ત્યારે તેમને મોંઘા લેપટોપ આપવાને બદલે સર્વર પર કેન્દ્રિય વર્ચ્યુઅલ ડેસ્કટોપ પ્રદાન કરવામાં આવે છે:

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[RDS ના 5 મુખ્ય આર્કિટેક્ચરલ રોલ્સ (MNC Interview Goldmine):]\
    - #text(weight: "bold", fill: rtech-blue)[1. RD Web Access:] વેબ બ્રાઉઝર પોર્ટલ જેના દ્વારા કર્મચારીઓ પોતાના ઘરના કોઈપણ લેપટોપથી લોગિન કરીને કોર્પોરેટ RemoteApps અને ડેસ્કટોપ એક્સેસ કરી શકે છે.
    - #text(weight: "bold", fill: rtech-rose)[2. RD Gateway:] બાહ્ય ઇન્ટરનેટ પરથી આવતા RDP ટ્રાફિકને #hl-orange[HTTPS (#hl-green[Port 443])] ની અંદર એન્કેપ્સ્યુલેટ કરે છે, જેથી VPN વગર પણ ફાયરવોલ પાર કરી શકાય છે.
    - #text(weight: "bold", fill: rtech-amber)[3. RD Connection Broker:] જ્યારે કર્મચારીનું ઇન્ટરનેટ કપાઈને ફરીથી જોડાય છે, ત્યારે તે વપરાશકર્તાને તેના જૂના સક્રિય સત્ર (Active Session) સાથે પુનઃજોડાણ કરાવે છે અને સર્વર્સ પર લોડ બેલેન્સ કરે છે.
    - #text(weight: "bold", fill: rtech-emerald)[4. RD Session Host (RDSH):] તે મુખ્ય શક્તિશાળી સર્વર જે એક સાથે 50 થી 100 વપરાશકર્તાઓના ડેસ્કટોપ સત્રો અને એપ્લિકેશન્સ ચલાવે છે.
    - #text(weight: "bold", fill: rtech-navy)[5. RD Licensing Server:] ક્લાયન્ટ એક્સેસ લાયસન્સ (CALs - Per-User અથવા Per-Device) ટ્રેક અને માન્ય કરે છે.
  ]
)

#v(8pt)

// =============================================================================
// CHAPTER 11 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  IIS 10.x માં દરેક વેબસાઇટ એક સ્વતંત્ર #hl-yellow[Application Pool] હેઠળ ચાલે છે જેની પોતાની અલગ વર્કર પ્રોસેસ (`w3wp.exe`) હોય છે. જો સર્વર પર 20 વેબસાઇટ્સ ચાલતી હોય અને કોઈ એક વેબસાઇટનો કોડ ક્રેશ કે મેમરી લીક થાય, તો માત્ર તે 1 જ વેબસાઇટ બંધ થશે; બાકીની 19 વેબસાઇટ્સ કોઈપણ વિક્ષેપ વગર 100% સુચારુ રીતે ચાલુ રહેશે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 11 સ્વાધ્યાય બહુવિકલ્પી પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "માઇક્રોસોફ્ટના Internet Information Services (IIS) કન્સોલને સીધું ખોલવાનો રન કમાન્ડ કયો છે?",
  optA: "iis.msc",
  optB: "inetmgr",
  optC: "webmgmt.cpl",
  optD: "services.msc",
  ans: "B",
  exp: "inetmgr (Internet Information Services Manager) એ IIS નું સત્તાવાર મેનેજમેન્ટ શોર્ટકટ છે."
)

#v(2pt)

#mcq-item(
  num: "2",
  q: "IIS વેબ સર્વરમાં સુરક્ષિત એન્ક્રિપ્ટેડ HTTPS વેબસાઇટ્સ ચલાવવા માટે કયા સત્તાવાર IANA પોર્ટ નંબરનો ઉપયોગ થાય છે?",
  optA: "પોર્ટ 80",
  optB: "પોર્ટ 443",
  optC: "પોર્ટ 3389",
  optD: "પોર્ટ 8080",
  ans: "B",
  exp: "HTTP પોર્ટ 80 પર ચાલે છે જ્યારે સુરક્ષિત SSL/TLS એન્ક્રિપ્શન પોર્ટ 443 પર ચાલે છે."
)

#v(2pt)

#mcq-item(
  num: "3",
  q: "રિમોટ ડેસ્કટોપ સર્વિસિસ (RDS) માં કયો રોલ RDP ટ્રાફિકને HTTPS (પોર્ટ 443) ની અંદર એન્કેપ્સ્યુલેટ કરીને ઇન્ટરનેટથી સુરક્ષિત એક્સેસ આપે છે?",
  optA: "RD Session Host",
  optB: "RD Gateway",
  optC: "RD Connection Broker",
  optD: "RD Licensing",
  ans: "B",
  exp: "RD Gateway બાહ્ય ઇન્ટરનેટથી RDP ઓવર HTTPS (443) ટનલ બનાવીને ફાયરવોલને સુરક્ષિત રીતે પાર કરે છે."
)

#v(2pt)

#mcq-item(
  num: "4",
  q: "IIS માં અલગ-અલગ વેબસાઇટ્સને એકબીજાના ક્રેશ થવાથી બચાવવા માટે કઈ આઇસોલેશન પદ્ધતિનો ઉપયોગ થાય છે?",
  optA: "Hyper-V VM",
  optB: "Application Pool (w3wp.exe)",
  optC: "NTFS Quota",
  optD: "DNS Scavenging",
  ans: "B",
  exp: "Application Pools દરેક વેબ એપને સ્વતંત્ર વર્કર પ્રોસેસમાં આઇસોલેટ રાખે છે."
)

#v(2pt)

#mcq-item(
  num: "5",
  q: "FTP સર્વરમાં દરેક વપરાશકર્તાને માત્ર તેના પોતાના વિશિષ્ટ અંગત ફોલ્ડર સુધી સીમિત રાખવા માટે કયું ફીચર સક્ષમ કરવામાં આવે છે?",
  optA: "Anonymous Authentication",
  optB: "FTP User Isolation",
  optC: "Directory Browsing",
  optD: "IP Filtering",
  ans: "B",
  exp: "FTP User Isolation વપરાશકર્તાઓને અન્ય કર્મચારીઓની ડિરેક્ટરીઓ જોવાથી સંપૂર્ણપણે અટકાવે છે."
)

#v(4pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોચના MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(2pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'IIS માં Application Pool Recycle શું છે, અને તે શા માટે જરૂરી છે?'",
  a: "જવાબ: સમય જતાં વેબ એપ્લિકેશન્સમાં મેમરી લીક્સ અથવા અનકલેક્ટેડ ઓબ્જેક્ટ્સ જમા થઈ શકે છે. Application Pool Recycle અંતર્ગત IIS જૂની વર્કર પ્રોસેસ (w3wp.exe) ને યોગ્ય રીતે બંધ કરીને એક નવી ક્લીન પ્રોસેસ શરૂ કરે છે. 'Overlapped Recycling' ના કારણે વર્તમાન વપરાશકર્તાઓનું કનેક્શન તૂટ્યા વગર બેકગ્રાઉન્ડમાં મેમરી તરત જ ક્લિયર થઈ જાય છે.",
  tip: "Wipro, Cognizant અને Infosys ના વેબ સર્વર સપોર્ટ ઇન્ટરવ્યુમાં આ પ્રશ્ન વારંવાર પૂછવામાં આવે છે."
)

#v(2pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'RD Gateway અને પરંપરાગત કોર્પોરેટ VPN વચ્ચે શું તફાવત છે?'",
  a: "જવાબ: VPN ક્લાયન્ટ લેપટોપને સમગ્ર કોર્પોરેટ નેટવર્કનો IP અસાઇન કરે છે જેથી જો લેપટોપ સંક્રમિત હોય તો આખા નેટવર્કમાં વાયરસ ફેલાઈ શકે છે. આનાથી વિપરીત RD Gateway માત્ર પોર્ટ 443 પર ચોક્કસ RDP સત્રની જ પરવાનગી આપે છે; ક્લાયન્ટ ક્યારેય કોર્પોરેટ નેટવર્ક સાથે સીધું જોડાતું નથી, માત્ર સ્ક્રીન પિક્સેલ્સ જ સ્ટ્રીમ થાય છે (Zero Trust અભિગમ).",
  tip: "આ આધુનિક સાયબર સુરક્ષા અને રિમોટ વર્ક આર્કિટેક્ચરનો શ્રેષ્ઠ ઉત્તર છે."
)

#v(2pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'એક જ IIS સર્વર અને એક જ IP એડ્રેસ પર 5 અલગ-અલગ વેબસાઇટ્સ કેવી રીતે હોસ્ટ કરી શકાય?'",
  a: "જવાબ: 'Host Headers' (અથવા Hostname Bindings) દ્વારા. IIS માં તમામ સાઇટ્સને IP 192.168.1.10 અને પોર્ટ 80 આપવામાં આવે છે, પરંતુ Host Name અલગ-અલગ રાખવામાં આવે છે (દા.ત. site1.corp.local, site2.corp.local). જ્યારે વપરાશકર્તા રિક્વેસ્ટ મોકલે છે, ત્યારે IIS HTTP હેડરમાં આવતા ડોમેન નામને જોઈને સાચી સાઇટનું વેબ પેજ પરત આપે છે.",
  tip: "વેબ હોસ્ટિંગ અને સર્વર કન્સોલિડેશનનો આ ક્લાસિક ફંડામેન્ટલ પ્રશ્ન છે."
)

#v(2pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'RDS માં Per-User CAL અને Per-Device CAL વચ્ચે શું તફાવત છે?'",
  a: "જવાબ: Per-User CAL એક ચોક્કસ કર્મચારીને આપવામાં આવે છે પછી ભલે તે લેપટોપ, ફોન કે ઘરના પીસીથી RDS કનેક્ટ કરે (શિફ્ટ કર્મચારીઓ કે ફિલ્ડ વર્કર્સ માટે શ્રેષ્ઠ). Per-Device CAL એક ચોક્કસ કમ્પ્યુટરને આપવામાં આવે છે પછી ભલે તેના પર 24 કલાકમાં 3 અલગ-અલગ શિફ્ટના કર્મચારીઓ લોગિન કરે (કૉલ સેન્ટર કે હોસ્પિટલ રિસેપ્શન માટે શ્રેષ્ઠ).",
  tip: "લાયસન્સિંગ અને ઇન્ફ્રાસ્ટ્રક્ચર બજેટિંગના ઇન્ટરવ્યુઝનો આ મહત્વપૂર્ણ પ્રશ્ન છે."
)

#v(2pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'HTTP Error 503: Service Unavailable આવવાનું સૌથી મુખ્ય કારણ શું હોય છે?'",
  a: "જવાબ: Error 503 નું 95% કેસોમાં મુખ્ય કારણ તે વેબસાઇટ સાથે જોડાયેલ 'Application Pool' નું ક્રેશ અથવા 'Stopped' અવસ્થામાં હોવું છે (જેમ કે ખોટા સર્વિસ એકાઉન્ટ ક્રેડેન્શિયલ્સ અથવા સતત અનહેન્ડલ્ડ એક્સેપ્શન્સના કારણે રેપિડ-ફેલ પ્રોટેક્શન ટ્રિગર થવું). IIS Manager માં જઈને App Pool ને 'Start' કરવું એ આનો પ્રાથમિક ઉકેલ છે.",
  tip: "L1/L2 વેબ સપોર્ટમાં આ સૌથી સામાન્ય ટ્રબલશૂટિંગ પરિસ્થિતિ છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 11 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - IIS 10.x એન્ટરપ્રાઇઝ વેબ પોર્ટલ્સને Application Pools દ્વારા સુરક્ષિત અને આઇસોલેટેડ રાખે છે.
      - RD Gateway પોર્ટ 443 પર ભારે VPN વગર સુરક્ષિત રિમોટ વર્ક અને VDI એક્સેસ પ્રદાન કરે છે.
      - Host Headers એક જ IP અને પોર્ટ પર બહુવિધ કોર્પોરેટ વેબસાઇટ્સ ચલાવવાની સુવિધા આપે છે.
    ]
  ]
)

#pagebreak()
