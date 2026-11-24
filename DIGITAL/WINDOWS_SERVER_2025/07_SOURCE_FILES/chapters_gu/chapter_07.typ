// =============================================================================
// CHAPTER 07: GROUP POLICY OBJECTS (GPO) & ENTERPRISE SECURITY DESKTOP CONTROL
// =============================================================================

[#metadata("ch7") <chapter-7>]

#chapter-header(
  chapter-num: "CHAPTER 07",
  category: "ભાગ 7 : એન્ટરપ્રાઇઝ સુરક્ષા અને ગ્રુપ પોલિસીઓ (Group Policy Engine)",
  title: "ગ્રુપ પોલિસી ઓબ્જેક્ટ્સ (GPO): એન્ટરપ્રાઇઝ સુરક્ષા અને ડેસ્કટોપ નિયંત્રણ",
  subtitle: "GPMC (gpmc.msc) · LSDOU પ્રોસેસિંગ ક્રમ · બ્લોક ઇનહેરિટન્સ અને એન્ફોર્સ્ડ · લેબ 1: પાસવર્ડ પોલિસી · લેબ 2: USB બ્લોક GPO · લેબ 3: વોલપેપર ડિપ્લોયમેન્ટ · gpupdate /force"
)

=== 7.1 ગ્રુપ પોલિસી શું છે? (What is Group Policy?)
જો કોઈ કંપનીમાં 2,000 કર્મચારીઓ હોય અને કંપનીની સુરક્ષા નીતિ કહે છે કે કોઈપણ કમ્પ્યુટર પર પેનડ્રાઇવ ન લાગવી જોઈએ, દરેકનું સ્ક્રીન સેવર 5 મિનિટમાં લોક થઈ જવું જોઈએ, અને કોઈ કંટ્રોલ પેનલ ન ખોલી શકે — તો શું સિસ્ટમ એડમિનિસ્ટ્રેટર દરેક કમ્પ્યુટર પર જઈને આ સેટિંગ્સ કરશે? ક્યારેય નહીં!

