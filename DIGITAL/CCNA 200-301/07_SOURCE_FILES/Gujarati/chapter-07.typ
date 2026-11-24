#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Nirmala UI", weight: "bold", fill: rtech-emerald)[પ્રકરણ 07 · લેયર 2 સ્વિચિંગ અને પોર્ટ સિક્યોરિટી]
= પ્રકરણ 7: લેયર 2 સ્વિચિંગ, CAM ટેબલ્સ અને પોર્ટ સિક્યોરિટી લૈબ

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  લેયર 2 ફ્રેમ ફૉરવર્ડિંગ લૉજિક, કંટેંટ એડ્રેસેબલ મેમરી (CAM) ટેબલ્સ, MAC ફ્લડિંગ અટૈક્સ, અને સ્વિચપોર્ટ પોર્ટ સિક્યોરિટી કૉન્ફિગરેશન અને ઑટોમેટેડ એરર-રિકવરી.
]

#v(2pt)

== 7.1 લેયર 2 ટ્રાંસપેરેંટ બ્રિજિંગ અને સ્વિચિંગ લૉજિક
ઈથરનેટ સ્વિચ 48-બિટ MAC એડ્રેસેસ ના આધાર પર ફ્રેમ્સ ને ફૉરવર્ડ કરતે છે. સ્વિચ 4 મૂળભૂત કાર્ય નિષ્પાદિત કરતા છે:
- *1. સીખના (Learn - Source MAC):* જ્યારે કોઈ ઈથરનેટ ફ્રેમ પોર્ટ પર આતા છે, તો સ્વિચ તેના #hl[સોર્સ MAC એડ્રેસ] ની જાંચ કરતા છે. જો તે CAM ટેબલ માં નથી છે, તો તે MAC, પોર્ટ અને VLAN ને 300 સેકંડ ના ટાઇમર સાથે દર્જ કર લેતા છે.
- *2. ફૉરવર્ડ કરના (Forward - Known Unicast):* સ્વિચ #hl[ડેસ્ટિનેશન MAC એડ્રેસ] ની જાંચ કરતા છે. જો તે CAM ટેબલ માં મૌજૂદ છે, તો ફ્રેમ ને કેવલ ઉસી વિશિષ્ટ પોર્ટ થી બાહર ભેજા જાતા છે.
- *3. ફિલ્ટર કરના (Filter):* જો ડેસ્ટિનેશન MAC ઉસી પોર્ટ સેગમેંટ પર છે જિસસે ફ્રેમ આયા હતું, તો સ્વિચ ઉસે ડ્રૉપ કર આપે છે તાકિ અનાવશ્યક ટ્રૈફિક ન ફૈલે.
- *4. ફ્લડ કરના (Flood - Unknown Unicast, Broadcast, Multicast):* જો ડેસ્ટિનેશન MAC ટેબલ માં નથી છે, અથવા બ્રૉડકાસ્ટ (`FF:FF:FF:FF:FF:FF`) છે, તો સ્વિચ ફ્રેમ ને #hl[આને વાલે પોર્ટ ને છોડકર તે VLAN ના અન્ય બધા પોર્ટ્સ પર ફ્લડ કર આપે છે].

#v(2pt)

== 7.2 CAM ટેબલ આર્કિટેક્ચર અને એજિંગ ટાઇમર
કંટેંટ એડ્રેસેબલ મેમરી (CAM) ટેબલ 1 ક્લૉક સાઇકિલ માં હાર્ડવેર લુકઅપ ની સુવિધા આપે છે. સિસ્કો IOS માં નિષ્ક્રિય ડાયનેમિક MAC પ્રવિષ્ટિયોં માટે ડિફૉલ્ટ એજિંગ ટાઇમર #hl[300 સેકંડ (5 મિનટ)] થાય છે.
#terminal-box([
```cisco
Switch# show mac address-table
          Mac Address Table
-------------------------------------------
Vlan    Mac Address       Type        Ports
----    -----------       --------    -----
  10    001b.782a.8c11    DYNAMIC     Gi0/1
  10    001b.782a.8c22    DYNAMIC     Gi0/2
Total Mac Addresses for this module: 2
```
])

#v(2pt)

#grid(
  columns: (1fr, 1.3fr),
  gutter: 6pt,
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/network-switch-gigabit.jpg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[ચિત્ર 7.1: પ્રોડક્શન એંટરપ્રાઇજ ગીગાબિટ એક્સેસ સ્વિચ.]
  ],
  [
    #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab02-port-security-topology.svg", width: 95%)
    #v(1pt)
    #text(size: 6.5pt, fill: rtech-muted)[ચિત્ર 7.2: લૈબ 02 — સ્વિચપોર્ટ પોર્ટ સિક્યોરિટી ટોપોલૉજી.]
  ]
)

#pagebreak()

