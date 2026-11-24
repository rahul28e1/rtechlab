#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Nirmala UI", weight: "bold", fill: rtech-emerald)[પ્રકરણ 13 · એંટરપ્રાઇજ IP સેવાએં: DHCP અને NAT/PAT]
= પ્રકરણ 13: એંટરપ્રાઇજ IP સેવાએં: સિસ્કો IOS DHCP સર્વર, DHCP રિલે અને NAT/PAT ઓવરલોડ લૈબ

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  DHCP DORA 4-તેઓ હૈંડશેક, સિસ્કો IOS DHCP સર્વર કૉન્ફિગરેશન, DHCP રિલે એજેંટ (`ip helper-address`), IPv4 એડ્રેસ સંરક્ષણ, અને પોર્ટ એડ્રેસ ટ્રાંસલેશન (PAT / NAT Overload) લૈબ.
]

#v(2pt)

== 13.1 ડાયનેમિક હોસ્ટ કૉન્ફિગરેશન પ્રોટોકૉલ (DHCP) ની કાર્યપ્રણાલી
DHCP એંડપૉઇંટ ઉપકરણો પર IPv4 એડ્રેસ, સબનેટ માસ્ક, ડિફૉલ્ટ ગેટવે અને DNS સેટિંગ્સ ને સ્વચાલિત કરતા છે:
- *DORA 4-તેઓ હૈંડશેક પ્રક્રિયા:*
  - *1. Discover (ક્લાઇંટ થી સર્વર):* ક્લાઇંટ UDP પોર્ટ 67 પર `255.255.255.255` પર `DHCPDISCOVER` બ્રૉડકાસ્ટ કરતા છે.
  - *2. Offer (સર્વર થી ક્લાઇંટ):* DHCP સર્વર એક IP આરક્ષિત કરકે `DHCPOFFER` ભેજતા છે.
  - *3. Request (ક્લાઇંટ થી સર્વર):* ક્લાઇંટ લીજ સ્વીકાર કરતે થયા `DHCPREQUEST` બ્રૉડકાસ્ટ કરતા છે.
  - *4. Acknowledgment (સર્વર થી ક્લાઇંટ):* સર્વર `DHCPACK` ભેજકર લીજ અવધિ અને નેટવર્ક સેટિંગ્સ ની પુષ્ટિ કરતા છે.

#v(2pt)

== 13.2 સિસ્કો IOS DHCP સર્વર કૉન્ફિગરેશન
#terminal-box([
```cisco
! स्टैटिक एड्रेसेस (गेटवे, प्रिंटर, सर्वर) को बाहर रखें:
Router(config)# ip dhcp excluded-address 192.168.10.1 192.168.10.20
! सक्रिय DHCP एड्रेस पूल बनाएं:
Router(config)# ip dhcp pool Engineering_Pool
Router(config-dhcp)# network 192.168.10.0 255.255.255.0
Router(config-dhcp)# default-router 192.168.10.1
Router(config-dhcp)# dns-server 8.8.8.8 1.1.1.1
Router(config-dhcp)# domain-name rtechlab.com
Router(config-dhcp)# lease 7 0 0
```
])

#v(2pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab08-dhcp-relay-topology.svg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[ચિત્ર 13.1: લૈબ 08 — DHCP રિલે મલ્ટી-VLAN ટોપોલૉજી.]
  ],
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab09-pat-nat-topology.svg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[ચિત્ર 13.2: લૈબ 09 — PAT / NAT ઓવરલોડ એંટરપ્રાઇજ ગેટવે.]
  ]
)

#pagebreak()

== 13.3 DHCP રિલે એજેંટ (`ip helper-address`)
રાઉટર્સ લેયર 3 પર બ્રૉડકાસ્ટ પૈકેટ્સ ને ડ્રૉપ કર આપે છે. જો DHCP સર્વર કિસી અન્ય VLAN અથવા સર્વર ફાર્મ માં સ્થિત છે, તો ક્લાઇંટ નો `DHCPDISCOVER` રાઉટર પર હી નષ્ટ થઈ જશે!
- *સમાધાન:* ક્લાઇંટ-ફેસિંગ રાઉટર ઇંટરફેસ પર `ip helper-address <DHCP_Server_IP>` દેં.
- રાઉટર ક્લાઇંટ ના બ્રૉડકાસ્ટ UDP પોર્ટ 67 પૈકેટ ને પકડકર ઉસે #hl[યૂનિકાસ્ટ પૈકેટ માં બદલ આપે છે] અને કેંદ્રીય DHCP સર્વર ને ભેજ આપે છે.