#mark-yellow[ગ્રુપ પોલિસી (Group Policy) માઇક્રોસોફ્ટનું એક અત્યંત શક્તિશાળી કેન્દ્રીય વ્યવસ્થાપન એન્જિન (Configuration Engine) છે જેના દ્વારા ડોમેન એડમિનિસ્ટ્રેટર હજારો કમ્પ્યુટર્સ અને યુઝર્સની ઓપરેટિંગ સિસ્ટમ, સુરક્ષા સેટિંગ્સ, ડેસ્કટોપ એન્વાયર્નમેન્ટ અને સોફ્ટવેર ડિપ્લોયમેન્ટને એક જ જગ્યાએથી આપમેળે નિયંત્રિત કરી શકે છે.]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "GPC (Group Policy Container)")[
      GPC એક્ટિવ ડિરેક્ટરી ડેટાબેઝ (`ntds.dit`) ની અંદર સંગ્રહિત થાય છે. તે GPO ના ગુણધર્મો (Attributes), વર્ઝન નંબર, સ્ટેટસ અને 128-બીટ GUID (Globally Unique Identifier) ધરાવે છે.
    ]
  ],
  [
    #info-box(title: "GPT (Group Policy Template)")[
      GPT ફાઇલ સિસ્ટમ (`C:\Windows\SYSVOL\sysvol\domain\Policies\{GUID}\`) માં સંગ્રહિત થાય છે. તેમાં વાસ્તવિક રજિસ્ટ્રી સેટિંગ્સ, સુરક્ષા નીતિઓ, સોફ્ટવેર ઇન્સ્ટોલેશન સૂચનાઓ અને સ્ક્રિપ્ટ ફાઇલો હોય છે.
    ]
  ]
)

#v(4pt)

=== 7.2 Group Policy Management Console (`gpmc.msc`)
ગ્રુપ પોલિસીનું સંચાલન કરવા માટેનું પ્રાથમિક ટૂલ #hl-yellow[GPMC (Group Policy Management Console)] છે.
- તેને ખોલવા માટેનો રન કમાન્ડ છે: #mark-green[`gpmc.msc`].

કન્સોલ ખોલતાં જ ડોમેન હેઠળ બે ડિફોલ્ટ GPOs પહેલેથી બનેલા મળે છે:
1. #text(weight: "bold", fill: rtech-navy)[Default Domain Policy:] આ સમગ્ર ડોમેન સ્તરે લિંક થયેલી હોય છે. તેનું પ્રાથમિક કાર્ય સમગ્ર ડોમેન માટે પાસવર્ડ જટિલતા, લઘુત્તમ લંબાઈ, એકાઉન્ટ લોકઆઉટ અને Kerberos ટિકિટ નીતિઓ નક્કી કરવાનું છે.
2. #text(weight: "bold", fill: rtech-navy)[Default Domain Controllers Policy:] આ માત્ર 'Domain Controllers' OU પર લિંક થયેલી હોય છે અને ડોમેન કંટ્રોલર્સના સુરક્ષા અધિકારો (User Rights Assignment) તથા ઓડિટિંગનું સંચાલન કરે છે.

#v(6pt)

=== 7.3 GPO પ્રોસેસિંગનો LSDOU ક્રમ અને ઇનહેરિટન્સ (Order of Processing)
જ્યારે કોઈ ક્લાયન્ટ કમ્પ્યુટર બૂટ થાય છે અથવા યુઝર લોગિન કરે છે, ત્યારે વિન્ડોઝ એક ચોક્કસ ક્રમમાં ગ્રુપ પોલિસીઓ પ્રોસેસ કરે છે. તેને #hl-yellow[LSDOU] નિયમ કહેવામાં આવે છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/gpo_inheritance_lsdou.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 7.1: GPO પ્રોસેસિંગનો LSDOU વંશવેલો — Local, Site, Domain, અને Organizational Unit (The Golden Rule)]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[LSDOU પ્રોસેસિંગ ક્રમ (The 'Last Write Wins' Rule):]\
    - #text(weight: "bold", fill: rtech-blue)[1. L (Local Policy):] ક્લાયન્ટ મશીનની સ્થાનિક નીતિ સૌથી પહેલા પ્રોસેસ થાય છે (સૌથી ઓછી પ્રાથમિકતા).
    - #text(weight: "bold", fill: rtech-blue)[2. S (Site Policy):] એક્ટિવ ડિરેક્ટરી સાઇટ પર લિંક GPO બીજા નંબરે લાગુ થાય છે.
    - #text(weight: "bold", fill: rtech-amber)[3. D (Domain Policy):] ડોમેન સ્તરે લિંક GPO ત્રીજા ક્રમે પ્રોસેસ થાય છે અને સાઇટ તથા લોકલને ઓવરરાઇડ કરે છે.
    - #text(weight: "bold", fill: rtech-emerald)[4. OU (Organizational Unit):] OU પર લિંક GPO સૌથી છેલ્લે પ્રોસેસ થાય છે. *તેથી 'Last Write Wins' નિયમ અનુસાર OU ની સેટિંગ્સ સૌથી શક્તિશાળી ગણાય છે અને તે ડોમેન સેટિંગ્સને પણ ઓવરરાઇડ કરી દે છે!*
  ]
)

#v(6pt)

=== 7.4 બ્લોક ઇનહેરિટન્સ (Block Inheritance) અને એન્ફોર્સ્ડ (Enforced) નીતિઓ
- #text(weight: "bold", fill: rtech-amber)[Block Inheritance (બ્લોક ઇનહેરિટન્સ):] જો કોઈ OU (દા.ત. `Special-Projects`) પર રાઇટ-ક્લિક કરીને 'Block Inheritance' સેટ કરવામાં આવે, તો ઉપરના ડોમેન અને સાઇટ સ્તરેથી વારસામાં આવતી તમામ પોલિસીઓ તે OU પર અટકી જાય છે (વાદળી ચિહ્ન).
- #text(weight: "bold", fill: rtech-rose)[Enforced (એન્ફોર્સ્ડ):] જો કંપનીના CISO કે મેનેજમેન્ટ ઈચ્છે કે કોઈપણ બ્રાન્ચ કે OU હેડ કોઈ મહત્વપૂર્ણ સુરક્ષા નીતિ (જેમ કે એન્ટિવાયરસ કે પાસવર્ડ પોલિસી) ને બ્લોક ન કરી શકે, તો ડોમેન GPO પર #hl-orange[Enforced (Lock Symbol)] લગાવી દેવામાં આવે છે. #mark-orange[Enforced GPO ને કોઈપણ Block Inheritance રોકી શકતું નથી; તે દરેક પરિસ્થિતિમાં ફરજિયાત લાગુ પડે છે!]

#v(6pt)

=== 7.5 પ્રેક્ટિકલ લેબ 1: કોર્પોરેટ પાસવર્ડ અને લોકઆઉટ સુરક્ષા નીતિ કન્ફિગરેશન
1. `gpmc.msc` ખોલો. તમારા ડોમેન `corp.rtechlab.local` હેઠળ #hl-yellow[Default Domain Policy] પર રાઇટ-ક્લિક કરો -> #hl-green[Edit] પસંદ કરો.
2. Group Policy Management Editor માં જાઓ:
   `Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Account Policies -> Password Policy`.
3. સુરક્ષા પેરામીટર્સ કન્ફિગર કરો:
   - #text(weight: "bold")[Minimum password length:] #hl-green[10 characters]
   - #text(weight: "bold")[Password must meet complexity requirements:] #hl-green[Enabled]
   - #text(weight: "bold")[Maximum password age:] #hl-green[60 days]
   - #text(weight: "bold")[Enforce password history:] #hl-green[5 passwords remembered]
4. Account Lockout Policy માં જાઓ:
   - #text(weight: "bold")[Account lockout threshold:] #hl-orange[5 invalid logon attempts]
   - #text(weight: "bold")[Account lockout duration:] #hl-green[30 minutes]

#v(6pt)

=== 7.6 પ્રેક્ટિકલ લેબ 2: USB રીમુવેબલ સ્ટોરેજ બ્લોક GPO (Data Leak Prevention)
બેંકો અને કોર્પોરેટ્સમાં ડેટા ચોરી અટકાવવા માટે પેનડ્રાઇવ બ્લોક કરવી ફરજિયાત હોય છે:

1. GPMC માં જાઓ -> #hl-yellow[Group Policy Objects] કન્ટેનર પર રાઇટ-ક્લિક -> #hl-green[New] પસંદ કરો.
2. GPO નું નામ આપો: #hl-yellow[`GPO_Block_USB_Storage`].
3. આ GPO પર રાઇટ-ક્લિક કરીને #hl-green[Edit] પસંદ કરો.
4. નેવિગેટ કરો:
   `Computer Configuration -> Policies -> Administrative Templates -> System -> Removable Storage Access`.
5. જમણી બાજુએ શોધો: #mark-yellow[All Removable Storage classes: Deny all access].
6. આ સેટિંગ પર ડબલ-ક્લિક કરો -> #hl-green[Enabled] રેડિયો બટન પસંદ કરો -> 'OK' કરો.
7. હવે GPMC માં પાછા આવીને આ GPO ને તમારા વર્કસ્ટેશન OU (`RTechLab-Enterprise -> Workstations`) પર ડ્રેગ એન્ડ ડ્રોપ (Link) કરી દો!

#v(6pt)

=== 7.7 પ્રેક્ટિકલ લેબ 3: સેન્ટ્રલાઇઝ્ડ કોર્પોરેટ ડેસ્કટોપ વોલપેપર ડિપ્લોયમેન્ટ GPO
કંપનીના તમામ કર્મચારીઓના ડેસ્કટોપ પર RTechLab નો સત્તાવાર વોલપેપર આપોઆપ સેટ કરવો:

1. વોલપેપર ઇમેજને સર્વરના શેર્ડ ફોલ્ડરમાં મૂકો (દા.ત. `\\SRV-2025-DC01\Wallpaper\corp-bg.jpg`) જેથી તમામ ક્લાયન્ટ્સ તેને વાંચી શકે.
2. GPMC માં નવી GPO બનાવો: #hl-yellow[`GPO_Corporate_Wallpaper`].
3. Edit કરો અને જાઓ:
   `User Configuration -> Policies -> Administrative Templates -> Desktop -> Desktop -> Desktop Wallpaper`.
4. તેને #hl-green[Enabled] કરો. Wallpaper Name માં UNC પાથ દાખલ કરો: #hl-green[`\\SRV-2025-DC01\Wallpaper\corp-bg.jpg`] અને Style માં #hl-yellow['Fill'] પસંદ કરો.
5. આ GPO ને `Corporate-Departments` OU પર લિંક કરો.

#v(6pt)

=== 7.8 ક્લાયન્ટ-સાઇડ GPO રીફ્રેશ અને ટ્રબલશૂટિંગ (`gpupdate /force` & `gpresult`)
ડિફોલ્ટ રૂપે ક્લાયન્ટ કમ્પ્યુટર્સ બેકગ્રાઉન્ડમાં દર #hl-yellow[90 મિનિટે (±30 મિનિટ રેન્ડમ ઓફસેટ સાથે)] ગ્રુપ પોલિસી રીફ્રેશ કરે છે. ડોમેન કંટ્રોલર્સ દર #hl-yellow[5 મિનિટે] રીફ્રેશ થાય છે.

*તાત્કાલિક પોલિસી લાગુ કરવા અને તપાસવા માટેના 3 માસ્ટર કમાન્ડ્સ:*
1. #text(weight: "bold")[તાત્કાલિક પોલિસી લાગુ કરવી:]
```cmd
gpupdate /force
```
આ કમાન્ડ રીફ્રેશ ઇન્ટરવલની રાહ જોયા વિના તમામ યુઝર અને કમ્પ્યુટર પોલિસીઓને તાત્કાલિક ડાઉનલોડ અને એપ્લાય કરે છે.

2. #text(weight: "bold")[પોલિસી એપ્લિકેશનનો કન્સોલ સારાંશ જોવો:]
```cmd
gpresult /r
```
આ સ્ક્રીન પર દર્શાવે છે કે યુઝર અને કમ્પ્યુટર પર કઈ-કઈ GPOs સફળતાપૂર્વક લાગુ થઈ ('Applied Group Policy Objects') અને કઈ નકારી કાઢવામાં આવી.

3. #text(weight: "bold")[વિગતવાર HTML ડાયગ્નોસ્ટિક રિપોર્ટ બનાવવો:]
```cmd
gpresult /h C:\GPO_Report.html
```
આ એક સુંદર ઇન્ટરેક્ટિવ ગ્રાફિકલ HTML રિપોર્ટ બનાવે છે જેને કોઈપણ વેબ બ્રાઉઝરમાં ખોલીને જોઈ શકાય છે.

#v(8pt)

// =============================================================================
// CHAPTER 07 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  ગ્રુપ પોલિસીમાં #hl-yellow[WMI Filters (Windows Management Instrumentation)] નો ઉપયોગ કરીને તમે કોઈપણ GPO ને માત્ર ચોક્કસ હાર્ડવેર કે OS વર્ઝન પર જ લાગુ કરી શકો છો. ઉદાહરણ તરીકે, તમે WMI ક્વેરી લખી શકો: `SELECT * FROM Win32_OperatingSystem WHERE Version LIKE "10.0.26%" AND ProductType = "1"` — અને તે GPO માત્ર Windows 11 24H2 ધરાવતાં મશીનો પર જ લાગુ થશે, બાકી કોઈ સિસ્ટમ પર નહીં!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 07 પ્રેક્ટિસ બહુવિકલ્પી પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "માઇક્રોસોફ્ટ અનુસાર ગ્રુપ પોલિસી પ્રોસેસિંગનો સાચો પ્રમાણભૂત ક્રમ (Order of Precedence) કયો છે?",
  optA: "OU -> Domain -> Site -> Local",
  optB: "Local -> Site -> Domain -> OU (LSDOU)",
  optC: "Site -> Domain -> Local -> OU",
  optD: "Domain -> OU -> Local -> Site",
  ans: "B",
  exp: "GPO પ્રોસેસિંગનો સ્ટાન્ડર્ડ ક્રમ LSDOU (Local, Site, Domain, OU) છે; છેલ્લે લાગુ થતી નીતિ અગાઉની પોલિસીને ઓવરરાઇડ કરે છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "જો કોઈ ચાઇલ્ડ OU પર 'Block Inheritance' લગાવવામાં આવ્યું હોય, પરંતુ ડોમેન સ્તરની GPO પર 'Enforced' સેટ હોય, તો શું પરિણામ આવશે?",
  optA: "GPO એરર આપીને ક્રેશ થઈ જશે",
  optB: "Enforced GPO બ્લોક ઇનહેરિટન્સને અવગણીને ફરજિયાતપણે લાગુ થશે",
  optC: "Block Inheritance હંમેશા Enforced ને રોકી દે છે",
  optD: "કમ્પ્યુટર બૂટ થવાનું બંધ થઈ જશે",
  ans: "B",
  exp: "Enforced સેટિંગનો હેતુ જ બ્લોક ઇનહેરિટન્સને નિષ્પ્રભાવી કરીને કોર્પોરેટ સુરક્ષા નીતિઓનું ફરજિયાત પાલન કરાવવાનો છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "ક્લાયન્ટ કમ્પ્યુટર પર બેકગ્રાઉન્ડ ટાઇમર્સની રાહ જોયા વિના તમામ ગ્રુપ પોલિસીઓને તાત્કાલિક રીફ્રેશ કરવા માટેનો કમાન્ડ કયો છે?",
  optA: "ipconfig /renew",
  optB: "gpupdate /force",
  optC: "net start gpo",
  optD: "dism /online /cleanup-image",
  ans: "B",
  exp: "gpupdate /force કમાન્ડ તરત જ ડોમેન કંટ્રોલર સાથે સંપર્ક કરીને નવીનતમ પોલિસીઓ ડાઉનલોડ અને એપ્લાય કરે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "ક્લાયન્ટ કમ્પ્યુટર્સ પર ગ્રુપ પોલિસીનો ડિફોલ્ટ બેકગ્રાઉન્ડ રીફ્રેશ ઇન્ટરવલ કેટલો હોય છે?",
  optA: "પ્રત્યેક 10 મિનિટ",
  optB: "90 મિનિટ (0 થી 30 મિનિટના રેન્ડમ ઓફસેટ સાથે)",
  optC: "પ્રત્યેક 24 કલાક",
  optD: "માત્ર સિસ્ટમ રીસ્ટાર્ટ પર",
  ans: "B",
  exp: "ક્લાયન્ટ્સ 90 મિનિટ (સાથે 0-30 મિનિટનું રેન્ડમ જીટર જેથી DC પર એક સાથે ભાર ન આવે) માં રીફ્રેશ થાય છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "ક્લાયન્ટ મશીન પર લાગુ થયેલી તમામ ગ્રુપ પોલિસીઓનો સંપૂર્ણ વિગતવાર વિઝ્યુઅલ HTML રિપોર્ટ જનરેટ કરવા માટેનો સાચો કમાન્ડ કયો છે?",
  optA: "gpresult /h report.html",
  optB: "gpmc.exe /export",
  optC: "show-gpo -all",
  optD: "netsh gpo dump",
  ans: "A",
  exp: "gpresult /h <filepath> એક ઇન્ટરેક્ટિવ ગ્રાફિકલ HTML રિપોર્ટ બનાવે છે જેને કોઈપણ બ્રાઉઝરમાં જોઈ શકાય છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'Computer Configuration અને User Configuration પોલિસીઓમાં શું તફાવત છે, અને તે ક્યારે લાગુ થાય છે?'",
  a: "જવાબ: Computer Configuration સેટિંગ્સ સમગ્ર સિસ્ટમ પર લાગુ થાય છે (જેમ કે ફાયરવોલ, બિટલોકર, USB બ્લોક) અને તે ત્યારે પ્રોસેસ થાય છે જ્યારે કમ્પ્યુટર 'બૂટ' થાય છે (લોગિન સ્ક્રીન પહેલાં). User Configuration સેટિંગ્સ ચોક્કસ યુઝરની પ્રોફાઇલ પર લાગુ થાય છે (જેમ કે ડેસ્કટોપ વોલપેપર, બ્રાઉઝર હોમપેજ, સ્ટાર્ટ મેનૂ) અને તે ત્યારે પ્રોસેસ થાય છે જ્યારે યુઝર 'લોગિન' કરે છે.",
  tip: "Capgemini, Wipro અને Infosys ના L1/L2 ઇન્ટરવ્યુમાં આ સવાલ 100% પૂછવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'GPO Slow Link Detection શું છે, અને તે રિમોટ વર્કર્સને કેવી રીતે પ્રભાવિત કરે છે?'",
  a: "જવાબ: જ્યારે કોઈ ક્લાયન્ટ VPN અથવા 500 Kbps કરતાં ધીમા WAN લિંકથી જોડાય છે, ત્યારે વિન્ડોઝ તેને 'Slow Link' જાહેર કરે છે. નેટવર્ક બેન્ડવિડ્થ બચાવવા માટે વિન્ડોઝ ભારે GPOs (જેમ કે સોફ્ટવેર ઇન્સ્ટોલેશન, ફોલ્ડર રીડાયરેક્શન અને મોટી ફાઇલો) નું પ્રોસેસિંગ આપોઆપ રોકી દે છે. માત્ર મુખ્ય વહીવટી અને સુરક્ષા નીતિઓ જ પ્રોસેસ થાય છે.",
  tip: "આ ઊંડો આર્કિટેક્ચરલ જવાબ તમારા વાસ્તવિક પ્રોડક્શન અનુભવને સાબિત કરે છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'એક ચોક્કસ યુઝર પર GPO એપ્લાય નથી થઈ રહી. L2 સપોર્ટ રોલમાં તમે તેને કેવી રીતે ટ્રબલશૂટ કરશો?'",
  a: "જવાબ: ટ્રબલશૂટિંગના 4 ક્રમિક પગલાં: 1. ક્લાયન્ટ પર 'gpresult /r' ચલાવીને જોઈશું કે GPO લાગુ થઈ કે Denied યાદીમાં છે, 2. GPMC માં જઈને GPO ની 'Security Filtering' તપાસીશું કે યુઝર કે તેનું ગ્રુપ 'Read' અને 'Apply group policy' પરમિશન ધરાવે છે કે નહીં, 3. પેરેન્ટ OU પર 'Block Inheritance' તપાસીશું, અને 4. ક્લાયન્ટ પર 'w32tm /resync' તથા 'gpupdate /force' ચલાવીને Event Viewer માં GroupPolicy ઇવેન્ટ્સ (Event ID 1085/1129) તપાસીશું.",
  tip: "સિસ્ટમ સપોર્ટના વાસ્તવિક ટ્રબલશૂટિંગ સિનારિયોમાં આ જવાબ મહત્તમ ગુણ અપાવે છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'Loopback Processing Mode શું છે અને તેને કયા સંજોગોમાં સક્ષમ કરવામાં આવે છે?'",
  a: "જવાબ: સામાન્ય રીતે જ્યારે કોઈ યુઝર કમ્પ્યુટર પર લોગિન કરે છે, ત્યારે તે યુઝરના OU ની User Configuration લાગુ થાય છે. પરંતુ કિયોસ્ક, મીટિંગ રૂમ, અથવા ટર્મિનલ સર્વર્સ (Citrix / RDS) માં આપણે ઈચ્છીએ છીએ કે ભલે કોઈપણ યુઝર (CEO પણ) તે કમ્પ્યુટર પર લોગિન કરે, ડેસ્કટોપ સેટિંગ્સ હંમેશા તે 'કમ્પ્યુટર' ના OU મુજબ જ લાગુ થવી જોઈએ. આના માટે આપણે 'Loopback Processing Mode' (Replace અથવા Merge) સક્ષમ કરીએ છીએ.",
  tip: "RDS અને VDI ઇન્ફ્રાસ્ટ્રક્ચર ઇન્ટરવ્યુઝનો આ સૌથી પ્રિય પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'GPO માં 'Security Filtering' અને 'WMI Filtering' વચ્ચે શું તફાવત છે?'",
  a: "જવાબ: Security Filtering યુઝર કે કમ્પ્યુટરના સિક્યુરિટી ગ્રુપ્સના આધારે નક્કી કરે છે કે GPO કોને મળશે (દા.ત. માત્ર 'GG_HR_Staff'). તેની સામે WMI Filtering હાર્ડવેર અથવા ઓએસના એટ્રિબ્યુટ્સ (જેમ કે માત્ર 'Windows 11', માત્ર 'Dell Laptops', અથવા 'RAM > 8GB') ના આધારે GPO નું ચોક્કસ ટાર્ગેટિંગ કરે છે.",
  tip: "એડવાન્સ્ડ GPO આર્કિટેક્ચર અને પોલિસી ટાર્ગેટિંગની નિપુણતા ચકાસવા આ પ્રશ્ન પૂછાય છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 07 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - ગ્રુપ પોલિસી (GPO) હજારો મશીનોની સુરક્ષા અને ડેસ્કટોપ નિયંત્રણનું કેન્દ્રીય એન્જિન છે (LSDOU ક્રમમાં પ્રોસેસ થાય છે).
      - Enforced GPO કોઈપણ Block Inheritance ને બાયપાસ કરીને ફરજિયાત સુરક્ષા સુનિશ્ચિત કરે છે.
      - `gpupdate /force` અને `gpresult /r` (અથવા `/h`) પ્રત્યેક સિસ્ટમ એડમિનિસ્ટ્રેટરના મુખ્ય દૈનિક GPO ટૂલ્સ છે.
    ]
  ]
)

#pagebreak()
