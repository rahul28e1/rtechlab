// =============================================================================
// CHAPTER 10: FILE SERVER RESOURCE MANAGER (FSRM), NTFS & QUOTA MANAGEMENT
// =============================================================================

[#metadata("ch10") <chapter-10>]

#chapter-header(
  chapter-num: "CHAPTER 10",
  category: "ભાગ 10 : સ્ટોરેજ, શેરિંગ અને ફાઇલ રિસોર્સ મેનેજમેન્ટ (Storage & FSRM)",
  title: "ફાઇલ સર્વર રિસોર્સ મેનેજર (FSRM), NTFS પરવાનગીઓ અને ક્વોટા વ્યવસ્થાપન",
  subtitle: "શેર્ડ ફોલ્ડર્સ · SMB 3.1.1 · શેર vs NTFS પરવાનગીઓ (ઇફેક્ટિવ ફોર્મ્યુલા) · FSRM રોલ · હાર્ડ vs સોફ્ટ સ્ટોરેજ ક્વોટા · ફાઇલ સ્ક્રીનિંગ (MP3/EXE બ્લોકિંગ) · સ્ટોરેજ રિપોર્ટ્સ"
)

=== 10.1 એન્ટરપ્રાઇઝ ફાઇલ શેરિંગ આર્કિટેક્ચર અને SMB 3.1.1 પ્રોટોકોલ
કોઈપણ કોર્પોરેટ સંસ્થામાં કર્મચારીઓનું દૈનિક કાર્ય ફાઇલો (Word, Excel, PDFs, પ્રોજેક્ટ કોડ) ના આદાન-પ્રદાન પર નિર્ભર હોય છે. જો તમામ કર્મચારીઓ ડેટાને પોતાના અંગત લેપટોપ પર રાખશે, તો લેપટોપ ખોવાઈ જવા કે ખરાબ થવા પર કંપનીનો સમગ્ર ડેટા નષ્ટ થઈ શકે છે.

#mark-yellow[ફાઇલ સર્વર (File Server) એક કેન્દ્રીય સર્વર છે જે નેટવર્ક પર તમામ વિભાગોના (HR, Accounts, Legal) શેર કરેલા ડેટાને સુરક્ષિત સંગ્રહિત કરે છે અને SMB (Server Message Block) પ્રોટોકોલ દ્વારા એક્સેસ પ્રદાન કરે છે.]

વિન્ડોઝ સર્વર 2025 માં ફાઇલ શેરિંગ #hl-green[SMB 3.1.1] પર આધારિત છે:
- ડિફૉલ્ટ પોર્ટ: #hl-green[TCP Port 445]
- #text(weight: "bold", fill: rtech-navy)[SMB સાઇનિંગ (SMB Signing):] Server 2025 માં ડિફૉલ્ટ રૂપે ફરજિયાત (Mandatory) છે જે મેન-ઇન-ધ-મિડલ રિલે હુમલાઓને અટકાવે છે.
- #text(weight: "bold", fill: rtech-navy)[SMB એન્ક્રિપ્શન (SMB Encryption):] એન્ડ-ટુ-એન્ડ AES-256-GCM એન્ક્રિપ્શન જે બિનઅધિકૃત નેટવર્ક સ્નિફિંગથી ડેટાને સુરક્ષિત રાખે છે.

#v(4pt)

=== 10.2 શેર પરવાનગીઓ (Share Permissions) વિરુદ્ધ NTFS પરવાનગીઓ
આ વિન્ડોઝ ઇન્ફ્રાસ્ટ્રક્ચરના સૌથી મહત્વપૂર્ણ વિષયોમાંથી એક છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/ntfs_vs_share_matrix.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 10.1: શેર પરવાનગીઓ વિરુદ્ધ NTFS પરવાનગીઓ — અસરકારક પરવાનગી ફોર્મ્યુલા અને મોસ્ટ રેસ્ટ્રિક્ટિવ નિયમ]
]