== 7.3 લેયર 2 ખતરે: MAC ફ્લડિંગ અને CAM ટેબલ ઓવરફ્લો
*CAM Table Overflow Attack* માં હમલાવર પ્રતિ સેકંડ હજારોં ફર્જી અને યાદૃચ્છિક સોર્સ MAC એડ્રેસેસ ભેજતા છે (જેમ કે `macof` ટૂલ દ્વારા).
- *પરિણામ:* સ્વિચ ની CAM ટેબલ સંપૂર્ણપણે ભર જાતી છે. નએ પતે ન સીખ પાને ના કારણ સ્વિચ પુરાને હબ ની તરહ વ્યવહાર કરને લગતા છે અને #hl[બધા આને વાલે ફ્રેમ્સ ને હર પોર્ટ પર ફ્લડ કરને લગતા છે]. હમલાવર સ્નિફર લગાકર ગોપનીય ડેટા ચુરા લેતા છે.
- *સુરક્ષા:* પ્રતિ ઇંટરફેસ અનુમત MAC એડ્રેસેસ ની સંખ્યા સીમિત કરને માટે #hl[Switchport Port Security] લાગૂ કરેં.

#v(2pt)

== 7.4 સ્વિચપોર્ટ પોર્ટ સિક્યોરિટી CLI અમલીકરણ
#table(
  columns: (1.2fr, 1.4fr, 1.4fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3pt,
  table.header([*ઉલ્લંઘન મોડ*], [*ફ્રેમ ફૉરવર્ડિંગ*], [*ઉલ્લંઘન કાઉંટર*], [*Syslog / SNMP અલર્ટ અને પોર્ટ સ્થિતિ*]),
  [`Protect`], [અનધિકૃત ફ્રેમ્સ ડ્રૉપ કરતા છે], [બઢતા નથી છે], [કોઈ અલર્ટ નથી. પોર્ટ UP રહતા છે.],
  [`Restrict`], [અનધિકૃત ફ્રેમ્સ ડ્રૉપ કરતા છે], [બઢતા છે], [Syslog અને SNMP ટ્રૈપ ભેજતા છે. પોર્ટ UP રહતા છે.],
  [`Shutdown` (માનક)], [બધા ટ્રૈફિક ડ્રૉપ કરતા છે], [બઢતા છે], [Syslog ભેજતા છે. પોર્ટ ને તુરંત `err-disabled` માં બંદ કર આપે છે.]
)

#v(2pt)

#terminal-box([
```cisco
Switch(config)# interface GigabitEthernet0/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport port-security
Switch(config-if)# switchport port-security maximum 2
Switch(config-if)# switchport port-security mac-address sticky
Switch(config-if)# switchport port-security violation restrict
Switch(config-if)# exit
! ग्लोबल ऑटोमेटेड एरर-रिकवरी:
Switch(config)# errdisable recovery cause psecure-violation
Switch(config)# errdisable recovery interval 30
```
])

#v(2pt)

== 7.5 પોર્ટ સિક્યોરિટી સત્યાપન અને ટ્રબલશૂટિંગ
#terminal-box([
```cisco
Switch# show port-security interface GigabitEthernet0/1
Port Security              : Enabled
Port Status                : Secure-up
Violation Mode             : Restrict
Aging Time                 : 0 mins
Secure MACAddress-Max(Count) : 2
Security Violation Count   : 0
Sticky MAC Addresses       : 1
```
])

#pagebreak()

== છાત્ર તકનીકી પ્રશ્નોત્તરી (Student Technical FAQs)
#faq-box("પોર્ટ સિક્યોરિટી સક્ષમ કરને થી પહલે 'switchport mode access' ક્યોં દેના પડતા છે?", "સિસ્કો સ્વિચ પોર્ટ્સ ડિફૉલ્ટ રૂપ થી ડાયનેમિક DTP મોડ માં થાય છે. પોર્ટ સિક્યોરિટી કેવલ સ્ટૈટિક એક્સેસ અથવા સ્ટૈટિક ટ્રંક પોર્ટ્સ પર હી સમર્થિત છે; ડાયનેમિક પોર્ટ પર આ કમાંડ અસ્વીકાર હો જાતી છે.")
#faq-box("સ્ટૈટિક MAC ની તુલના માં 'mac-address sticky' નો ક્યા લાભ છે?", "'sticky' કમાંડ સ્વિચ ને પહલે પ્રાપ્ત ફ્રેમ થી ડિવાઇસ નો MAC એડ્રેસ સ્વતઃ સીખકર ઉસે સીધે running-config માં લિખને ની સુવિધા આપે છે, જિસસે મૈન્યુઅલ ટાઇપિંગ નો સમય બચતા છે.")
#faq-box("ઑટો-રિકવરી ના બિના 'err-disabled' પોર્ટ ને કૈસે ચાલૂ કરવામાં આવે છે?", "ઇંજીનિયર ને મૈન્યુઅલ રૂપ થી ઇંટરફેસ કૉન્ફિગરેશન માં જાકર પહલે 'shutdown' અને ફિર 'no shutdown' કમાંડ દેની પડતી છે.")

