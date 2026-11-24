// =============================================================================
// CHAPTER 13: BACKUP, DISASTER RECOVERY & ACTIVE DIRECTORY RECYCLE BIN
// =============================================================================

[#metadata("ch13") <chapter-13>]

#chapter-header(
  chapter-num: "CHAPTER 13",
  category: "ભાગ 13 : ડિઝાસ્ટર રિકવરી અને ડેટા સંરક્ષણ (Disaster Recovery & Backup)",
  title: "સર્વર બેકઅપ, ડિઝાસ્ટર રિકવરી અને એક્ટિવ ડિરેક્ટરી રિસાઇકલ બિન",
  subtitle: "3-2-1 એન્ટરપ્રાઇઝ બેકઅપ વ્યૂહરચના · Windows Server Backup · ફુલ vs સિસ્ટમ સ્ટેટ બેકઅપ · AD રિસાઇકલ બિન સક્ષમ કરવું · ડિલીટેડ યુઝરની 1-ક્લિક રિકવરી · wbadmin ઓટોમેશન"
)

=== 13.1 એન્ટરપ્રાઇઝ બેકઅપ વ્યૂહરચના: 3-2-1 નો સુવર્ણ સિદ્ધાંત
એક કુશળ સિસ્ટમ એડમિનિસ્ટ્રેટરની સાચી કસોટી ત્યારે નથી થતી જ્યારે બધું બરાબર ચાલી રહ્યું હોય, પરંતુ ત્યારે થાય છે જ્યારે ડેટાસેન્ટરમાં આગ લાગે, રેન્સમવેર હુમલો થાય, અથવા કોઈ જુનિયર એડમિન ભૂલથી આખી કંપનીનો ડિરેક્ટરી ડેટાબેઝ ડિલીટ કરી નાખે!

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/backup_disaster_recovery_flow.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 13.1: 3-2-1 એન્ટરપ્રાઇઝ બેકઅપ આર્કિટેક્ચર અને એક્ટિવ ડિરેક્ટરી રિસાઇકલ બિન 1-ક્લિક લાઇવ રિકવરી]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[3-2-1 બેકઅપનો સુવર્ણ નિયમ (Global Industry Standard):]\
    - #text(weight: "bold", fill: rtech-blue)[3 કોપીઓ (Three Copies of Data):] તમારી પાસે તમારા ડેટાની ઓછામાં ઓછી 3 નકલો હોવી જોઈએ (1 ઓરિજિનલ પ્રોડક્શન કોપી + 2 સ્વતંત્ર બેકઅપ કોપીઓ).
    - #text(weight: "bold", fill: rtech-amber)[2 અલગ-અલગ મીડિયા (Two Different Media Types):] બેકઅપને બે અલગ-અલગ ટેક્નોલોજી પર સ્ટોર કરો (દા.ત. એક કોપી લોકલ NVMe NAS/SAN સ્ટોરેજ પર અને બીજી કોપી LTO ટેપ ડ્રાઇવ અથવા ક્લાઉડ બ્લોબ પર).
    - #text(weight: "bold", fill: rtech-rose)[1 કોપી ઓફસાઇટ (One Offsite Immutable Copy):] ઓછામાં ઓછી એક બેકઅપ કોપી ભૌગોલિક રીતે અન્ય શહેરમાં અથવા સુરક્ષિત ક્લાઉડમાં હોવી જોઈએ જે 'ઇમ્યુટેબલ' (Write Once Read Many - WORM) હોય જેથી રેન્સમવેર તેને એન્ક્રિપ્ટ ન કરી શકે.
  ]
)

#v(6pt)

=== 13.2 Windows Server Backup ફીચર ઇન્સ્ટોલેશન
માઇક્રોસોફ્ટ વિન્ડોઝ સર્વરમાં એક ઇન-બિલ્ટ બેકઅપ સોલ્યુશન પૂરું પાડે છે:

1. Server Manager -> #hl-green[Add Roles and Features] માં જાઓ.
2. Features સ્ક્રીન સુધી 'Next' દબાવો.
3. યાદીમાં શોધો: #mark-yellow[Windows Server Backup] ચેકબોક્સ પર ટિક કરો.
4. 'Install' પર ક્લિક કરો. આ ટૂલ GUI કન્સોલ (`wbadmin.msc`) અને પાવરફુલ કમાન્ડ-લાઇન યુટિલિટી (`wbadmin.exe`) બંને પ્રદાન કરે છે.

