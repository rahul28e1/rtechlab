// =============================================================================
// CHAPTER 09: DNS SERVER ARCHITECTURE: ZONES, RECORDS & SCAVENGING
// =============================================================================

[#metadata("ch9") <chapter-9>]

#chapter-header(
  chapter-num: "CHAPTER 09",
  category: "ભાગ 9 : કોર્પોરેટ નેમ રિઝોલ્યુશન અને DNS (Enterprise Name Resolution)",
  title: "DNS સર્વર આર્કિટેક્ચર: ફોરવર્ડ/રિવર્સ ઝોન, રેકોર્ડ્સ અને સ્કેવેન્જિંગ",
  subtitle: "DNS નું એન્ટરપ્રાઇઝ મહત્વ · AD-ઇન્ટિગ્રેટેડ ઝોન · ફોરવર્ડ vs રિવર્સ લુકઅપ · A, PTR, CNAME, MX અને SRV રેકોર્ડ્સ · રૂટ હિન્ટ્સ vs ફોરવર્ડર્સ · DNS સ્કેવેન્જિંગ"
)

=== 9.1 DNS નું એન્ટરપ્રાઇઝ મહત્વ અને #hl-yellow[એક્ટિવ ડિરેક્ટરી] સાથે અતૂટ સંબંધ
જો #hl-yellow[એક્ટિવ ડિરેક્ટરી] (Active Directory) કોર્પોરેટ નેટવર્કનું *મગજ (Brain)* છે, તો DNS સર્વર તેનું *હૃદય (Heart)* છે. સમગ્ર વિન્ડોઝ ડોમેન એન્વાયરન્મેન્ટમાં કોઈપણ સેવા (Login, #hl-orange[Kerberos], File Sharing, GPO) DNS વગર 1 સેકન્ડ પણ કાર્ય કરી શકતી નથી.

#mark-yellow[ડોમેન નેમ સિસ્ટમ (DNS) એ એક શ્રેણીબદ્ધ અને વિતરિત ડેટાબેઝ સેવા (Hierarchical Distributed Database) છે જે મનુષ્ય દ્વારા વાંચી શકાય તેવા કમ્પ્યુટર નામોને (દા.ત. `portal.corp.rtechlab.local`) નેટવર્ક સમજી શકે તેવા IP સરનામાઓમાં (`192.168.1.50`) અનુવાદિત (Resolve) કરે છે.]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "DNS પોર્ટ્સ અને પ્રોટોકોલ્સ")[
      DNS ડિફૉલ્ટ રૂપે #hl-green[Port 53] પર કાર્ય કરે છે. સામાન્ય નેમ રિઝોલ્યુશન ક્વેરીઝ (< 512 બાઇટ્સ) માટે તે ઝડપી #hl-green[UDP Port 53] નો ઉપયોગ કરે છે, જ્યારે ઝોન ટ્રાન્સફર (Zone Transfer) અને મોટા પેકેટો માટે વિશ્વસનીય #hl-yellow[TCP Port 53] નો ઉપયોગ કરે છે.
    ]
  ],
  [
    #warning-box(title: "SRV રેકોર્ડ્સ: #hl-yellow[એક્ટિવ ડિરેક્ટરી]નો જીવન આધાર")[
      જ્યારે કોઈ ક્લાયન્ટ ડોમેન જોઇન અથવા લોગિન કરે છે, ત્યારે તે #hl-yellow[ડોમેન કંટ્રોલર]નું નામ જાણતો નથી. તે DNS પાસેથી વિશિષ્ટ #hl-orange[SRV રેકોર્ડ્સ] માંગે છે (`_ldap._tcp.dc._msdcs`). જો DNS માં આ રેકોર્ડ્સ ન હોય, તો ડોમેન પ્રમાણીકરણ સંપૂર્ણપણે ઠપ થઈ જાય છે!
    ]
  ]
)

#v(4pt)

