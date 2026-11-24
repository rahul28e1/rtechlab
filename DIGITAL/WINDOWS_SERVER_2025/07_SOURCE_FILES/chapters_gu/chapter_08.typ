// =============================================================================
// CHAPTER 08: DHCP SERVER ROLE: SCOPES, RESERVATIONS & FAILOVER
// =============================================================================

[#metadata("ch8") <chapter-8>]

#chapter-header(
  chapter-num: "CHAPTER 08",
  category: "ભાગ 8 : સ્વચાલિત નેટવર્ક આઈપી એડ્રેસિંગ (Dynamic Host Configuration)",
  title: "DHCP સર્વર કન્ફિગરેશન: સ્કોપ, એક્સક્લુઝન, રિઝર્વેશન અને ફેઇલઓવર",
  subtitle: "DORA 4-સ્ટેપ પ્રક્રિયા · AD ઓથોરાઇઝેશન · IPv4 સ્કોપ · સબનેટ માસ્ક · લીઝ ડ્યુરેશન · એક્સક્લુઝન રેન્જ · MAC રિઝર્વેશન · 80/20 સ્પ્લિટ-સ્કોપ અને ફેઇલઓવર"
)

=== 8.1 DHCP શું છે? અને DORA 4-ચરણ પ્રક્રિયા
જ્યારે કોઈ નવું લેપટોપ કે સ્માર્ટફોન કંપનીના વાઇ-ફાઇ કે લૅન (LAN) કેબલ સાથે જોડાય છે, ત્યારે નેટવર્ક પર સંચાર કરવા માટે તેને એક અદ્વિતીય IP એડ્રેસ, સબનેટ માસ્ક, ડિફોલ્ટ ગેટવે અને DNS સર્વરની જરૂર પડે છે.

#mark-yellow[ડાયનેમિક હોસ્ટ કન્ફિગરેશન પ્રોટોકોલ (DHCP) એક ક્લાયન્ટ-સર્વર નેટવર્કિંગ પ્રોટોકોલ છે જે નેટવર્ક સાથે જોડાતા પ્રત્યેક ક્લાયન્ટ કમ્પ્યુટરને આપમેળે IP એડ્રેસ અને નેટવર્ક પેરામીટર્સ ચોક્કસ સમયગાળા (Lease) માટે ફાળવે છે.]

ક્લાયન્ટ અને DHCP સર્વર વચ્ચે IP ફાળવણીની પ્રક્રિયાને #hl-yellow[DORA પ્રક્રિયા] કહેવામાં આવે છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/dhcp_dora_process.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 8.1: DHCP 4-ચરણીય DORA લાઇફસાયકલ — Discover, Offer, Request, અને Acknowledge (UDP Port 67/68)]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[DORA પ્રક્રિયાના 4 મુખ્ય પગલાં (MNC ઇન્ટરવ્યુમાં નિર્ણાયક સિદ્ધાંત):]\
    - #text(weight: "bold", fill: rtech-blue)[1. D (DHCPDISCOVER):] ક્લાયન્ટ પાસે હાલમાં કોઈ IP નથી. તે સોર્સ IP `0.0.0.0` અને ડેસ્ટિનેશન IP `255.255.255.255` (Broadcast) સાથે નેટવર્ક પર પૂછે છે: *\"શું આ નેટવર્ક પર કોઈ સક્રિય DHCP સર્વર ઉપલબ્ધ છે?\"* #hl-green[UDP પોર્ટ: 67].
    - #text(weight: "bold", fill: rtech-emerald)[2. O (DHCPOFFER):] નેટવર્ક પર રહેલું DHCP સર્વર પોતાના ઉપલબ્ધ પૂલમાંથી એક ખાલી IP કાઢીને ક્લાયન્ટને ઓફર મોકલે છે: *\"મારી પાસે IP 192.168.1.100 ઉપલબ્ધ છે, શું તમે આ લીઝ પર લેવા માંગો છો?\"* #hl-green[UDP પોર્ટ: 68].
    - #text(weight: "bold", fill: rtech-amber)[3. R (DHCPREQUEST):] ક્લાયન્ટ તે ઓફર સ્વીકારે છે અને બ્રોડકાસ્ટ સંદેશ મોકલે છે: *\"હા, મને સર્વર 192.168.1.10 દ્વારા ઓફર કરેલ IP 192.168.1.100 મંજૂર છે!\"*
    - #text(weight: "bold", fill: rtech-blue)[4. A (DHCPACK):] DHCP સર્વર સ્વીકૃતિ (Acknowledgement) મોકલે છે, પોતાના ડેટાબેઝમાં આ IP ને લીઝ તરીકે બુક કરે છે, અને ગેટવે તથા DNS ની વિગતો સોંપે છે.
  ]
)