#v(6pt)

=== 13.3 ફુલ સર્વર બેકઅપ વિરુદ્ધ સિસ્ટમ સ્ટેટ બેકઅપ (System State Backup)
- #text(weight: "bold", fill: rtech-navy)[બેયર મેટલ રિકવરી (Bare Metal Recovery - BMR):] આખા સર્વર (C: ડ્રાઇવ, સિસ્ટમ પાર્ટીશન્સ, એપ્લિકેશન્સ અને ડેટા) નો સંપૂર્ણ બેકઅપ. જો ફિઝિકલ સર્વર હાર્ડવેર સંપૂર્ણપણે બળી જાય કે નિષ્ફળ જાય, તો નવા ખાલી સર્વર પર બૂટ ડિસ્ક લગાવીને હૂબહૂ એ જ સર્વર પાછું રીસ્ટોર કરી શકાય છે.
- #text(weight: "bold", fill: rtech-blue)[સિસ્ટમ સ્ટેટ બેકઅપ (System State Backup):] એક્ટિવ ડિરેક્ટરી ડોમેન કંટ્રોલર માટે આ સૌથી મહત્વપૂર્ણ બેકઅપ છે. આમાં માત્ર એ જ ઘટકો સામેલ હોય છે જે ડિરેક્ટરીને જીવંત રાખવા માટે અનિવાર્ય છે:
  1. #hl-yellow[Active Directory Database (`ntds.dit`)]
  2. #hl-green[SYSVOL શેર્ડ ફોલ્ડર (તમામ GPOs અને સ્ક્રિપ્ટ્સ)]
  3. #hl-orange[વિન્ડોઝ સિસ્ટમ રજિસ્ટ્રી (System Registry)]
  4. #hl-green[બૂટ ફાઇલો અને સિસ્ટમ સ્ટાર્ટઅપ ફાઇલો]
  5. #hl-green[Certificate Services ડેટાબેઝ (જો AD CS ઇન્સ્ટોલ હોય)]

*કમાન્ડ-લાઇનથી સિસ્ટમ સ્ટેટ બેકઅપ લેવાની માસ્ટર કમાન્ડ:*
```cmd
wbadmin start systemstatebackup -backupTarget:E: -quiet
```

#v(6pt)

=== 13.4 એક્ટિવ ડિરેક્ટરી રિસાઇકલ બિન (AD Recycle Bin) સક્ષમ કરવું
જૂના વિન્ડોઝ સર્વર (2003/2008) માં જો કોઈ યુઝર કે OU ભૂલથી ડિલીટ થઈ જાય, તો તેને પાછું મેળવવા માટે ડોમેન કંટ્રોલરને રીસ્ટાર્ટ કરીને #hl-orange[DSRM મોડ (Directory Services Restore Mode)] માં લઈ જવું પડતું હતું, નેટવર્ક ડાઉન કરવું પડતું હતું, અને `ntdsutil` થી 'Authoritative Restore' કરવું પડતું હતું (ઓછામાં ઓછો 2 થી 3 કલાકનો ડાઉનટાઇમ).

#mark-yellow[એક્ટિવ ડિરેક્ટરી રિસાઇકલ બિન (AD Recycle Bin) એ એક અભૂતપૂર્વ વરદાન છે જે આકસ્મિક રીતે ડિલીટ થયેલા ઓબ્જેક્ટ્સને સર્વર રીબૂટ કર્યા વગર, કોઈપણ ડાઉનટાઇમ વગર, માત્ર 1 ક્લિકમાં લાઇવ રીસ્ટોર કરવાની સુવિધા આપે છે!]

*રિસાઇકલ બિન સક્ષમ કરવાની સત્તાવાર PowerShell કમાન્ડ:*
```powershell
Enable-ADOptionalFeature -Identity "Recycle Bin Feature" `
  -Scope ForestOrConfigurationSet -Target "corp.rtechlab.local"