=== 9.2 DNS ઝોનના પ્રકારો (Types of DNS Zones)
DNS માં ઝોન એ એવા વહીવટી ભાગને (Database Partition) કહેવાય છે જેના માટે તે DNS સર્વર સત્તાવાર (Authoritative) હોય છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/dns_architecture_zones.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 9.1: એન્ટરપ્રાઇઝ DNS આર્કિટેક્ચર — ફોરવર્ડ/રિવર્સ ઝોન, રિસોર્સ રેકોર્ડ્સ અને સ્કેવેન્જિંગ લાઇફસાયકલ]
]

#v(4pt)

1. #text(weight: "bold", fill: rtech-blue)[Active Directory-Integrated Zone (શ્રેષ્ઠ એન્ટરપ્રાઇઝ વિકલ્પ):] આ ઝોન અલગ ફાઇલમાં સંગ્રહિત થવાને બદલે સીધો #hl-yellow[એક્ટિવ ડિરેક્ટરી] ડેટાબેઝ (`ntds.dit`) માં સ્ટોર થાય છે. તેના 3 અજોડ ફાયદા છે:
   - #hl-green[મલ્ટી-માસ્ટર રેપ્લિકેશન (Multi-Master Replication):] કોઈપણ DC પર રેકોર્ડ બદલો, તે આપમેળે તમામ DCs પર સિંક થઈ જાય છે.
   - #hl-green[સિક્યોર ડાયનામિક અપડેટ્સ (Secure Dynamic Updates):] માત્ર ડોમેનના અધિકૃત કમ્પ્યુટર્સ જ પોતાનો IP રેકોર્ડ રજીસ્ટર કરી શકે છે (હેકર્સ કે અજાણ્યા ઉપકરણો નહીં).
   - #hl-green[એનક્રિપ્ટેડ રેપ્લિકેશન (Encrypted Replication):] સમગ્ર DNS ડેટા #hl-orange[Kerberos] દ્વારા એનક્રિપ્ટ થઈને ટ્રાન્સફર થાય છે.
2. #text(weight: "bold", fill: rtech-navy)[Standard Primary Zone:] આ એક પરંપરાગત ટેક્સ્ટ ફાઇલ (`zone.dns`) માં સંગ્રહિત થાય છે. તેમાં માત્ર પ્રાઇમરી સર્વર જ રેકોર્ડ્સ લખી શકે છે (Single Master).
3. #text(weight: "bold", fill: rtech-navy)[Standard Secondary Zone:] પ્રાઇમરી ઝોનની માત્ર રીડ-ઓન્લી (Read-Only) નકલ. બેકઅપ અને લોડ ડિસ્ટ્રિબ્યુશન માટે ઉપયોગી.
4. #text(weight: "bold", fill: rtech-muted)[Stub Zone:] તેમાં માત્ર NS (Name Server), SOA (Start of Authority) અને ગ્લૂ A રેકોર્ડ્સ હોય છે જેથી અન્ય ડોમેનના અધિકૃત સર્વર્સને ઝડપથી શોધી શકાય.

#v(6pt)

=== 9.3 ફોરવર્ડ લુકઅપ ઝોન વિરુદ્ધ રિવર્સ લુકઅપ ઝોન (Forward vs Reverse Lookup)
- #text(weight: "bold", fill: rtech-navy)[ફોરવર્ડ લુકઅપ ઝોન (#hl-yellow[Forward Lookup Zone]):] કમ્પ્યુટર નામને IP એડ્રેસમાં ફેરવે છે (Name -> IP). જ્યારે તમે બ્રાઉઝરમાં `srv-2025-dc01.corp.rtechlab.local` ટાઇપ કરો છો, ત્યારે ફોરવર્ડ ઝોન `192.168.1.10` પરત કરે છે.
- #text(weight: "bold", fill: rtech-navy)[રિવર્સ લુકઅપ ઝોન (#hl-yellow[Reverse Lookup Zone]):] IP એડ્રેસને કમ્પ્યુટર નામામાં ફેરવે છે (IP -> Name). તે વિશિષ્ટ ઇન-એડ્રેસ આર્પા ડોમેનનો ઉપયોગ કરે છે (દા.ત. `1.168.192.in-addr.arpa`).
  - *રિવર્સ ઝોન શા માટે અનિવાર્ય છે?* #hl-orange[Kerberos] પ્રમાણીકરણમાં SPN માન્યતા (Validation), મેઇલ સર્વર્સમાં સ્પામ બ્લોકિંગથી બચવું, અને કમાન્ડ પ્રોમ્પ્ટમાં `nslookup 192.168.1.10` ચલાવીને હોસ્ટનું સાચું FQDN નામ જાણવા માટે.