#v(2pt)

== 13.4 નેટવર્ક એડ્રેસ ટ્રાંસલેશન (NAT) અને PAT
NAT સાર્વજનિક IPv4 સ્પેસ ને બચાતા છે અને આંતરિક પ્રાઇવેટ નેટવર્ક સંરચના ને છુપાતા છે:
#table(
  columns: (1.2fr, 1.6fr, 3.2fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3pt,
  table.header([*NAT પ્રકાર*], [*મૈપિંગ અનુપાત*], [*પ્રોડક્શન ઉપયોગ અને કાર્યપ્રણાલી*]),
  [Static NAT], [એક-થી-એક (1:1)], [એક પ્રાઇવેટ IP ને સ્થાયી રૂપ થી એક પબ્લિક IP પર મૈપ કરતા છે (DMZ વેબ/મેલ સર્વર).],
  [Dynamic NAT], [અનેક-થી-અનેક], [પબ્લિક IPs ના પૂલ થી પહલે આઓ-પહલે પાઓ ના આધાર પર પ્રાઇવેટ હોસ્ટ્સ ને જોડતા છે.],
  [PAT / Overload], [અનેક-થી-એક (N:1)], [અદ્વિતીય લેયર 4 પોર્ટ નંબર્સ નો ઉપયોગ કરકે હજારોં પ્રાઇવેટ IPs ને #hl[એકલ પબ્લિક IP] પર ઇંટરનેટ કરાતા છે.]
)

#v(2pt)

== 13.5 પ્રોડક્શન PAT / NAT ઓવરલોડ CLI લૈબ
#terminal-box([
```cisco
! चरण 1: इनसाइड एवं आउटसाइड इंटरफेसेस पहचानें:
Edge-RTR(config)# interface GigabitEthernet0/0/0
Edge-RTR(config-if)# ip nat inside
Edge-RTR(config-if)# exit
Edge-RTR(config)# interface GigabitEthernet0/0/1
Edge-RTR(config-if)# ip nat outside
Edge-RTR(config-if)# exit

! चरण 2: आंतरिक प्राइवेट होस्ट्स को मैच करने वाली ACL बनाएं:
Edge-RTR(config)# access-list 1 permit 192.168.0.0 0.0.255.255

! चरण 3: पब्लिक इंटरफ़ेस पर PAT ओवरलोड सक्रिय करें:
Edge-RTR(config)# ip nat inside source list 1 interface GigabitEthernet0/0/1 overload
```
])

#v(2pt)

== 13.6 NAT સત્યાપન અને ટ્રાંસલેશન ટેબલ નિરીક્ષણ
#terminal-box([
```cisco
Edge-RTR# show ip nat translations
Pro Inside global          Inside local           Outside local        Outside global
tcp 203.0.113.5:49152      192.168.10.50:49152    198.51.100.10:80     198.51.100.10:80
tcp 203.0.113.5:49153      192.168.10.51:49153    198.51.100.20:443    198.51.100.20:443
```
])

#pagebreak()

== છાત્ર તકનીકી પ્રશ્નોત્તરી (Student Technical FAQs)
#faq-box("Inside Local અને Inside Global એડ્રેસેસ માં ક્યા અંતર છે?", "Inside Local આંતરિક વર્કસ્ટેશન ને દિયા ગયો વાસ્તવિક પ્રાઇવેટ IP એડ્રેસ (RFC 1918) છે. Inside Global તે ટ્રાંસલેટેડ પબ્લિક IP એડ્રેસ છે જો બાહરી ઇંટરનેટ પર તે ઉપકરણ નો પ્રતિનિધિત્વ કરતા છે.")
#faq-box("PAT ના તહત એક પબ્લિક IP કિતને સમવર્તી કનેક્શંસ સંભાલ શકે છે?", "PAT 16-બિટ લેયર 4 પોર્ટ નંબર્સ નો ઉપયોગ કરતા છે. સૈદ્ધાંતિક રૂપ થી લગભગ 65,000 સમવર્તી ટ્રાંસલેશન સેશન્સ એક હી પબ્લિક IPv4 એડ્રેસ પર ચલાએ જા શકો છો.")
#faq-box("DHCP કિન UDP પોર્ટ્સ નો ઉપયોગ કરતા છે?", "DHCP ક્લાઇંટ UDP પોર્ટ 68 પર બ્રૉડકાસ્ટ કરતા છે; DHCP સર્વર UDP પોર્ટ 67 પર સુનતા છે.")