#v(6pt)

=== 8.2 DHCP સર્વર રોલ ઇન્સ્ટોલેશન અને એક્ટિવ ડિરેક્ટરી ઓથોરાઇઝેશન
1. Server Manager -> #hl-green[Manage -> Add Roles and Features] માં જાઓ.
2. Server Roles માં #mark-yellow[DHCP Server] ચેકબોક્સ પર ટીક કરો.
3. 'Add Features' (DHCP RSAT મેનેજમેન્ટ ટૂલ્સ) સામેલ કરીને 'Next' -> 'Next' -> 'Install' કરો.
4. ઇન્સ્ટોલેશન પૂર્ણ થતાં જ પીળા ફ્લેગ (Notification) પર ક્લિક કરો -> #hl-yellow['Complete DHCP Configuration'].
5. વિઝાર્ડમાં #text(weight: "bold", fill: rtech-navy)[Authorization] સ્ક્રીન આવશે. 'Commit' દબાવો જેથી આપણું ડોમેન કંટ્રોલર આ DHCP સર્વરને એક્ટિવ ડિરેક્ટરીમાં અધિકૃત (Authorize) કરે.

#warning-box(title: "Rogue DHCP Server Prevention (એન્ટરપ્રાઇઝ સુરક્ષા વ્યવસ્થા)")[
  જો કોઈ અનધિકૃત કર્મચારી કે યુઝર નેટવર્કમાં પોતાનું અંગત રાઉટર કે બિનઅધિકૃત DHCP સર્વર ચાલુ કરે (Rogue DHCP Server), તો વિન્ડોઝ ડોમેન કંટ્રોલર તેને તરત ડિટેક્ટ કરી લે છે. એક્ટિવ ડિરેક્ટરીમાં અનધિકૃત વિન્ડોઝ DHCP સર્વર્સની સર્વિસ આપોઆપ બંધ (Stop) થઈ જાય છે જેથી કર્મચારીઓને ખોટો IP કે ગેટવે ન મળે.
]

#v(6pt)

=== 8.3 નવો IPv4 સ્કોપ બનાવવો (Configuring an IPv4 Scope)
સ્કોપ (Scope) એ IP એડ્રેસિસની તે માન્ય શ્રેણી છે જે સર્વર સબનેટ પર રહેલા ક્લાયન્ટ્સને ફાળવે છે:

1. Server Manager -> Tools -> #hl-yellow[DHCP] કન્સોલ ખોલો (અથવા રનમાં ટાઇપ કરો: #mark-green[`dhcpmgmt.msc`]).
2. સર્વર નોડ `SRV-2025-DC01` વિસ્તૃત કરો -> #text(weight: "bold")[IPv4] પર રાઇટ-ક્લિક કરો -> #hl-green[New Scope...] પસંદ કરો.
3. Scope Name: #hl-yellow[`RTechLab-LAN-Scope`].
4. #text(weight: "bold")[IP Address Range (આઇપી પૂલ):]
   - Start IP address: #hl-green[`192.168.1.100`]
   - End IP address: #hl-green[`192.168.1.200`]
   - Length: #hl-green[`24`], Subnet mask: #hl-green[`255.255.255.0`]
5. #text(weight: "bold")[Lease Duration (લીઝની અવધિ):] ડિફોલ્ટ રૂપે #hl-yellow[8 દિવસ] હોય છે. ઓફિસના વાયર્ડ ડેસ્કટોપ માટે 8 દિવસ આદર્શ છે, પરંતુ એરપોર્ટ કે કાફેના ગેસ્ટ વાઇ-ફાઇ માટે તેને 2 થી 4 કલાક રાખવામાં આવે છે.