#v(6pt)

=== 9.4 આવશ્યક એન્ટરપ્રાઇઝ DNS રેકોર્ડ્સ (Resource Records)
DNS કન્સોલ (`dnsmgmt.msc`) માં 5 સૌથી મહત્વપૂર્ણ રેકોર્ડ્સ હોય છે:

1. #text(weight: "bold", fill: rtech-blue)[Host (A અને AAAA રેકોર્ડ):] Hostname ને IPv4 (A રેકોર્ડ) અથવા IPv6 (AAAA રેકોર્ડ) સરનામા સાથે જોડે છે. દા.ત. `srv-dc01` -> `192.168.1.10`.
2. #text(weight: "bold", fill: rtech-emerald)[Pointer (PTR રેકોર્ડ):] રિવર્સ લુકઅપ ઝોનમાં IP ને Hostname સાથે મેપ કરે છે. દા.ત. `10` -> `srv-dc01.corp.rtechlab.local`.
3. #text(weight: "bold", fill: rtech-amber)[Alias (CNAME - Canonical Name):] એક કમ્પ્યુટર માટે વૈકલ્પિક ઉપનામ (Alias) બનાવે છે. દા.ત. કર્મચારીઓ `portal.corp.rtechlab.local` ખોલે તો તે CNAME દ્વારા બેકએન્ડ સર્વર `srv-2025-web01.corp.rtechlab.local` પર રીડાયરેક્ટ થઈ જાય.
4. #text(weight: "bold", fill: rtech-navy)[Mail Exchanger (MX રેકોર્ડ):] ડોમેનના ઇમેઇલ સર્વર્સ (Microsoft Exchange) નો IP અને તેમની પ્રાથમિકતા (Priority/Preference નંબર) દર્શાવે છે.
5. #text(weight: "bold", fill: rtech-rose)[Service Location (SRV રેકોર્ડ):] સમગ્ર #hl-yellow[એક્ટિવ ડિરેક્ટરી]ની કરોડરજ્જુ. તે જણાવે છે કે LDAP, #hl-orange[Kerberos], અને Global Catalog જેવી સેવાઓ કયા પોર્ટ અને કયા સર્વર પર ચાલી રહી છે (દા.ત. `_ldap._tcp.dc._msdcs.corp.rtechlab.local` #hl-green[Port 389]).

#v(6pt)

=== 9.5 રૂટ હિન્ટ્સ (Root Hints) વિરુદ્ધ DNS ફોરવર્ડર્સ (Forwarders)
જ્યારે કોઈ કર્મચારી તેના ઓફિસ લેપટોપ પર બાહ્ય વેબસાઇટ (જેમ કે `google.com`) ખોલે છે, ત્યારે આપણું આંતરિક DNS સર્વર તેને કેવી રીતે શોધે છે?

- #text(weight: "bold", fill: rtech-navy)[રૂટ હિન્ટ્સ (Root Hints):] વિશ્વમાં 13 વૈશ્વિક લોજિકલ રૂટ સર્વર ક્લસ્ટર્સ છે (`a.root-servers.net` થી `m.root-servers.net`). જો કોઈ ફોરવર્ડર સેટ ન હોય, તો આપણું સર્વર સીધું રૂટ સર્વર્સથી પૂછવાનું શરૂ કરે છે (રૂટ -> .com TLD -> google.com). આ પ્રક્રિયા ધીમી હોય છે.
- #text(weight: "bold", fill: rtech-emerald)[DNS ફોરવર્ડર્સ (Forwarders - એન્ટરપ્રાઇઝ શ્રેષ્ઠ પદ્ધતિ):] આપણે આપણા સ્થાનિક DNS સર્વરને નિર્દેશ આપીએ છીએ કે જે બાહ્ય ડોમેન તારા ડેટાબેઝમાં ન હોય, તે સીધા અમારા અપસ્ટ્રીમ ISP અથવા વિશ્વસનીય પબ્લિક DNS સર્વર્સ પાસેથી પૂછો:
  - Primary Forwarder: #hl-green[`1.1.1.1`] (Cloudflare)
  - Secondary Forwarder: #hl-green[`8.8.8.8`] (Google DNS)
  - *ફાયદા:* ઇન્ટરનેટ બ્રાઉઝિંગ અત્યંત ઝડપી બને છે અને બાહ્ય પરિણામો લોકલ કેશમાં સ્ટોર થઈ જાય છે જેથી બેન્ડવિડ્થ બચે છે.

