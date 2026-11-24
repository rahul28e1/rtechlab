#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 8pt, font: "Nirmala UI", weight: "bold", fill: rtech-emerald)[પ્રકરણ 06 · સિસ્કો CLI અને ડિજાસ્ટર રિકવરી]
= પ્રકરણ 6: સિસ્કો IOS CLI મોડ્સ, પાસવર્ડ રિકવરી (0x2142) અને TFTP રિકવરી

#text(size: 8.5pt, fill: rtech-text.lighten(20%))[
  સિસ્કો IOS CLI મોડ્સ અને નેવિગેશન, મૂળભૂત સિક્યોરિટી હાર્ડનિંગ, ROMMON confreg 0x2142 દ્વારા ચરણબદ્ધ પાસવર્ડ રિકવરી, અને TFTP બૈકઅપ અને રિસ્ટોરેશન વર્કફ્લો.
]

#v(2pt)

== 6.1 સિસ્કો IOS CLI કમાંડ પદાનુક્રમ (Command Hierarchy)
સિસ્કો IOS કમાંડ નિષ્પાદન ને એક સખ્ત અનુમતિ પદાનુક્રમ માં વ્યવસ્થિત કરતા છે:
- *User EXEC મોડ (`Router>`):* કેવલ રીડ-ઓનલી મૂળભૂત નિગરાની. પિંગ, ટ્રેસરૂટ અને સીમિત શો કમાંડ્સ ની અનુમતિ.
- *Privileged EXEC મોડ (`Router#`):* પ્રશાસનિક નિયંત્રણ. `enable` દ્વારા પ્રવેશ. કૉન્ફિગરેશન દેખના (`show running-config`), ફાઇલ મેનેજમેન્ટ, ડિબગિંગ અને રીલોડ.
- *Global Configuration મોડ (`Router(config)#`):* સિસ્ટમ-વ્યાપી પૈરામીટર્સ. `configure terminal` દ્વારા પ્રવેશ.
- *Interface Configuration સબમોડ (`Router(config-if)#`):* વિશિષ્ટ પોર્ટ પૈરામીટર્સ (IP એડ્રેસ, સ્પીડ, ડુપ્લેક્સ).
- *Line Configuration સબમોડ (`Router(config-line)#`):* મેનેજમેન્ટ લાઇન્સ (`line console 0`, `line vty 0 4`).

#v(2pt)

== 6.2 જરૂરી સિક્યોરિટી હાર્ડનિંગ કૉન્ફિગરેશન
#terminal-box([
```cisco
Router(config)# hostname Edge-RTR
Edge-RTR(config)# enable algorithm-type sha256 secret Cisco#123Secure!
Edge-RTR(config)# service password-encryption
Edge-RTR(config)# banner motd # AUTHORIZED ACCESS ONLY - VIOLATORS PROSECUTED #
Edge-RTR(config)# line console 0
Edge-RTR(config-line)# password ConsolePass#1
Edge-RTR(config-line)# login
Edge-RTR(config-line)# logging synchronous
Edge-RTR(config-line)# exec-timeout 5 0
Edge-RTR(config)# ip domain-name rtechlab.lan
Edge-RTR(config)# crypto key generate rsa modulus 2048
Edge-RTR(config)# ip ssh version 2
Edge-RTR(config)# username admin privilege 15 secret AdminPass#2027
Edge-RTR(config)# line vty 0 4
Edge-RTR(config-line)# transport input ssh
Edge-RTR(config-line)# login local
```
])

#v(2pt)

#align(center)[
  #image("/07_SOURCE_FILES/03_VISUAL_ASSETS/packet-tracer-topologies/lab01-ssh-topology.svg", width: 90%)
  #v(1pt)
  #text(size: 7pt, fill: rtech-muted)[ચિત્ર 6.1: પૈકેટ ટ્રેસર લૈબ 01 — સુરક્ષિત આઉટ-ઑફ-બૈંડ SSH મૈનેજમેંટ ટોપોલૉજી.]
]

#pagebreak()

== 6.3 ચરણબદ્ધ પાસવર્ડ રિકવરી પ્રક્રિયા (સટીક CLI પ્રૉમ્પ્ટ્સ)
જ્યારે પ્રશાસનિક પાસવર્ડ ખો જાએ, તો રાઉટર ની પ્રોડક્શન સેટિંગ્સ ખોએ બિના પાસવર્ડ રિકવર કરને ની વિધિ:
- *ચરણ 1: ભૌતિક કંસોલ કનેક્શન:* PC ના COM/USB પોર્ટ થી રાઉટર કંસોલ પોર્ટ માં રોલઓવર કેબલ જોડેં. PuTTY માં `9600-8-N-1` સેટ કરેં.
- *ચરણ 2: બૂટ અનુક્રમ ને બાધિત કરના:* રાઉટર ને પાવર ઑફ કરકે ઑન કરેં. બૂટિંગ પહેલાં 60 સેકંડ ના અંદર `Break` (અથવા PuTTY માં `Ctrl+Break`) દબાકર ROMMON મોડ માં પ્રવેશ કરેં.
- *ચરણ 3: કૉન્ફિગરેશન રજિસ્ટર સંશોધિત કરના:*
  `rommon 1 >` પ્રૉમ્પ્ટ પર રાઉટર ને સૂચના દેં કિ અગલી બૂટિંગ પર NVRAM startup-config ને છોડ દે:
  #terminal-box([