#v(2pt)

== લઘુ-ઉત્તરીય તકનીકી સમીક્ષા (Short-Answer Review)
1. *સિસ્કો પોર્ટ સિક્યોરિટી નો ડિફૉલ્ટ વાયોલેશન મોડ બતાઇએ:* `Shutdown`.
2. *સિસ્કો IOS માં ડાયનેમિક CAM ટેબલ પ્રવિષ્ટિયોં નો એજિંગ ટાઇમર કિતના થાય છે?* 300 સેકંડ (5 મિનટ).
3. *Restrict અને Protect વાયોલેશન મોડ્સ માં મુખ્ય અંતર ક્યા છે?* બંને અનધિકૃત ફ્રેમ્સ ને રોકતે છે, પરંતુ Restrict ઉલ્લંઘન કાઉંટર ને બઢાતા છે અને Syslog/SNMP ભેજતા છે, જ્યારે Protect ચુપચાપ ડ્રૉપ કરતા છે.
4. *પોર્ટ સિક્યોરિટી ઉલ્લંઘન થી બંદ થયા પોર્ટ ને સ્વતઃ પુનઃ ચાલૂ કરને ની કમાંડ ક્યા છે?* `errdisable recovery cause psecure-violation`.

#v(2pt)

== ઉચ્ચ-પ્રાથમિકતા પરીક્ષા બહુવિકલ્પીય પ્રશ્ન (Exam MCQs)
#mcq-item(
  "પોર્ટ સિક્યોરિટી વાલે પોર્ટ પર ઉલ્લંઘન હોને પર પોર્ટ તુરંત એમ્બર હો જાતા છે અને સ્થિતિ 'err-disabled' દિખતી છે. કૌન સા મોડ સક્રિય છે?",
  ("Protect", "Restrict", "Shutdown", "Monitor"),
  2,
  "Shutdown મોડ સુરક્ષા ઉલ્લંઘન હોને પર પોર્ટ ને તુરંત err-disabled સ્થિતિ માં બંદ કર આપે છે."
)

#mcq-item(
  "કૌન સી કમાંડ સીખે ગયા ડાયનેમિક MAC એડ્રેસેસ ને સીધે રનિંગ કૉન્ફિગરેશન માં સેવ કર આપે છે?",
  ("switchport port-security mac-address dynamic", "switchport port-security mac-address sticky", "switchport mac-address-table permanent", "switchport security learn auto"),
  1,
  "'mac-address sticky' સીખે ગયા MAC એડ્રેસેસ ને સ્થાયી કૉન્ફિગરેશન માં બદલ આપે છે."
)

#mcq-item(
  "અધિકતમ 2 MAC એડ્રેસેસ ની સીમા લગાકર પોર્ટ સિક્યોરિટી સક્ષમ કરને થી કિસ પ્રકાર નો હમલા સીધે રુકતા છે?",
  ("ARP પૉઇજનિંગ", "CAM ટેબલ ફ્લડિંગ / ઓવરફ્લો", "DHCP સ્ટાર્વેશન", "VLAN હૉપિંગ"),
  1,
  "પોર્ટ સિક્યોરિટી હમલાવરોં ને હજારોં ફર્જી MAC એડ્રેસેસ ભેજકર CAM ટેબલ ભરને થી રોકતી છે."
)

#v(2pt)

== ક્યા આપ જાનતે છે? અને 2027 ટેક્નોલૉજી સ્પૉટલાઇટ
#fact-box("ક્યા આપ જાનતે છે? TCAM બનામ CAM ટેબલ્સ", "માનક CAM ટેબલ્સ કેવલ સટીક બાઇનરી (0 અથવા 1) MAC મૈચ કરતી છે. ટર્નરી CAM (TCAM) તીસરી સ્થિતિ 'Don't Care' (X) નો મૂલ્યાંકન કર શકે છે, જિસસે લેયર 3 સ્વિચેસ એક હી ચક્ર માં જટિલ ACLs અને સબનેટ માસ્ક્સ નો મૂલ્યાંકન કર લેતે છે.")

#spotlight-box("2027 ટેક સ્પૉટલાઇટ: 802.1X ડાયનેમિક VLAN અસાઇનમેંટ અને સિસ્કો ISE", "આધુનિક જીરો-ટ્રસ્ટ નેટવર્ક્સ માં સ્ટૈટિક પોર્ટ સિક્યોરિટી ના સ્થાન પર IEEE 802.1X NAC નો ઉપયોગ કરવામાં આવે છે. Cisco ISE દ્વારા યુઝર પ્રમાણીકરણ ના આધાર પર સ્વિચ પોર્ટ ને ડાયનેમિક રૂપ થી ઉપયુક્ત VLAN માં ડાલ દિયા જાતા છે.")