#v(6pt)

=== 8.4 એક્સક્લુઝન રેન્જ અને આવશ્યક DHCP ઓપ્શન્સ
- #text(weight: "bold", fill: rtech-rose)[Add Exclusions and Delay (એક્સક્લુઝન રેન્જ):] જો આપણા પૂલમાંથી અમુક IP એડ્રેસ આપણે સામાન્ય ક્લાયન્ટ્સને ફાળવવા ન માંગતા હોઈએ (દા.ત. ટેસ્ટ લેબ કે સ્ટેટિક ડિવાઇસિસ માટે), તો તેમને બાકાત રાખવામાં આવે છે:
  - Start IP: `192.168.1.150` થી End IP: `192.168.1.160` નાખીને 'Add' કરો.
- #text(weight: "bold", fill: rtech-navy)[Configure DHCP Options:]
  - #text(weight: "bold", fill: rtech-blue)[Option 003 (Router / Default Gateway):] `192.168.1.1` દાખલ કરીને 'Add' કરો.
  - #text(weight: "bold", fill: rtech-emerald)[Option 006 (DNS Servers):] `192.168.1.10` (આપણું AD DNS સર્વર) પ્રાથમિકતામાં ઉમેરો.
  - #text(weight: "bold", fill: rtech-amber)[Option 015 (Domain Name):] `corp.rtechlab.local` દાખલ કરો.
6. 'Yes, I want to activate this scope now' પસંદ કરીને 'Finish' કરો!

#v(6pt)

=== 8.5 MAC એડ્રેસ રિઝર્વેશન (Reservations for Network Printers)
ઓફિસમાં નેટવર્ક પ્રિન્ટર્સ, સ્કેનર્સ અને સર્વેલન્સ કેમેરાનો IP ક્યારેય બદલાવો ન જોઈએ, અન્યથા કર્મચારીઓ પ્રિન્ટ આપી શકશે નહીં. તેના માટે આપણે MAC રિઝર્વેશનનો ઉપયોગ કરીએ છીએ:

1. DHCP કન્સોલમાં તમારા સક્રિય સ્કોપ હેઠળ #hl-yellow[Reservations] ફોલ્ડર પર રાઇટ-ક્લિક કરો -> #hl-green[New Reservation...].
2. Reservation name: #hl-yellow[`HP-Network-Printer-HR`].
3. IP address: #hl-green[`192.168.1.105`].
4. MAC address: પ્રિન્ટરનો 12-અંકનો હેક્સાડેસિમલ મેક એડ્રેસ દાખલ કરો (દા.ત. `00155D01A23B`).
5. Supported types: #hl-yellow['Both (DHCP and BOOTP)'] પસંદ કરીને 'Add' કરો.
હવે જ્યારે પણ આ પ્રિન્ટર નેટવર્ક પર ચાલુ થશે, DHCP સર્વર તેના મેક એડ્રેસને ઓળખીને હંમેશા આજ ફિક્સ IP `192.168.1.105` ફાળવશે!

#v(6pt)

=== 8.6 હાઇ અવેલેબિલિટી: DHCP 80/20 સ્પ્લિટ-સ્કોપ અને ક્લસ્ટર ફેઇલઓવર
જો એકમાત્ર DHCP સર્વર ક્રેશ થઈ જાય, તો લીઝ સમાપ્ત થતાં આખી ઓફિસનું ઇન્ટરનેટ અને નેટવર્ક ઠપ થઈ જશે. તેને રોકવાના બે મુખ્ય આર્કિટેક્ચરલ ઉપાયો છે:

1. #text(weight: "bold", fill: rtech-navy)[80/20 સ્પ્લિટ-સ્કોપ નિયમ (Legacy Standard):] પ્રાથમિક DC પર 80% IP પૂલ રાખવામાં આવે છે અને સેકન્ડરી DC પર એ જ સબનેટનો 20% પૂલ રાખવામાં આવે છે જેથી પ્રાઇમરી ડાઉન થવા પર પણ 20% સિસ્ટમ્સ ચાલુ રહે.
2. #text(weight: "bold", fill: rtech-emerald)[આધુનિક DHCP Failover (Windows Server 2025):]
   - IPv4 સ્કોપ પર રાઇટ-ક્લિક કરો -> #hl-green[Configure Failover...].
   - પાર્ટનર સર્વર (`SRV-2025-DC02`) પસંદ કરો.
   - મોડ પસંદ કરો:
     - #text(weight: "bold")[Load Balance Mode:] બંને સર્વર્સ 50%-50% ટ્રાફિક સક્રિય રીતે વહેંચે છે.
     - #text(weight: "bold")[Hot Standby Mode:] એક્ટિવ સર્વર 100% ટ્રાફિક સંભાળે છે, અને તે ડાઉન થતાં જ સ્ટેન્ડબાય સર્વર તાત્કાલિક લીઝ આપવાનું શરૂ કરે છે.

#v(8pt)