```cisco
rommon 1 > confreg 0x2142
rommon 2 > reset
```
  ])
- *ચરણ 4: પ્રારંભિક સેટઅપ ડાયલૉગ ને છોડના:*
  રાઉટર ડિફૉલ્ટ રૂપ થી બૂટ હશે. પૂછે જાને પર `no` ટાઇપ કરેં:
  `Would you like to enter the initial configuration dialog? [yes/no]: no`
- *ચરણ 5: પ્રિવિલેજ્ડ મોડ અને કૉન્ફિગરેશન રિસ્ટોર:*
  #hl[અતિ મહત્વપૂર્ણ: પહલે 'configure terminal' ન લિખેં!] NVRAM થી startup-config ને RAM માં કૉપી કરેં તાકિ બધા IP એડ્રેસેસ સુરક્ષિત રહેં:
  #terminal-box([
```cisco
Router> enable
Router# copy startup-config running-config
```
  ])
- *ચરણ 6: નયા પાસવર્ડ સેટ કરના અને ઇંટરફેસ ચાલૂ કરના:*
  #terminal-box([
```cisco
Edge-RTR# configure terminal
Edge-RTR(config)# enable secret NewMasterPassword#2027
Edge-RTR(config)# interface GigabitEthernet0/0/0
Edge-RTR(config-if)# no shutdown
```
  ])
- *ચરણ 7: કૉન્ફિગરેશન રજિસ્ટર ને પુનઃ સામાન્ય (0x2102) કરના:*
  #hl[અનિવાર્ય ચરણ: જો આ ભૂલ ગયા, તો રાઉટર હર રીબૂટ પર અપની કૉન્ફિગરેશન ભૂલ જાએગા!]
  #terminal-box([
```cisco
Edge-RTR(config)# config-register 0x2102
Edge-RTR(config)# exit
Edge-RTR# copy running-config startup-config
Edge-RTR# reload
```
  ])

#v(2pt)

== 6.4 TFTP સર્વર બૈકઅપ અને ડિજાસ્ટર રિકવરી
#table(
  columns: (1.5fr, 4fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rtech-paper } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: 3pt,
  table.header([*ડિજાસ્ટર રિકવરી કાર્ય*], [*પ્રોડક્શન સિસ્કો IOS CLI કમાંડ*]),
  [રનિંગ કૉન્ફિગરેશન નો TFTP બૈકઅપ], [`Edge-RTR# copy running-config tftp://192.168.1.50/Edge-RTR-cfg-backup`],
  [TFTP થી રનિંગ કૉન્ફિગરેશન રિસ્ટોર], [`Edge-RTR# copy tftp://192.168.1.50/Edge-RTR-cfg-backup running-config`],
  [ફ્લૈશ થી IOS ઇમેજ નો TFTP બૈકઅપ], [`Edge-RTR# copy flash:c2900-universalk9-mz.bin tftp://192.168.1.50/`],
  [TFTP થી નઈ IOS ઇમેજ ફ્લૈશ કરના], [`Edge-RTR# copy tftp://192.168.1.50/c2900-universalk9-mz.bin flash:`],
  [IOS ફાઇલ MD5 ચેકસમ સત્યાપન], [`Edge-RTR# verify /md5 flash:c2900-universalk9-mz.bin`]
)

#pagebreak()

== છાત્ર તકનીકી પ્રશ્નોત્તરી (Student Technical FAQs)
#faq-box("પાસવર્ડ રિકવરી માં 'copy startup running' ની જગહ 'configure terminal' કર દેં તો ક્યા હશે?", "સીધે ગ્લોબલ કૉન્ફિગરેશન માં જાને થી RAM માં એક ખાલી ફાઇલ બન જાએગી. જો આપ ઇસે સેવ કર દેંગે, તો NVRAM ની પૂરી પ્રોડક્શન કૉન્ફિગરેશન હમેશા માટે નષ્ટ થઈ જશે!")
#faq-box("પાસવર્ડ રિકવરી પછી ઇંટરફેસેસ ને મૈન્યુઅલ 'no shutdown' ક્યોં કરના પડતા છે?", "જ્યારે બાઈપાસ મોડ માં startup-config ને running-config માં લોડ કરવામાં આવે છે, તો સિસ્કો IOS સુરક્ષા કારણોં થી બધા ઇંટરફેસેસ ને administratively down કર આપે છે.")
#faq-box("'enable password' અને 'enable secret' માં ક્યા અંતર છે?", "'enable password' કમજોર રિવર્સિબલ ટાઇપ 7 એન્ક્રિપ્શન નો ઉપયોગ કરતા છે. 'enable secret' મજબૂત ઇરિવર્સિબલ ટાઇપ 5 (MD5) અથવા ટાઇપ 9 (SHA-256) હૈશ નો ઉપયોગ કરતા છે.")