#v(4pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "શેર પરવાનગીઓ (Share Permissions)")[
      - માત્ર ત્યારે જ લાગુ થાય છે જ્યારે વપરાશકર્તા નેટવર્ક દ્વારા શેર કરેલા ફોલ્ડરને એક્સેસ કરે છે (`\\Server\Share`).
      - જો વપરાશકર્તા સર્વર પર સ્થાનિક રીતે (Locally) લોગિન હોય, તો શેર પરવાનગી કાર્ય કરતી નથી.
      - માત્ર 3 સ્તરો હોય છે: #hl-yellow[Read], #hl-green[Change], અને #hl-orange[Full Control].
    ]
  ],
  [
    #info-box(title: "NTFS સુરક્ષા પરવાનગીઓ (Security Permissions)")[
      - સ્થાનિક (Local) અને નેટવર્ક (Network) બંને પ્રકારના એક્સેસ પર 100% લાગુ થાય છે.
      - માત્ર NTFS ફોર્મેટેડ વોલ્યુમ પર જ કાર્ય કરે છે.
      - અત્યંત વિસ્તૃત સ્તરો: #hl-yellow[Read], #hl-green[Write], #hl-orange[Modify], #hl-green[Read & Execute], અને #hl-orange[Full Control].
    ]
  ]
)

#v(6pt)

=== 10.3 અસરકારક પરવાનગીઓનો નિયમ (The Most Restrictive Rule)
જ્યારે કોઈ વપરાશકર્તા નેટવર્ક પરથી કોઈપણ ફોલ્ડરમાં ફાઇલ ખોલવાનો પ્રયાસ કરે છે, ત્યારે વિન્ડોઝ શેર પરવાનગી અને NTFS પરવાનગી બંનેની તુલના કરે છે:

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[અસરકારક પરવાનગીઓનો ગોલ્ડન નિયમ (The Golden Law):]\
    #align(center)[#text(size: 9.5pt, weight: "black", fill: rtech-navy)[
      Effective Permission = Most Restrictive (Share Permission, NTFS Permission)
    ]]\
    #text(size: 7.5pt, fill: rtech-text)[
      - *ઉદાહરણ 1:* જો Share પરવાનગી = #hl-green[Read] હોય અને NTFS પરવાનગી = #hl-green[Full Control] હોય, તો અસરકારક પરવાનગી માત્ર #mark-yellow[Read] જ રહેશે (વપરાશકર્તા ફાઇલમાં કોઈ ફેરફાર કરી શકશે નહીં)!
      - *ઉદાહરણ 2:* જો Share પરવાનગી = #hl-green[Full Control] હોય અને NTFS પરવાનગી = #hl-green[Modify] હોય, તો અસરકારક પરવાનગી #mark-green[Modify] રહેશે!
      - #text(weight: "bold", fill: rtech-blue)[એન્ટરપ્રાઇઝ શ્રેષ્ઠ પદ્ધતિ:] શેર પરવાનગીઓને હંમેશાં `Authenticated Users = Change` (અથવા `Full Control`) પર ખુલ્લી રાખો, અને વાસ્તવિક સુરક્ષા નિયંત્રણ માત્ર *NTFS ACLs* દ્વારા જ સંચાલિત કરો!
    ]
  ]
)

#v(6pt)

=== 10.4 ફાઇલ સર્વર રિસોર્સ મેનેજર (FSRM) રોલ ઇન્સ્ટોલેશન
FSRM એ માઇક્રોસોફ્ટનું અદ્યતન સ્ટોરેજ મેનેજમેન્ટ ટૂલ છે જે વપરાશકર્તાઓ દ્વારા ડિસ્ક સ્પેસનો બગાડ અને બિનઅધિકૃત ફાઇલો સંગ્રહિત થતી અટકાવવાની સુવિધા આપે છે:

1. Server Manager માં જાઓ -> #hl-green[Add Roles and Features] પર ક્લિક કરો.
2. Server Roles માં -> #text(weight: "bold")[File and Storage Services] -> #text(weight: "bold")[File and iSCSI Services] વિસ્તૃત કરો.
3. #mark-yellow[File Server Resource Manager] ચેકબોક્સ પર ટિક કરો.
4. 'Add Features' (FSRM મેનેજમેન્ટ ટૂલ્સ) પસંદ કરીને 'Install' કરો.
5. ઇન્સ્ટોલેશન પછી Tools મેનૂમાંથી #hl-green[File Server Resource Manager] ખોલો (અથવા રનમાં ટાઇપ કરો: #mark-green[`fsrm.msc`]).

#v(6pt)

=== 10.5 સ્ટોરેજ ક્વોટા વ્યવસ્થાપન: હાર્ડ ક્વોટા વિરુદ્ધ સોફ્ટ ક્વોટા (Quota Management)
ક્વોટા નિયંત્રણ વિના કોઈપણ કર્મચારી સર્વર પર સેંકડો ગીગાબાઇટ્સની અંગત ફાઇલો અપલોડ કરીને આખી હાર્ડ ડિસ્ક ભરી શકે છે:

- #text(weight: "bold", fill: rtech-rose)[હાર્ડ ક્વોટા (Hard Quota):] આ એક સખત મર્યાદા છે. વપરાશકર્તાની ફાઇલ સ્ટોરેજ મર્યાદા 100% (દા.ત. 10 GB) એ પહોંચતાં જ વિન્ડોઝ તેને આગળ 1 બાઇટ પણ લખવા દેતું નથી અને સ્ક્રીન પર 'There is not enough space on the disk' નો એરર આવે છે.
- #text(weight: "bold", fill: rtech-amber)[સોફ્ટ ક્વોટા (Soft Quota):] આ માત્ર મોનિટરિંગ મર્યાદા છે. વપરાશકર્તા 100% સ્પેસ ભરી લે, તો પણ ફાઇલ સેવિંગ બ્લોક થતું નથી, પરંતુ સિસ્ટમ એડમિનિસ્ટ્રેટર અને વપરાશકર્તાને ઇમેઇલ ચેતવણી મોકલવામાં આવે છે જેથી તેઓ વધારાની સ્ટોરેજની વ્યવસ્થા કરી શકે.

*ક્વોટા કન્ફિગરેશન સ્ટેપ્સ:*
1. `fsrm.msc` માં ડાબી બાજુએ #hl-yellow[Quota Management -> Quotas] પર જાઓ.
2. જમણી બાજુએ 'Create Quota...' પર ક્લિક કરો.
3. Quota path: તમારા શેર કરેલા ફોલ્ડરનો પાથ પસંદ કરો (દા.ત. `C:\Shares\HR_Data`).
4. 'Derive properties from this quota template': #hl-green['10 GB Limit (Hard Quota)'] પસંદ કરો.
5. Notification Thresholds: 85% અને 95% ભરાઈ જવા પર ઓટોમેટિક ઇમેઇલ એલર્ટ પસંદ કરો. 'Create' પર ક્લિક કરો.

#v(6pt)

=== 10.6 ફાઇલ સ્ક્રીનિંગ (File Screening): ઑડિયો, વિડિયો અને માલવેર બ્લોકિંગ
કર્મચારીઓ ઘણીવાર કંપનીના સર્વર પર પાઇરેટેડ મૂવીઝ, ગીતો (`.mp3`, `.mp4`), અથવા પર્સનલ બેકઅપ સ્ટોર કરવા લાગે છે. ફાઇલ સ્ક્રીનિંગ આને તાત્કાલિક અટકાવી દે છે:

1. FSRM કન્સોલમાં જાઓ: #hl-yellow[File Screening Management -> File Screens].
2. 'Create File Screen...' પર ક્લિક કરો.
3. File screen path: `C:\Shares\` પસંદ કરો.
4. 'Block Audio and Video Files' ટેમ્પ્લેટ પસંદ કરો (જેમાં `*.mp3`, `*.mp4`, `*.avi`, `*.mkv`, `*.wav` પહેલેથી વ્યાખ્યાયિત હોય છે).
5. Screening Type માં #mark-yellow[Active screening: Do not allow users to save unauthorized files] પસંદ કરો.
6. 'Create' દબાવો. હવે જો કોઈ વપરાશકર્તા તે ફોલ્ડરમાં MP3 કે MP4 ફાઇલ કોપી કરવાનો પ્રયાસ કરશે, તો વિન્ડોઝ તરત જ #hl-orange['Access is Denied'] નો ડાયલોગ દર્શાવીને ફાઇલને સેવ થતી અટકાવી દેશે!

#v(6pt)

=== 10.7 ઓટોમેટેડ સ્ટોરેજ વપરાશ રિપોર્ટ્સ (Storage Reports Management)
FSRM એડમિનિસ્ટ્રેટરને સ્ટોરેજના ઓડિટ રિપોર્ટ્સ આપમેળે ઇમેઇલ કરવાની સુવિધા આપે છે:
- #text(weight: "bold")[Duplicate Files Report:] ડિસ્ક પર એક જ ફાઇલની ડુપ્લિકેટ નકલો શોધીને મૂલ્યવાન સ્ટોરેજ બચાવે છે.
- #text(weight: "bold")[Large Files Report:] 500 MB કરતાં મોટી ફાઇલોની યાદી બહાર પાડે છે.
- #text(weight: "bold")[Least Recently Accessed Files:] તે જૂની ફાઇલો જે 1 વર્ષથી કોઈએ ખોલી નથી (આર્કાઇવ કરવા યોગ્ય).

#v(8pt)

// =============================================================================
// CHAPTER 10 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  વિન્ડોઝ સર્વરમાં એક અદભુત ફીચર છે જેને #hl-yellow[Volume Shadow Copies (VSS / Previous Versions)] કહેવામાં આવે છે. જો કોઈ કર્મચારી ભૂલથી 5 કલાકની મહેનતવાળી Excel ફાઇલ ડિલીટ કરી દે અથવા ઓવરરાઇટ કરી દે, તો એડમિનિસ્ટ્રેટરને બેકઅપ ટેપ શોધવાની જરૂર પડતી નથી! કર્મચારી ફાઇલ પર રાઇટ-ક્લિક કરીને #hl-green['Restore previous versions'] પર ક્લિક કરે છે અને સવારે 9:00 વાગ્યાની સુરક્ષિત નકલ એડમિનની મદદ વિના જાતે જ રિસ્ટોર કરી લે છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 10 સ્વાધ્યાય બહુવિકલ્પી પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "જો કોઈ શેર્ડ ફોલ્ડર પર Share Permission 'Read' હોય અને NTFS Permission 'Full Control' હોય, તો નેટવર્કથી જોડાતા વપરાશકર્તાની અસરકારક પરવાનગી (Effective Permission) શું હશે?",
  optA: "Full Control",
  optB: "Modify",
  optC: "Read",
  optD: "Write Only",
  ans: "C",
  exp: "અસરકારક પરવાનગીનો નિયમ છે: Share અને NTFS માંથી જે સૌથી વધુ પ્રતિબંધાત્મક (Most Restrictive) હોય, તે જ લાગુ થાય છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "FSRM માં તે ક્વોટા પ્રકારને શું કહેવાય છે જે નિર્ધારિત મર્યાદા સુધી પહોંચતાં જ વપરાશકર્તાને આગળ ફાઇલો સેવ કરતાં સંપૂર્ણપણે અટકાવી દે છે?",
  optA: "Soft Quota",
  optB: "Hard Quota",
  optC: "Dynamic Quota",
  optD: "Elastic Quota",
  ans: "B",
  exp: "Hard Quota મર્યાદા વટાવતાં જ 'Disk is full' એરર આપીને રાઇટ ઑપરેશનને 100% બ્લોક કરી દે છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "કંપનીના શેર્ડ ફોલ્ડરમાં કર્મચારીઓ દ્વારા MP3 ગીતો અને MP4 ફિલ્મો સેવ થતી અટકાવવા માટે FSRM ના કયા ફીચરનો ઉપયોગ થાય છે?",
  optA: "Storage Spaces",
  optB: "File Screening Management",
  optC: "DNS Scavenging",
  optD: "Shadow Copies",
  ans: "B",
  exp: "File Screening પદ્ધતિ પ્રતિબંધિત ફાઇલ એક્સટેન્શન (.mp3, .mp4, .exe) ને સ્ટોરેજમાં સેવ થતાં અટકાવે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "વિન્ડોઝ સર્વરમાં File Server Resource Manager કન્સોલ સીધું ખોલવાનો સત્તાવાર રન કમાન્ડ કયો છે?",
  optA: "diskmgmt.msc",
  optB: "fsrm.msc",
  optC: "storagemgmt.msc",
  optD: "fsmgmt.msc",
  ans: "B",
  exp: "fsrm.msc સીધું File Server Resource Manager કન્સોલ ખોલે છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "વિન્ડોઝ સર્વર 2025 માં ફાઇલ શેરિંગ (SMB 3.1.1) ડિફૉલ્ટ રૂપે કયા પ્રમાણભૂત નેટવર્ક પોર્ટ પર કાર્ય કરે છે?",
  optA: "TCP પોર્ટ 80",
  optB: "TCP પોર્ટ 445",
  optC: "TCP પોર્ટ 3389",
  optD: "UDP પોર્ટ 53",
  ans: "B",
  exp: "SMB (Server Message Block) ફાઇલ શેરિંગ સત્તાવાર રીતે TCP પોર્ટ 445 પર કાર્ય કરે છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોચના MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'શેર પરવાનગી અને NTFS પરવાનગીમાં કોણ વધુ શક્તિશાળી છે, અને પ્રોડક્શનમાં માઇક્રોસોફ્ટની સત્તાવાર ભલામણ શું છે?'",
  a: "જવાબ: નેટવર્ક એક્સેસ વખતે બંનેમાંથી જે 'સૌથી વધુ પ્રતિબંધાત્મક' (Most Restrictive) હોય તે લાગુ થાય છે. જોકે સ્થાનિક એક્સેસ પર માત્ર NTFS જ કાર્ય કરે છે. માઇક્રોસોફ્ટની સત્તાવાર શ્રેષ્ઠ ભલામણ એ છે કે શેર પરવાનગીઓને 'Authenticated Users = Change' અથવા 'Full Control' પર ખુલ્લી રાખવી, અને સુરક્ષાનું સંપૂર્ણ સૂક્ષ્મ નિયંત્રણ (Granular Control) માત્ર NTFS ACLs દ્વારા કરવું કારણ કે NTFS માં વારસો (Inheritance), માલિકી (Ownership) અને 13 વિસ્તૃત પરવાનગી સ્તરો ઉપલબ્ધ હોય છે.",
  tip: "Capgemini, Infosys અને TCS ના L1/L2 ઇન્ફ્રાસ્ટ્રક્ચર ઇન્ટરવ્યુનો આ ક્લાસિક પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'NTFS Permissions માં 'Modify' અને 'Write' પરવાનગી વચ્ચે શું તફાવત છે?'",
  a: "જવાબ: 'Write' પરવાનગી વપરાશકર્તાને નવી ફાઇલ બનાવવાનો અને હાલની ફાઇલમાં ડેટા ઉમેરવાનો અધિકાર આપે છે, પરંતુ તે ફાઇલને 'ડિલીટ' કરી શકતો નથી. 'Modify' પરવાનગીમાં Read, Write, Execute ની સાથે-સાથે ફાઇલો અને સબ-ફોલ્ડર્સને 'ડિલીટ' કરવાનો સંપૂર્ણ અધિકાર સામેલ હોય છે.",
  tip: "આ સૂક્ષ્મ તફાવત મોટાભાગના ઉમેદવારો જાણતા નથી હોતા; સાચો ઉત્તર તમને તરત જ સ્પર્ધામાં આગળ લઈ જાય છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'FSRM માં Active Screening અને Passive Screening વચ્ચે શું તફાવત છે?'",
  a: "જવાબ: Active Screening વપરાશકર્તાને પ્રતિબંધિત ફાઇલ (દા.ત. song.mp3) સેવ કરતાં તરત જ અટકાવી દે છે (Access Denied) અને એડમિનને ઇમેઇલ મોકલે છે. Passive Screening વપરાશકર્તાને ફાઇલ સેવ કરવા દે છે (કામ અટકાવતી નથી), પરંતુ બેકગ્રાઉન્ડમાં ઇવેન્ટ લોગ અને એડમિનને ઇમેઇલ એલર્ટ મોકલી આપે છે જેથી ઑડિટ અને મોનિટરિંગ થઈ શકે.",
  tip: "સ્ટોરેજ એડમિનિસ્ટ્રેશન અને કમ્પ્લાયન્સ રોલ્સમાં આ પ્રશ્ન વારંવાર પૂછાય છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'Volume Shadow Copies (VSS) શું છે, અને તે ડિસ્ક પર કેટલી જગ્યા રોકે છે?'",
  a: "જવાબ: VSS વોલ્યુમનો પોઇન્ટ-ઇન-ટાઇમ બ્લોક-લેવલ સ્નેપશોટ લે છે. તે આખી ફાઇલની નવી કૉપી બનાવતું નથી, પરંતુ માત્ર 'બદલાયેલા બ્લોક્સ' (Delta Changes) ને 'System Volume Information' માં સ્ટોર કરે છે. ડિફૉલ્ટ રૂપે તે વોલ્યુમની મહત્તમ 10% જગ્યા રોકે છે અને વપરાશકર્તાને 'Previous Versions' માંથી જાતે જ ફાઇલ રિસ્ટોર કરવાની સુવિધા આપે છે.",
  tip: "બેકઅપ અને ડેટા રિકવરીના ઇન્ટરવ્યુઝનો આ મુખ્ય પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'Access-Based Enumeration (ABE) શું છે, અને તે કર્મચારીઓ માટે શા માટે ઉપયોગી છે?'",
  a: "જવાબ: ABE એ એક ઉત્કૃષ્ટ વિન્ડોઝ ફીચર છે. તે સક્ષમ હોય ત્યારે વપરાશકર્તાને શેર્ડ ડ્રાઇવની અંદર માત્ર તે જ ફોલ્ડર્સ દેખાય છે જેના પર તેની પાસે ઓછામાં ઓછી 'Read' પરવાનગી હોય! જે ફોલ્ડર્સ પર તેની પાસે પરવાનગી નથી તે તેની સ્ક્રીન પરથી સંપૂર્ણપણે અદ્રશ્ય (Hide) થઈ જાય છે. આનાથી કર્મચારીઓમાં બિનજરૂરી ઉત્સુકતા અને 'Access Denied' ના હેલ્પડેસ્ક કૉલ્સ 90% ઘટી જાય છે.",
  tip: "સિનિયર સિસ્ટમ એડમિનિસ્ટ્રેટર રાઉન્ડમાં ABE નો વ્યવહારુ ઉપયોગ ખાસ ચકાસવામાં આવે છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 10 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - અસરકારક પરવાનગી શેર અને NTFS નો 'મોસ્ટ રેસ્ટ્રિક્ટિવ' નિયમ પાળે છે; પરવાનગીઓ હંમેશાં NTFS ACLs દ્વારા જ આપો.
      - FSRM નો Hard Quota ડિસ્ક ભરાઈ જતી અટકાવે છે અને File Screening બિન-કોર્પોરેટ ફાઇલોને (MP3/MP4) બ્લોક કરે છે.
      - VSS Shadow Copies અને Access-Based Enumeration (ABE) એન્ટરપ્રાઇઝ ફાઇલ સર્વરની ઉપયોગિતા અને વપરાશકર્તા સંતોષમાં વધારો કરે છે.
    ]
  ]
)

#pagebreak()