// =============================================================================
// CHAPTER 08 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  DHCP બ્રોડકાસ્ટ ટ્રાફિક લેયર-3 રાઉટરને પાર કરી શકતો નથી. જો કોઈ મોટી કંપનીમાં 10 અલગ-અલગ VLANs કે બિલ્ડિંગ્સ હોય, તો શું દરેક ફ્લોર પર અલગ DHCP સર્વર લગાવવું પડશે? બિલકુલ નહીં! નેટવર્ક એન્જિનિયર્સ સિસ્કો રાઉટર કે સ્વિચ પર #hl-yellow[DHCP Relay Agent] (સિસ્કો કમાન્ડ: `ip helper-address 192.168.1.10`) સક્ષમ કરે છે, જે ક્લાયન્ટના બ્રોડકાસ્ટ પેકેટને યુનિકાસ્ટ પેકેટમાં રૂપાંતરિત કરીને કેન્દ્રીય DHCP સર્વર સુધી પહોંચાડી દે છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 08 પ્રેક્ટિસ બહુવિકલ્પી પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "DHCP IP ફાળવણીની 4-ચરણીય DORA પ્રક્રિયાનું સાચું પૂર્ણ સ્વરૂપ કયું છે?",
  optA: "Domain, Origin, Routing, Access",
  optB: "Discover, Offer, Request, Acknowledge",
  optC: "Detect, Open, Receive, Assign",
  optD: "Data, Output, Response, Authentication",
  ans: "B",
  exp: "DORA નું પૂર્ણ સ્વરૂપ છે: DHCPDISCOVER, DHCPOFFER, DHCPREQUEST, અને DHCPACK."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "ક્લાયન્ટ કમ્પ્યુટર નેટવર્ક પર DHCPDISCOVER પેકેટ મોકલતી વખતે કયા UDP પોર્ટ નંબરનો ઉપયોગ કરે છે?",
  optA: "UDP પોર્ટ 53",
  optB: "UDP પોર્ટ 67",
  optC: "UDP પોર્ટ 80",
  optD: "UDP પોર્ટ 445",
  ans: "B",
  exp: "DHCP સર્વર UDP પોર્ટ 67 પર સાંભળે છે, જ્યારે ક્લાયન્ટ UDP પોર્ટ 68 પર પ્રતિસાદ મેળવે છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "DHCP સ્કોપ વિકલ્પોમાં ક્લાયન્ટ કમ્પ્યુટર્સને 'Default Gateway (રાઉટર)' નો IP એડ્રેસ આપવા માટે કયા સત્તાવાર વિકલ્પ કોડનો ઉપયોગ થાય છે?",
  optA: "Option 003",
  optB: "Option 006",
  optC: "Option 015",
  optD: "Option 066",
  ans: "A",
  exp: "Option 003 Router (Default Gateway) માટે અને Option 006 DNS Servers માટે આરક્ષિત છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "નેટવર્ક પ્રિન્ટર કે સર્વરને દરેક વખતે એક જ ચોક્કસ IP એડ્રેસ આપમેળે ફાળવવા માટે કઈ ટેકનિકનો ઉપયોગ થાય છે?",
  optA: "Exclusion Range",
  optB: "MAC Address Reservation",
  optC: "APIPA Auto-IP",
  optD: "DNS Scavenging",
  ans: "B",
  exp: "MAC રિઝર્વેશન ડિવાઇસના ભૌતિક મેક એડ્રેસને DHCP સ્કોપની અંદર ચોક્કસ IP સાથે કાયમી ધોરણે મેપ કરી દે છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "જો નેટવર્ક પર કોઈ DHCP સર્વર ઉપલબ્ધ ન હોય, તો વિન્ડોઝ 11 ક્લાયન્ટ આપમેળે કઈ IP રેન્જમાંથી APIPA એડ્રેસ પસંદ કરી લે છે?",
  optA: "10.0.0.1 થી 10.0.0.254",
  optB: "169.254.0.1 થી 169.254.255.254",
  optC: "192.168.1.1 થી 192.168.1.254",
  optD: "172.16.0.1 થી 172.16.0.254",
  ans: "B",
  exp: "APIPA (Automatic Private IP Addressing) 169.254.0.0/16 સબનેટમાંથી IP પસંદ કરે છે જે DHCP નિષ્ફળતાનો સંકેત છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'ક્લાયન્ટ મશીનને 169.254.x.x નો IP મળ્યો છે. આનો અર્થ શું છે અને તમે તેને કેવી રીતે સુધારશો?'",
  a: "જવાબ: 169.254.x.x એ APIPA (Automatic Private IP Addressing) એડ્રેસ છે. આનો સીધો અર્થ એ છે કે ક્લાયન્ટે DHCPDISCOVER બ્રોડકાસ્ટ મોકલ્યું પણ નેટવર્ક પર કોઈ DHCP સર્વરે જવાબ આપ્યો નહીં. ટ્રબલશૂટિંગ માટે: 1. લૅન કેબલ/VLAN પોર્ટ કનેક્ટિવિટી ચકાસીશું, 2. DHCP સર્વર પર જઈને સ્કોપ પૂલ ભરાઈ ગયો છે કે નહીં (Pool Exhaustion) તે તપાસીશું, 3. ક્લાયન્ટ પર 'ipconfig /release' અને 'ipconfig /renew' ચલાવીશું.",
  tip: "HCL, Infosys અને TCS ના L1/L2 નેટવર્ક સપોર્ટ ઇન્ટરવ્યુમાં આ સૌથી સામાન્ય પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'DHCP Lease Renewal પ્રક્રિયા ક્યારે શરૂ થાય છે, અને T1 તથા T2 ટાઇમર્સ શું છે?'",
  a: "જવાબ: લીઝ અવધિના 50% સમય વીતી જવા પર (T1 Timer - દા.ત. 8 દિવસની લીઝમાં 4 દિવસ પછી) ક્લાયન્ટ મૂળ DHCP સર્વરને 'DHCPREQUEST' યુનિકાસ્ટ મોકલીને લીઝ રીન્યૂ કરવાનો પ્રયાસ કરે છે. જો મૂળ સર્વર જવાબ ન આપે, તો 87.5% સમય વીતી જવા પર (T2 Timer - 7મા દિવસે) ક્લાયન્ટ નેટવર્ક પર અન્ય કોઈપણ ઉપલબ્ધ DHCP સર્વરને બ્રોડકાસ્ટ મોકલે છે. જો 100% સમય સુધી રીન્યૂ ન થાય, તો IP આપોઆપ રીલીઝ થઈ જાય છે.",
  tip: "આ ઊંડો ટેકનિકલ ઉત્તર સાબિત કરે છે કે તમે પ્રોટોકોલના આંતરિક ટાઇમર્સ અને કાર્યપદ્ધતિથી પરિચિત છો."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'Rogue DHCP Server શું હોય છે અને Active Directory Authorization તેને કેવી રીતે અટકાવે છે?'",
  a: "જવાબ: Rogue DHCP એ અનધિકૃત સર્વર છે જે નેટવર્ક પર ખોટા IP અને ગેટવે વહેંચીને Man-in-the-Middle (MitM) હુમલો કરી શકે છે કે નેટવર્ક ઠપ કરી શકે છે. વિન્ડોઝ ડોમેન એન્વાયર્નમેન્ટમાં તમામ DHCP સર્વર્સે AD માં 'Authorize' થવું પડે છે (AD ના Configuration Partition માં યાદી). જ્યારે કોઈ બિનઅધિકૃત વિન્ડોઝ સર્વર DHCP ચાલુ કરે છે, ત્યારે તે પહેલા AD યાદી તપાસે છે; નામ ન મળતાં તેની DHCP સર્વિસ આપમેળે બંધ થઈ જાય છે.",
  tip: "એન્ટરપ્રાઇઝ નેટવર્ક સુરક્ષા સાથે જોડાયેલો આ અત્યંત મૂલ્યવાન પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'રાઉટરની પેલે પાર બીજા સબનેટ પર રહેલા ક્લાયન્ટ્સને કેન્દ્રીય DHCP સર્વર પાસેથી IP અપાવવા માટે શું કન્ફિગર કરવામાં આવે છે?'",
  a: "જવાબ: DHCP બ્રોડકાસ્ટ પેકેટ્સ રાઉટર ઓળંગી શકતા ન હોવાથી, રિમોટ સબનેટના ગેટવે રાઉટર પર 'DHCP Relay Agent' (સિસ્કોમાં 'ip helper-address <DHCP-IP>') કન્ફિગર કરવામાં આવે છે. આ રીલે એજન્ટ બ્રોડકાસ્ટને યુનિકાસ્ટમાં ફેરવીને સીધા કેન્દ્રીય DHCP સર્વર સુધી પહોંચાડે છે.",
  tip: "નેટવર્કિંગ અને સર્વર ઇન્ફ્રાસ્ટ્રક્ચરના સંયુક્ત ઇન્ટરવ્યુ રાઉન્ડનો આ સ્ટાન્ડર્ડ પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'Windows Server 2025 માં DHCP Failover ના 'Load Balance' અને 'Hot Standby' મોડ્સ વચ્ચે આર્કિટેક્ચરલ તફાવત શું છે?'",
  a: "જવાબ: Load Balance મોડમાં બંને પાર્ટનર સર્વર્સ સક્રિય રહે છે અને પૂર્વનિર્ધારિત ગુણોત્તરમાં (દા.ત. 50:50) ક્લાયન્ટ વિનંતીઓ પર પ્રક્રિયા કરે છે (મલ્ટિ-સર્વર સાઇટ્સ માટે શ્રેષ્ઠ). Hot Standby મોડમાં એક સર્વર મુખ્ય (Active) રહે છે અને બીજું નિષ્ક્રિય (Standby) રહે છે; જ્યારે એક્ટિવ સર્વર ડાઉન થાય ત્યારે જ સ્ટેન્ડબાય સર્વર લીઝ આપવાનું શરૂ કરે છે (હબ-એન્ડ-સ્પોક બ્રાન્ચ આર્કિટેક્ચર માટે શ્રેષ્ઠ).",
  tip: "હાઇ-અવેલેબિલિટી, ક્લસ્ટરિંગ અને ડિઝાસ્ટર રિકવરી આર્કિટેક્ચરનો મુખ્ય સવાલ."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 08 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - DHCP સર્વર DORA પ્રક્રિયા દ્વારા ઓટોમેટિક IP, સબનેટ માસ્ક, ગેટવે (Opt 003) અને DNS (Opt 006) ફાળવે છે.
      - નેટવર્ક પ્રિન્ટર્સ અને ફિક્સ્ડ ડિવાઇસિસ માટે હંમેશા MAC Reservation નો ઉપયોગ કરો; ક્યારેય મેન્યુઅલ સ્ટેટિક IP ન આપો.
      - 169.254.x.x (APIPA) નું દેખાવું DHCP સર્વર નિષ્ફળતા અથવા નેટવર્ક ડિસ્કનેક્શનનો સ્પષ્ટ સંકેત છે.
    ]
  ]
)

#pagebreak()