#v(2pt)

== લઘુ-ઉત્તરીય તકનીકી સમીક્ષા (Short-Answer Review)
1. *સિસ્કો IOS પર SSH માટે 2048-બિટ RSA કીજ જનરેટ કરને ની કમાંડ બતાઇએ:* `crypto key generate rsa modulus 2048`.
2. *startup-config ને અનદેખા કરને માટે સટીક ROMMON કમાંડ ક્યા છે?* `confreg 0x2142`.
3. *પાસવર્ડ રિકવરી ના અંત માં 'config-register 0x2102' ક્યોં અનિવાર્ય છે?* સામાન્ય બૂટ મોડ વાપસ લાને માટે તાકિ ભવિષ્ય ના રીબૂટ્સ પર રાઉટર NVRAM થી કૉન્ફિગરેશન લોડ કરે.
4. *લાઇન કંસોલ 0 ના તહત 'logging synchronous' નો ક્યા કાર્ય છે?* આ સિસ્ટમ સંદેશોં ને તે કમાંડ લાઇન ને કાટને થી રોકતા છે જિસે ઇંજીનિયર વર્તમાન માં ટાઇપ કર રહા થાય છે.

#v(2pt)

== ઉચ્ચ-પ્રાથમિકતા પરીક્ષા બહુવિકલ્પીય પ્રશ્ન (Exam MCQs)
#mcq-item(
  "એક ઇંજીનિયર કંસોલ થી જુડા છે અને ઉસે ROMMON માં જાના છે. ક્યા કરના જોઈએ?",
  ("પાવર ઑન કરને ના 60 સેકંડ ના ભીતર Break સિગ્નલ ભેજેં", "મોડ બટન 30 સેકંડ દબાએં", "'reload --rommon' ટાઇપ કરેં", "ફ્લૈશ થી IOS ઇમેજ ડિલીટ કરેં"),
  0,
  "બૂટિંગ ના દૌરાન ટર્મિનલ એમ્યુલેટર થી Break સિગ્નલ ભેજને પર બૂટસ્ટ્રૈપ રુક જાતા છે અને રાઉટર ROMMON માં આ જાતા છે."
)

#mcq-item(
  "કૌન સી કમાંડ કૉન્ફિગરેશન ફાઇલ ના બધા મૌજૂદા પ્લેનટેક્સ્ટ પાસવર્ડ્સ ને ટાઇપ 7 હૈશ દ્વારા છુપાતી છે?",
  ("enable secret", "service password-encryption", "crypto key generate rsa", "ip ssh version 2"),
  1,
  "'service password-encryption' બધા પ્લેનટેક્સ્ટ પાસવર્ડ્સ ને ટાઇપ 7 એલ્ગોરિદમ થી અસ્પષ્ટ કર આપે છે."
)

#mcq-item(
  "પાસવર્ડ રિકવરી માં પાસવર્ડ બદલને પછી રીલોડ કરને થી પહલે નયા પાસવર્ડ સ્થાયી કરને માટે કૌન સી કમાંડ દી જાતી છે?",
  ("copy startup-config running-config", "copy running-config startup-config", "erase startup-config", "write memory erase"),
  1,
  "'copy running-config startup-config' નએ પાસવર્ડ અને રિસ્ટોર ની ગઈ સેટિંગ્સ ને NVRAM માં સ્થાયી રૂપ થી સેવ કરતા છે."
)

#v(2pt)

== ક્યા આપ જાનતે છે? અને 2027 ટેક્નોલૉજી સ્પૉટલાઇટ
#fact-box("ક્યા આપ જાનતે છે? સિસ્કો ટાઇપ 7 પાસવર્ડ કભી સુરક્ષિત ક્યોં નથી હોતે", "સિસ્કો ટાઇપ 7 એન્ક્રિપ્શન એક નિશ્ચિત XOR ની નો ઉપયોગ કરતા છે જિસે 1995 માં ક્રૈક કર લિયા ગયો હતું. કિસી ભી ટાઇપ 7 હૈશ ને ઑનલાઇન ડિકોડર થી 0.001 સેકંડ માં ખોલા જા શકે છે. હમેશા ટાઇપ 9 (SHA-256) નો પ્રયોગ કરેં.")

#spotlight-box("2027 ટેક સ્પૉટલાઇટ: જીરો ટચ પ્રોવિજનિંગ (ZTP)", "આધુનિક એંટરપ્રાઇજ નેટવર્ક્સ માં નએ હાર્ડવેર ને કૉન્ફિગર કરને માટે કંસોલ કેબલ ની આવશ્યકતા નથી હોતી. Cisco ZTP તકનીક DHCP Option 43 અને Python સ્ક્રિપ્ટ્સ ના જરિએ ક્લાઉડ થી સ્વતઃ કૉન્ફિગરેશન ડાઉનલોડ કર લેતી છે.")