#v(6pt)

=== 9.6 જૂના રેકોર્ડ્સ દૂર કરવા: DNS એજિંગ અને સ્કેવેન્જિંગ (Aging & Scavenging)
જ્યારે સેંકડો લેપટોપ વાઇ-ફાઇ સાથે જોડાય છે અને ડિસ્કનેક્ટ થાય છે, ત્યારે DNS ડેટાબેઝમાં હજારો જૂના અને બિનઉપયોગી રેકોર્ડ્સ (Stale Records) જમા થઈ જાય છે. તેને આપમેળે સાફ કરવા માટે #hl-yellow[Aging & Scavenging] સક્ષમ કરવામાં આવે છે:

1. #text(weight: "bold")[No-refresh interval (ડિફૉલ્ટ 7 દિવસ):] આ સમયગાળા દરમિયાન જો ક્લાયન્ટ ફરીથી તે જ IP રિફ્રેશ કરે છે, તો DNS ટાઇમસ્ટેમ્પ અપડેટ કરતું નથી (જેથી સર્વરનો રેપ્લિકેશન ટ્રાફિક ન વધે).
2. #text(weight: "bold")[Refresh interval (ડિફૉલ્ટ 7 દિવસ):] આ સમયગાળામાં ક્લાયન્ટ ટાઇમસ્ટેમ્પને સફળતાપૂર્વક રિફ્રેશ કરી શકે છે.
3. #text(weight: "bold")[Scavenging Period (ડિફૉલ્ટ 7 દિવસ):] સર્વર સ્વીપરની જેમ સફાઈ પ્રક્રિયા ચલાવે છે. જો કોઈ રેકોર્ડનો ટાઇમસ્ટેમ્પ 14 દિવસ (7 + 7 દિવસ) કરતાં જૂનો હોય અને રિફ્રેશ ન થયો હોય, તો DNS તેને ડેટાબેઝમાંથી કાયમ માટે ડિલીટ કરી દે છે!

#v(8pt)