#v(2pt)

== લઘુ-ઉત્તરીય તકનીકી સમીક્ષા (Short-Answer Review)
1. *ચાર-ચરણીય DHCP હૈંડશેક નો સહી ક્રમ બતાઇએ:* Discover -> Offer -> Request -> Acknowledge (DORA).
2. *રાઉટર ના પાર DHCP બ્રૉડકાસ્ટ ફૉરવર્ડ કરને વાલી કમાંડ ક્યા છે?* ક્લાઇંટ ગેટવે ઇંટરફેસ પર `ip helper-address <DHCP_Server_IP>`.
3. *NAT કૉન્ફિગરેશન માં પોર્ટ એડ્રેસ ટ્રાંસલેશન (PAT) સક્રિય કરને વાલા કીવર્ડ ક્યા છે?* `overload`.
4. *સક્રિય ડાયનેમિક NAT ટ્રાંસલેશન પ્રવિષ્ટિયોં ને મિટાને ની કમાંડ ક્યા છે?* `clear ip nat translation *`.

#v(2pt)

== ઉચ્ચ-પ્રાથમિકતા પરીક્ષા બહુવિકલ્પીય પ્રશ્ન (Exam MCQs)
#mcq-item(
  "સિસ્કો રાઉટર પર DHCP સર્વર બનાતે સમય કૌન સી કમાંડ આ સુનિશ્ચિત કરતી છે કિ ગેટવે IP 192.168.1.1 કિસી કમ્પ્યુટર ને ન દિયા જાએ?",
  ("ip dhcp exclude 192.168.1.1", "ip dhcp excluded-address 192.168.1.1", "no ip dhcp pool 192.168.1.1", "deny host 192.168.1.1"),
  1,
  "'ip dhcp excluded-address' નિર્દિષ્ટ સ્ટૈટિક એડ્રેસેસ ને લીજ પર દેને થી રોકતી છે."
)

#mcq-item(
  "સિસ્કો NAT શબ્દાવલી માં, બાહરી ગંતવ્ય હોસ્ટ નો તે IP એડ્રેસ ક્યા કહલાતા છે જૈસા તે આંતરિક નેટવર્ક ના ઉપકરણો ને દિખાઈ આપે છે?",
  ("Inside Local", "Inside Global", "Outside Local", "Outside Global"),
  2,
  "Outside Local બાહરી હોસ્ટ નો તે IP એડ્રેસ છે જૈસા તે આંતરિક નેટવર્ક ના ઉપકરણો દ્વારા જાના જાતા છે."
)

#mcq-item(
  "કૌન સી ટ્રાંસલેશન વિધિ 500 યુઝર્સ ને એક હી પબ્લિક IPv4 એડ્રેસ થી ઇંટરનેટ ચલાને ની અનુમતિ આપે છે?",
  ("Static NAT", "Dynamic NAT", "PAT (NAT Overload)", "BGP Route Reflection"),
  2,
  "PAT (Port Address Translation) લેયર 4 પોર્ટ નંબર્સ નો ઉપયોગ કરકે એક હી પબ્લિક IP પર હજારોં પ્રાઇવેટ કનેક્શંસ ચલાતા છે."
)

#v(2pt)

== ક્યા આપ જાનતે છે? અને 2027 ટેક્નોલૉજી સ્પૉટલાઇટ
#fact-box("ક્યા આપ જાનતે છે? કૈરિયર-ગ્રેડ NAT (CGNAT)", "IPv4 પતે સમાપ્ત હોને ના કારણ મોબાઇલ અને બ્રૉડબૈંડ કંપનિયાં પૂરે શહરોં ને CGNAT (RFC 6598, `100.64.0.0/10` બ્લૉક) ના પીછે રખતી છે, જિસસે પૈકેટ્સ ઇંટરનેટ પહુંચને થી પહલે ડબલ NAT થી ગુજરતે છે.")

#spotlight-box("2027 ટેક સ્પૉટલાઇટ: NAT64 / DNS64 ટ્રાંજિશન", "આધુનિક મોબાઇલ નેટવર્ક્સ કેવલ-IPv6 કોર ચલાતે છે. NAT64 રાઉટર્સ આઉટબાઉંડ IPv6 અનુરોધોં ને લેગેસી IPv4 માં બદલતે છે જિસસે કેવલ-IPv6 ફોન પુરાને IPv4 સર્વરોં ને બિના સમસ્યા ખોલ લેતે છે.")