```
#warning-box(title: "એકતરફી પ્રક્રિયા (Permanent Activation)")[
  એક વાર જ્યારે તમે એક્ટિવ ડિરેક્ટરી રિસાઇકલ બિનને સક્ષમ કરી દો છો, ત્યારે તેને ફરી ક્યારેય ડિસેબલ (અક્ષમ) કરી શકાતું નથી. આ એક કાયમી અને અત્યંત સુરક્ષિત અપગ્રેડ છે.
]

#v(6pt)

=== 13.5 આકસ્મિક રીતે ડિલીટ થયેલા યુઝર અને OU નું 1-ક્લિકમાં લાઇવ રીસ્ટોરેશન
રિસાઇકલ બિન સક્ષમ થયા પછી જ્યારે પણ કોઈ યુઝર ડિલીટ થાય છે, ત્યારે તેનો ડેટા નાશ પામતો નથી પરંતુ તે #hl-yellow[`Deleted Objects`] કન્ટેનરમાં જતો રહે છે (ડિફોલ્ટ જીવનકાળ: #hl-green[180 દિવસ]):

1. Server Manager -> Tools -> #hl-green[Active Directory Administrative Center (ADAC)] ખોલો (અથવા રનમાં ટાઇપ કરો: #mark-green[`dsac.exe`]).
2. ડાબી બાજુ તમારા ડોમેન `#text(weight: "bold")[corp (local)]` પર ક્લિક કરો.
3. સ્ક્રીન પર #mark-yellow[Deleted Objects] નામનું નવું ફોલ્ડર દેખાશે. તેના પર ડબલ-ક્લિક કરો.
4. તમને તે ડિલીટ થયેલો યુઝર દેખાશે (દા.ત. `Rahul Patel`).
5. તે યુઝર પર રાઇટ-ક્લિક કરો અને પસંદ કરો:
   - #hl-green[Restore:] યુઝર બરાબર એ જ OU (`Corporate-Departments -> HR`) માં પાછો પહોંચી જશે જ્યાં તે પહેલા હતો!
   - #hl-yellow[Restore To...:] જો મૂળ OU પણ ડિલીટ થઈ ગયું હોય, તો તમે તેને અન્ય કોઈ OU માં રીસ્ટોર કરી શકો છો.
6. *જાદુ:* યુઝરનો મૂળ પાસવર્ડ, તેની તમામ સિક્યોરિટી ગ્રુપ સદસ્યતાઓ, અને તેનો ઇન્ટરનલ SID 100% અકબંધ રહે છે! કર્મચારી તરત જ તે જ જૂના પાસવર્ડથી લોગઇન કરી શકે છે.

#v(6pt)

=== 13.6 `wbadmin` કમાન્ડ-લાઇન બેકઅપ શિડ્યુલિંગ અને ઓટોમેશન
પ્રોડક્શનમાં એડમિનિસ્ટ્રેટર દરરોજ રાત્રે 11:00 વાગ્યે સ્વચાલિત બેકઅપ માટે Windows Task Scheduler માં સ્ક્રિપ્ટ લગાવે છે:

```cmd
:: ડેઇલી અનએટેન્ડેડ સિસ્ટમ સ્ટેટ બેકઅપ સ્ક્રિપ્ટ
wbadmin enable backup -addtarget:{GUID-Storage-Drive} -schedule:23:00 -systemState -include:C:
```

#v(8pt)