// =============================================================================
// CHAPTER 09 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  Windows Server 2025 માં DNS માં નેટિવ #hl-yellow[DoH (DNS over HTTPS)] સપોર્ટ ઉમેરવામાં આવ્યો છે. આનો અર્થ એ છે કે સર્વરથી બહાર ઇન્ટરનેટ પર જતી તમામ DNS ક્વેરીઝ હવે સાદા ટેક્સ્ટ (Cleartext UDP 53) માં જવાને બદલે #hl-green[HTTPS (#hl-green[Port 443])] દ્વારા સંપૂર્ણપણે એનક્રિપ્ટ થઈને જાય છે, જેથી ISP અથવા સાયબર અટેકર્સ ક્યારેય જોઈ શકતા નથી કે કંપનીની અંદરના કર્મચારીઓ કયા ડોમેન્સ એક્સેસ કરી રહ્યા છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 09 સ્વાધ્યાય બહુવિકલ્પી પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "#hl-yellow[એક્ટિવ ડિરેક્ટરી]-ઇન્ટિગ્રેટેડ DNS ઝોન (AD-Integrated Zone) નો ડેટાબેઝ કઈ ફાઇલમાં સ્ટોર થાય છે?",
  optA: "system32\dns\zone.dns ફાઇલમાં",
  optB: "એક્ટિવ ડિરેક્ટરી ડેટાબેઝ ntds.dit ની અંદર",
  optC: "Windows Registry માં",
  optD: "SYSVOL શેર્ડ ફોલ્ડરમાં",
  ans: "B",
  exp: "AD-Integrated ઝોન સીધો ntds.dit માં સ્ટોર થાય છે જેથી મલ્ટી-માસ્ટર રેપ્લિકેશન અને સુરક્ષિત એનક્રિપ્શન મળે છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "રિવર્સ લુકઅપ ઝોનમાં IP એડ્રેસને હોસ્ટનેમમાં મેપ કરતા સત્તાવાર રેકોર્ડનું નામ શું છે?",
  optA: "A Record",
  optB: "CNAME Record",
  optC: "PTR Record",
  optD: "MX Record",
  ans: "C",
  exp: "Pointer (PTR) રેકોર્ડ IP એડ્રેસને સંબંધિત Hostname માં અનુવાદિત (Resolve) કરવાનું કાર્ય કરે છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "એક્ટિવ ડિરેક્ટરી #hl-yellow[ડોમેન કંટ્રોલર], #hl-orange[Kerberos] અને LDAP સેવાઓ શોધવા માટે કયા વિશિષ્ટ DNS રેકોર્ડનો ઉપયોગ થાય છે?",
  optA: "TXT Record",
  optB: "SRV (Service Location) Record",
  optC: "SOA Record",
  optD: "NS Record",
  ans: "B",
  exp: "SRV રેકોર્ડ્સ (_ldap._tcp.dc._msdcs) દ્વારા જ ક્લાયન્ટ્સ #hl-yellow[ડોમેન કંટ્રોલર]ના પોર્ટ અને IP સરનામાઓ શોધી શકે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "સામાન્ય નેમ રિઝોલ્યુશન ક્વેરી માટે DNS સર્વર કયા પ્રમાણભૂત પોર્ટ અને ટ્રાન્સપોર્ટ પ્રોટોકોલનો ઉપયોગ કરે છે?",
  optA: "TCP પોર્ટ 80",
  optB: "UDP પોર્ટ 53",
  optC: "TCP પોર્ટ 445",
  optD: "UDP પોર્ટ 67",
  ans: "B",
  exp: "પ્રમાણભૂત DNS ક્વેરી UDP પોર્ટ 53 પર થાય છે; જ્યારે મોટા ઝોન ટ્રાન્સફર TCP પોર્ટ 53 પર થાય છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "DNS ડેટાબેઝમાંથી જૂના અને બિનઉપયોગી (Stale) ડાયનામિક રેકોર્ડ્સ આપમેળે દૂર કરવાની પ્રક્રિયાને શું કહેવાય છે?",
  optA: "Zone Transfer",
  optB: "#hl-yellow[Aging and Scavenging]",
  optC: "DNS Forwarding",
  optD: "Dynamic Registration",
  ans: "B",
  exp: "Aging અને Scavenging પ્રક્રિયા સમય મર્યાદા સમાપ્ત થતાં બિનઉપયોગી ડાયનામિક રેકોર્ડ્સને ડેટાબેઝમાંથી આપોઆપ કાઢી નાખે છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોચના MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'સુરક્ષા અને રેપ્લિકેશનની દ્રષ્ટિએ એક્ટિવ ડિરેક્ટરી-ઇન્ટિગ્રેટેડ ઝોન અને સ્ટાન્ડર્ડ પ્રાઇમરી ઝોન વચ્ચે મુખ્ય તફાવત શું છે?'",
  a: "જવાબ: સ્ટાન્ડર્ડ પ્રાઇમરી ઝોન સિંગલ-માસ્ટર મોડેલ પર કાર્ય કરે છે જ્યાં માત્ર પ્રાઇમરી સર્વર પર જ રેકોર્ડ્સ લખી શકાય છે અને સેકન્ડરી સર્વર્સ પર થતું ઝોન ટ્રાન્સફર અન-એનક્રિપ્ટેડ હોય છે. આનાથી વિપરીત, AD-Integrated ઝોનમાં મલ્ટી-માસ્ટર રેપ્લિકેશન હોય છે (કોઈપણ DC પર રેકોર્ડ લખી શકાય છે), ડેટા #hl-orange[Kerberos] દ્વારા એનક્રિપ્ટ થઈને AD રેપ્લિકેશન સાથે વહન પામે છે, અને તે 'Secure Dynamic Updates' ને સપોર્ટ કરે છે જેથી બિન-ડોમેન મશીનો નકલી રેકોર્ડ્સ બનાવી શકતા નથી.",
  tip: "Wipro, Infosys અને TCS ના L2 SysAdmin ઇન્ટરવ્યુમાં આ સૌથી મહત્વપૂર્ણ તુલનાત્મક પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'DNS Forwarders અને Root Hints વચ્ચે શું તફાવત છે, અને પ્રોડક્શનમાં કોને પ્રાથમિકતા આપવામાં આવે છે?'",
  a: "જવાબ: Root Hints 13 વૈશ્વિક રૂટ સર્વર્સ પાસેથી સીધી ઇટરેટિવ ક્વેરી કરે છે જે ખૂબ ધીમી હોય છે અને વિલંબ (Latency) વધારે છે. Forwarders ચોક્કસ અપસ્ટ્રીમ DNS (દા.ત. 1.1.1.1 અથવા ISP DNS) ને ક્વેરી ફોરવર્ડ કરે છે જે પહેલેથી કેશ થયેલ જવાબો તરત જ પરત આપે છે. પ્રોડક્શન વાતાવરણમાં હંમેશાં DNS Forwarders ને પ્રાથમિકતા અપાય છે કારણ કે તે બેન્ડવિડ્થ બચાવે છે અને ઇન્ટરનેટ એક્સેસને ખૂબ ઝડપી બનાવે છે.",
  tip: "આ ઉત્તર સાબિત કરે છે કે તમે નેટવર્ક ટ્રાફિક અને લેટન્સી ઓપ્ટિમાઇઝેશનની ઊંડી સમજ ધરાવો છો."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'ક્લાયન્ટ મશીન પર 'nslookup' ચલાવતી વખતે 'Default Server: Unknown' અને IP એડ્રેસ 192.168.1.10 દેખાય છે. આને કેવી રીતે ઠીક કરશો?'",
  a: "જવાબ: 'Default Server: Unknown' આવવાનો અર્થ એ છે કે DNS સર્વર પાસે પોતાના જ IP (192.168.1.10) માટે '#hl-yellow[Reverse Lookup Zone]' માં PTR રેકોર્ડ ઉપલબ્ધ નથી. આને સુધારવા માટે DNS કન્સોલમાં 192.168.1.x સબનેટ માટે #hl-yellow[Reverse Lookup Zone] બનાવીશું અને DC નો PTR રેકોર્ડ ઉમેરીશું. ત્યાર બાદ nslookup ચલાવતાં જ તે સર્વરનું સત્તાવાર FQDN નામ પ્રદર્શિત કરશે.",
  tip: "L1/L2 હેલ્પડેસ્ક અને સિસ્ટમ એડમિન ટ્રબલશૂટિંગનો આ ક્લાસિક ઇન્ટરવ્યુ પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'DNS Cache Poisoning શું છે અને તેનાથી કેવી રીતે બચી શકાય?'",
  a: "જવાબ: જ્યારે કોઈ સાયબર હુમલાખોર (Attacker) નકલી DNS રિસ્પોન્સ ઇન્જેક્ટ કરીને DNS સર્વરના કેશમાં કોઈ લોકપ્રિય ડોમેનને (દા.ત. bank.com) પોતાના દૂષિત IP સાથે મેપ કરાવી દે છે, ત્યારે તેને Cache Poisoning કહેવામાં આવે છે. આ હુમલાથી બચવા માટે વિન્ડોઝ સર્વરમાં #hl-green[DNSSEC] (DNS Security Extensions), Socket Pools અને Cache Locking સક્ષમ કરવામાં આવે છે.",
  tip: "સાયબર સિક્યોરિટી અને ઇન્ફ્રાસ્ટ્રક્ચર ઓડિટ્સનો આ પસંદગીનો પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'DNS Scavenging સક્ષમ કરતી વખતે કઈ બે જગ્યાએ સેટિંગ્સ ચાલુ કરવી ફરજિયાત છે?'",
  a: "જવાબ: Scavenging ને બે સ્તરે સક્ષમ કરવું ફરજિયાત છે: 1. ઝોન સ્તરે (Zone Properties -> General -> Aging બટન -> 'Scavenge stale resource records' ચેક કરવું), અને 2. સર્વર સ્તરે (Server Properties -> Advanced -> 'Enable automatic scavenging of stale records' ચેક કરવું). જો આ બંને સ્થાનો પર સેટિંગ સક્ષમ નહીં હોય, તો સ્કેવેન્જિંગ પ્રક્રિયા ક્યારેય કાર્ય કરશે નહીં.",
  tip: "આ ચોક્કસ વ્યવહારુ જ્ઞાન ઇન્ટરવ્યુઅરને સાબિત કરે છે કે તમે વાસ્તવિક લેબમાં આનું કન્ફિગરેશન જાતે કર્યું છે."
)