// =============================================================================
// CHAPTER 13 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  જ્યારે એક્ટિવ ડિરેક્ટરીમાં કોઈ ઓબ્જેક્ટ ડિલીટ થાય છે અને રિસાઇકલ બિન ઓન ન હોય, ત્યારે તે સંપૂર્ણપણે ભૂંસાતો નથી પરંતુ એક અર્ધ-જીવંત અવસ્થામાં જાય છે જેને #hl-yellow['Tombstone'] (કબરનો પથ્થર) કહેવામાં આવે છે. ટોમ્બસ્ટોનનો ડિફોલ્ટ જીવનકાળ 180 દિવસ હોય છે, પરંતુ તેમાં ઓબ્જેક્ટના મોટાભાગના એટ્રિબ્યુટ્સ (જેમ કે પાસવર્ડ, ગ્રુપ મેમ્બરશિપ, ફોન નંબર) સ્ટ્રિપ (દૂર) કરી દેવામાં આવે છે. AD Recycle Bin આ જ સમસ્યાનો ઉકેલ લાવીને 100% એટ્રિબ્યુટ્સને સુરક્ષિત રાખે છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 13 પ્રેક્ટિસ બહુવિકલ્પ પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "એન્ટરપ્રાઇઝ ડેટા સંરક્ષણમાં વપરાતા '3-2-1 બેકઅપ નિયમ' અનુસાર ડેટાની ન્યૂનતમ કેટલી સ્વતંત્ર કોપીઓ હોવી જોઈએ?",
  optA: "માત્ર 1 કોપી",
  optB: "ઓછામાં ઓછી 2 કોપીઓ",
  optC: "ઓછામાં ઓછી 3 કોપીઓ (1 પ્રોડક્શન + 2 બેકઅપ)",
  optD: "10 કોપીઓ",
  ans: "C",
  exp: "3-2-1 નિયમ હેઠળ 3 કોપીઓ, 2 અલગ-અલગ મીડિયા પ્રકારો, અને 1 કોપી ઓફસાઇટ અનિવાર્ય છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "એક્ટિવ ડિરેક્ટરી ડોમેન કંટ્રોલરના 'System State Backup' માં નીચેનામાંથી કયો ઘટક સામેલ હોતો નથી?",
  optA: "Active Directory ડેટાબેઝ (ntds.dit)",
  optB: "SYSVOL ફોલ્ડર",
  optC: "સિસ્ટમ રજિસ્ટ્રી (Registry)",
  optD: "D: ડ્રાઇવ પર સંગ્રહિત યુઝરની પર્સનલ વિડિયો ફાઇલો",
  ans: "D",
  exp: "સિસ્ટમ સ્ટેટ માત્ર ઓએસ અને ડિરેક્ટરી ઘટકોનો બેકઅપ લે છે, સામાન્ય યુઝર ડેટા ફાઇલોનો નહીં."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "એક્ટિવ ડિરેક્ટરી રિસાઇકલ બિન સક્ષમ હોય ત્યારે ભૂલથી ડિલીટ થયેલા ઓબ્જેક્ટ્સ ડિફોલ્ટ રીતે કેટલા દિવસો સુધી 'Deleted Objects' માં સુરક્ષિત રહે છે?",
  optA: "30 દિવસ",
  optB: "60 દિવસ",
  optC: "90 દિવસ",
  optD: "180 દિવસ (Deleted Object Lifetime)",
  ans: "D",
  exp: "માઇક્રોસોફ્ટ દ્વારા ડિફોલ્ટ Deleted Object Lifetime 180 દિવસ નિર્ધારિત કરવામાં આવી છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "કમાન્ડ પ્રોમ્પ્ટથી વિન્ડોઝ સર્વરનો તાત્કાલિક સિસ્ટમ સ્ટેટ બેકઅપ શરૂ કરવા માટે કઈ સત્તાવાર યુટિલિટીનો ઉપયોગ થાય છે?",
  optA: "robocopy.exe",
  optB: "wbadmin.exe",
  optC: "ntdsutil.exe",
  optD: "dcdiag.exe",
  ans: "B",
  exp: "wbadmin start systemstatebackup કમાન્ડ સિસ્ટમ સ્ટેટ બેકઅપ શરૂ કરવાનું સત્તાવાર CLI ટૂલ છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "ડિલીટ થયેલા યુઝરને એક્ટિવ ડિરેક્ટરી રિસાઇકલ બિન દ્વારા 1 ક્લિકમાં રીસ્ટોર કરવા માટે કયા ગ્રાફિકલ ટૂલનો ઉપયોગ થાય છે?",
  optA: "Active Directory Users and Computers (dsa.msc)",
  optB: "Active Directory Administrative Center (dsac.exe)",
  optC: "Group Policy Management Console (gpmc.msc)",
  optD: "Disk Management (diskmgmt.msc)",
  ans: "B",
  exp: "Active Directory Administrative Center (ADAC - dsac.exe) ની અંદર 'Deleted Objects' કન્ટેનર ઉપલબ્ધ હોય છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'Authoritative Restore અને Non-Authoritative Restore વચ્ચે શું તફાવત હોય છે?'",
  a: "ઉત્તર: જ્યારે આપણે કોઈ બેકઅપમાંથી ડોમેન કંટ્રોલરને રીસ્ટોર કરીએ છીએ, ત્યારે ડિફોલ્ટ રીતે તે 'Non-Authoritative' હોય છે — એટલે કે રીસ્ટોર થયા પછી તે નેટવર્કના અન્ય DCs નો સંપર્ક કરે છે અને તેમની પાસે રહેલા નવીનતમ ડેટાબેઝથી પોતાની જાતને અપડેટ કરી લે છે. પરંતુ જો કોઈએ સમગ્ર ડોમેનમાંથી ભૂલથી કોઈ મહત્વપૂર્ણ OU ડિલીટ કરી નાખ્યું હોય, તો બેકઅપમાંથી તે OU ને 'Authoritative' માર્ક કરવામાં આવે છે (ntdsutil દ્વારા USN નંબર વધારીને). આનાથી અન્ય તમામ DCs તે રીસ્ટોર થયેલા ઓબ્જેક્ટને સૌથી નવો માનીને પોતાનામાં સ્વીકારી લે છે.",
  tip: "HCL, Infosys અને TCS ના L2/L3 ડિરેક્ટરી સર્વિસિસ ઇન્ટરવ્યુનો આ સૌથી નિર્ણાયક પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'Active Directory Recycle Bin ને સક્ષમ કર્યા પછી શું કોઈ ડિલીટ થયેલા યુઝરનો પાસવર્ડ રીસેટ કરવો પડે છે?'",
  a: "ઉત્તર: બિલકુલ નહીં! આ જ AD Recycle Bin ની સૌથી મોટી તાકાત છે. જ્યારે યુઝરને રીસ્ટોર કરવામાં આવે છે, ત્યારે તેનો પાસવર્ડ હેશ, તેનો મૂળ SID (Security Identifier), તેની તમામ સિક્યોરિટી ગ્રુપ્સની સદસ્યતા અને તેના તમામ 150+ એટ્રિબ્યુટ્સ 100% મૂળ સ્થિતિમાં પાછા આવે છે. કર્મચારી પાસવર્ડ બદલ્યા વગર તરત જ લોગઇન કરી શકે છે.",
  tip: "આ ઉત્તર સાબિત કરે છે કે તમને ટૂલના વ્યવહારુ લાભોની ઊંડી સમજ છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'ડેટાસેન્ટરમાં RTO અને RPO નો શું અર્થ થાય છે?'",
  a: "ઉત્તર: RTO (Recovery Time Objective) એ મહત્તમ સ્વીકાર્ય સમય છે જેની અંદર સિસ્ટમ ક્રેશ પછી સેવાઓને ફરી શરૂ કરવી અનિવાર્ય હોય છે (દા.ત. 2 કલાકની અંદર). RPO (Recovery Point Objective) એ મહત્તમ સ્વીકાર્ય ડેટા નુકસાન છે જેને કંપની સહન કરી શકે છે (દા.ત. જો રાત્રે 12:00 વાગ્યે બેકઅપ લેવાયો હોય અને બપોરે 2:00 વાગ્યે ક્રેશ થાય, તો 14 કલાકનો RPO ડેટા લોસ થયો). એડમિનિસ્ટ્રેટરનું લક્ષ્ય RTO અને RPO ને લઘુત્તમ રાખવાનું હોય છે.",
  tip: "ડિઝાસ્ટર રિકવરી અને સર્વિસ લેવલ એગ્રીમેન્ટ (SLA) નો આ મુખ્ય પાયાનો પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'શું આપણે એક્ટિવ ડિરેક્ટરી બેકઅપને એ જ ડ્રાઇવ પર સેવ કરી શકીએ છીએ જેના પર C: વિન્ડોઝ ઇન્સ્ટોલ હોય?'",
  a: "ઉત્તર: ના, Windows Server Backup ક્યારેય સિસ્ટમ સ્ટેટ બેકઅપને એ જ વોલ્યુમ (C:) પર સ્ટોર કરવાની પરવાનગી આપતું નથી જેના પર ઓપરેટિંગ સિસ્ટમ પોતે ચાલી રહી હોય. આ માટે એક અલગ સમર્પિત ભૌતિક/વર્ચ્યુઅલ ડિસ્ક (દા.ત. E: ડ્રાઇવ અથવા નેટવર્ક શેર) હોવી અનિવાર્ય છે.",
  tip: "પ્રેક્ટિકલ અમલીકરણ અને લેબ અનુભવ તપાસતો આ સચોટ પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'જો Active Directory Recycle Bin ફીચરને એક વાર સક્ષમ કરી દેવામાં આવે, તો શું તેને પાછળથી બંધ કરી શકાય?'",
  a: "ઉત્તર: ના, માઇક્રોસોફ્ટના સત્તાવાર નિયમો અનુસાર Recycle Bin ફીચરનું એક્ટિવેશન એક 'એકતરફી કાયમી પ્રક્રિયા' (Irreversible Process) છે. એક વાર ફોરેસ્ટમાં સક્ષમ થયા પછી તેને ક્યારેય ડિસેબલ કરી શકાતું નથી.",
  tip: "માઇક્રોસોફ્ટ સર્ટિફિકેશન અને ટેકનિકલ ઇન્ટરવ્યુ માટેનો આ પ્રમાણભૂત પ્રશ્ન છે."
)