#v(5pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "black", fill: rtech-navy)[🛠️ DNS કમાન્ડ-લાઇન ટ્રબલશૂટિંગ માસ્ટરકિટ (Essential Commands):]\
    #v(3pt)
    #text(size: 7.5pt, fill: rtech-text)[
      - #text(weight: "bold", fill: rtech-blue)[`ipconfig /flushdns`]: ક્લાયન્ટ મશીનની સ્થાનિક DNS કેશ ખાલી કરે છે (જેથી બદલાયેલ IP તરત જ દેખાય).
      - #text(weight: "bold", fill: rtech-emerald)[`ipconfig /registerdns`]: ક્લાયન્ટના Host (A) અને PTR રેકોર્ડ્સને DNS સર્વર પર ફરીથી ડાયનામિકલી રજીસ્ટર કરે છે.
      - #text(weight: "bold", fill: rtech-amber)[`nslookup -type=SRV _ldap._tcp.dc._msdcs.corp.rtechlab.local`]: આ ખાતરી કરે છે કે AD ના SRV રેકોર્ડ્સ યોગ્ય રીતે કાર્ય કરી રહ્યા છે.
      - #text(weight: "bold", fill: rtech-navy)[`dnscmd /clearcache`]: DNS સર્વરની સમગ્ર આંતરિક રીઝોલ્વર કેશ કમાન્ડ લાઇન દ્વારા ખાલી કરે છે.
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
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[✅ પ્રકરણ 09 ચકાસણી ચેકલિસ્ટ (DNS Architecture Checklist):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - [ ] #hl-yellow[Forward Lookup Zone] `corp.rtechlab.local` એક્ટિવ ડિરેક્ટરી-ઇન્ટિગ્રેટેડ છે.
      - [ ] #hl-yellow[Reverse Lookup Zone] `1.168.192.in-addr.arpa` માં DC નો PTR રેકોર્ડ ઉપલબ્ધ છે.
      - [ ] બાહ્ય ઇન્ટરનેટ રિઝોલ્યુશન માટે Forwarders માં `1.1.1.1` અને `8.8.8.8` કન્ફિગર થયેલ છે.
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
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 09 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - DNS એક્ટિવ ડિરેક્ટરીનો જીવન આધાર છે; SRV રેકોર્ડ્સ #hl-yellow[ડોમેન કંટ્રોલર] અને Kerberos ની ઓળખ કરાવે છે.
      - પ્રોડક્શનમાં હંમેશાં AD-Integrated ઝોન અને 1.1.1.1 / 8.8.8.8 પર આધારિત DNS Forwarders નો ઉપયોગ કરો.
      - જૂના (Stale) રેકોર્ડ્સ દૂર કરવા માટે ઝોન અને સર્વર બંને સ્તરે Aging & Scavenging સક્ષમ કરવું ફરજિયાત છે.
    ]
  ]
)

#pagebreak()