#v(5pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "black", fill: rtech-navy)[🛠️ બેકઅપ અને રિકવરી ટ્રબલશૂટિંગ માર્ગદર્શિકા (Disaster Recovery Quick Guide):]\
    #v(3pt)
    #text(size: 7.5pt, fill: rtech-text)[
      - #text(weight: "bold", fill: rtech-rose)[ભૂલ 1: 'The backup target volume is invalid':] વિન્ડોઝ સર્વર ક્યારેય એ જ C: ડ્રાઇવ પર બેકઅપની મંજૂરી આપતું નથી જેના પર OS હોય; બેકઅપ માટે હંમેશા સમર્પિત E: ડ્રાઇવ અથવા નેટવર્ક શેરનો ઉપયોગ કરો.
      - #text(weight: "bold", fill: rtech-amber)[ભૂલ 2: 'VSS Writer timed out (Event ID 8229)':] વોલ્યુમ શેડો કોપી સર્વિસમાં અન્ય બેકઅપ એજન્ટના સંઘર્ષને કારણે થાય છે; `vssadmin list writers` ચલાવીને સ્થિતિ તપાસો.
      - #text(weight: "bold", fill: rtech-emerald)[ભૂલ 3: 'Recycle Bin Deleted Objects ફોલ્ડર દેખાતું નથી':] Active Directory Administrative Center (ADAC) ને બંધ કરીને ફરી ખોલો અથવા F5 દબાવીને રિફ્રેશ કરો.
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
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[✅ પ્રકરણ 13 ચકાસણી ચેકલિસ્ટ (Disaster Recovery Checklist):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - [ ] Windows Server Backup ફીચર અને PowerShell મોડ્યુલ સફળતાપૂર્વક ઇન્સ્ટોલ કરેલા છે.
      - [ ] Active Directory Recycle Bin ફીચર સમગ્ર ફોરેસ્ટમાં કાયમી ધોરણે સક્ષમ કરેલ છે.
      - [ ] ટેસ્ટ યુઝરને ડિલીટ કરીને ADAC ના 'Deleted Objects' માંથી 1 ક્લિકમાં લાઇવ રીસ્ટોર ચકાસાયેલ છે.
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
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 13 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - 3-2-1 બેકઅપ સિદ્ધાંત એન્ટરપ્રાઇઝ ડેટા સુરક્ષાનો આંતરરાષ્ટ્રીય પાયો છે.
      - System State Backup ડોમેન કંટ્રોલરના મુખ્ય ઘટકો (`ntds.dit`, `SYSVOL`, Registry) ને સુરક્ષિત રાખે છે.
      - Active Directory Recycle Bin આકસ્મિક ડિલીટ થવા પર સર્વર રીબૂટ વગર 1-ક્લિક લાઇવ રિકવરી પ્રદાન કરે છે.
    ]
  ]
)

#pagebreak()
