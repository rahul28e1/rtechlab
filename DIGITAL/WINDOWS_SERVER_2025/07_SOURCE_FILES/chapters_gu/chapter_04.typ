// =============================================================================
// CHAPTER 04: ACTIVE DIRECTORY DOMAIN SERVICES & DOMAIN CONTROLLER PROMOTION
// =============================================================================

[#metadata("ch4") <chapter-4>]

#chapter-header(
  chapter-num: "CHAPTER 04",
  category: "ભાગ 4 : કેન્દ્રીય ઓળખ અને ડિરેક્ટરી સર્વિસિસ (Identity & Directory Services)",
  title: "#hl-yellow[એક્ટિવ ડિરેક્ટરી] ડોમેન સર્વિસિસ (AD DS) અને #hl-yellow[ડોમેન કંટ્રોલર] પ્રમોશન",
  subtitle: "AD DS કોર આર્કિટેક્ચર · લોજિકલ (Forest, Domain, OU) અને ફિઝિકલ (Sites) સંરચના · Add Roles વિઝાર્ડ · રૂટ DC (corp.rtechlab.local) · #hl-orange[DSRM] પાસવર્ડ · 5 FSMO રોલ્સ"
)

=== 4.1 #hl-yellow[એક્ટિવ ડિરેક્ટરી] શું છે? (What is #hl-yellow[Active Directory Domain Services]?)
એક સામાન્ય વર્કગ્રુપ નેટવર્કમાં (Workgroup) દરેક કમ્પ્યુટરનો પોતાનો અલગ સ્થાનિક યુઝર ડેટાબેઝ હોય છે (SAM - Security Accounts Manager). જો કોઈ કંપનીમાં 500 કમ્પ્યુટર્સ હોય અને કોઈ નવો કર્મચારી જોડાય, તો એડમિનિસ્ટ્રેટરે તમામ 500 કમ્પ્યુટર્સ પર જઈને અલગ-અલગ યુઝર એકાઉન્ટ બનાવવું પડે!

#mark-yellow[એક્ટિવ ડિરેક્ટરી ડોમેન સર્વિસિસ (AD DS) એ માઇક્રોસોફ્ટની એક કેન્દ્રીયકૃત ડિરેક્ટરી સેવા (Centralized Directory Service) છે જે સમગ્ર સંસ્થાના તમામ યુઝર્સ, કમ્પ્યુટર્સ, ગ્રુપ્સ અને નેટવર્ક સંસાધનોની માહિતીને એક જ સુરક્ષિત ડેટાબેઝમાં સંગ્રહિત તેમજ સંચાલિત કરે છે.]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "ડિરેક્ટરી ઓબ્જેક્ટ્સ (Objects) અને સ્કીમા")[
      AD ની અંદર દરેક પ્રવેગ/નોંધણીને #hl-yellow[ઓબ્જેક્ટ (Object)] કહેવામાં આવે છે (દા.ત. યુઝર, કમ્પ્યુટર, પ્રિન્ટર). દરેક ઓબ્જેક્ટના ગુણધર્મો હોય છે જેને #hl-green[એટ્રિબ્યુટ્સ (Attributes)] કહે છે (દા.ત. First Name, Email, Telephone). ડેટાબેઝના આ નિયમો અને સંરચનાને #hl-orange[સ્કીમા (Schema)] કહેવામાં આવે છે.
    ]
  ],
  [
    #info-box(title: "ગ્લોબલ કેટલોગ (Global Catalog - GC)")[
      ગ્લોબલ કેટલોગ એક વિશિષ્ટ #hl-yellow[ડોમેન કંટ્રોલર] છે જે સમગ્ર ફોરેસ્ટના તમામ ડોમેનના તમામ ઓબ્જેક્ટ્સના સૌથી આવશ્યક એટ્રિબ્યુટ્સ (આંશિક નકલ - Partial Replica) સંગ્રહિત કરે છે. આ મલ્ટી-ડોમેન નેટવર્કમાં ઝડપી સર્ચિંગ સક્ષમ બનાવે છે. #hl-green[પોર્ટ: 3268 (LDAP GC)].
    ]
  ]
)

#v(4pt)

=== 4.2 AD લોજિકલ આર્કિટેક્ચર: ફોરેસ્ટ, ટ્રી, ડોમેન અને OUs
#hl-yellow[એક્ટિવ ડિરેક્ટરી]ની લોજિકલ સંરચના એ નક્કી કરે છે કે નેટવર્ક સંસાધનોને વહીવટી રીતે કેવી રીતે ગોઠવવામાં આવે છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/ad_hierarchy_architecture.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 4.1: #hl-yellow[એક્ટિવ ડિરેક્ટરી] લોજિકલ વંશવેલો — ફોરેસ્ટ રૂટ, ચાઇલ્ડ ડોમેન, ટ્રી અને ઓર્ગેનાઇઝેશનલ યુનિટ્સ (OUs)]
]

#v(4pt)

1. #text(weight: "bold", fill: rtech-navy)[ફોરેસ્ટ (Forest):] #hl-yellow[એક્ટિવ ડિરેક્ટરી]ની સર્વોચ્ચ સુરક્ષા સીમા (Ultimate Security Boundary). એક ફોરેસ્ટ અંતર્ગત આવતા તમામ ડોમેન એક સમાન સ્કીમા, એક સામાન્ય ગ્લોબલ કેટલોગ અને એક સમાન કન્ફિગરેશન શેર કરે છે.
2. #text(weight: "bold", fill: rtech-navy)[ટ્રી (Tree):] એક અથવા એકથી વધુ ડોમેન્સનો વંશવેલો જે સતત DNS નેમસ્પેસ (Contiguous Namespace) શેર કરે છે (દા.ત. `rtechlab.local` અને `delhi.rtechlab.local`).
3. #text(weight: "bold", fill: rtech-navy)[ડોમેન (Domain):] સુરક્ષા અને વહીવટી નીતિઓની (Administrative Boundary) મુખ્ય એકમ. આપણી લેબનું ડોમેન #hl-yellow[`corp.rtechlab.local`] રહેશે.
4. #text(weight: "bold", fill: rtech-navy)[ઓર્ગેનાઇઝેશનલ યુનિટ (OU):] ડોમેનની અંદર બનાવવામાં આવતો વહીવટી કન્ટેનર (Container). આની અંદર યુઝર્સ અને કમ્પ્યુટર્સને વિભાગ અનુસાર રાખવામાં આવે છે જેથી તેમના પર ગ્રુપ પોલિસી (GPO) લાગુ કરી શકાય.

#v(6pt)

=== 4.3 AD ફિઝિકલ આર્કિટેક્ચર: #hl-yellow[ડોમેન કંટ્રોલર]્સ, સાઇટ્સ અને સબનેટ્સ
લોજિકલ સંરચના એ નક્કી કરે છે કે ઓબ્જેક્ટ્સને *કેવી રીતે જોવામાં આવે*, જ્યારે ફિઝિકલ સંરચના એ નક્કી કરે છે કે ડિરેક્ટરીનો ડેટા *નેટવર્ક વાયરો અને હાર્ડવેર પર કેવી રીતે રેપ્લિકેટ (Replicate) થાય*:

- #text(weight: "bold", fill: rtech-blue)[ડોમેન કંટ્રોલર (Domain Controller / DC):] તે ફિઝિકલ અથવા વર્ચ્યુઅલ સર્વર જેના પર AD DS રોલ ઇન્સ્ટોલ હોય છે અને જે #hl-yellow[એક્ટિવ ડિરેક્ટરી]ના મુખ્ય ડેટાબેઝની (#hl-yellow[`ntds.dit`]) સંપૂર્ણ નકલ રાખે છે.
- #text(weight: "bold", fill: rtech-navy)[એક્ટિવ ડિરેક્ટરી સાઇટ્સ (Sites):] એક અથવા વધુ સુવ્યવસ્થિત, હાઇ-સ્પીડ TCP/IP સબનેટ્સનો સમૂહ (જેમ કે 'Mumbai-HO Site' અને 'Bangalore-Branch Site'). સાઇટ્સનો ઉપયોગ WAN લિંક પર બિનજરૂરી રેપ્લિકેશન ટ્રાફિકને નિયંત્રિત કરવા અને ક્લાયન્ટને સૌથી નજીકના DC થી ઓથેન્ટિકેટ કરાવવા માટે થાય છે.

#v(6pt)

=== 4.4 પ્રેક્ટિકલ લેબ: Add Roles and Features વિઝાર્ડ દ્વારા AD DS રોલ ઇન્સ્ટોલેશન
હવે આપણે આપણી વર્ચ્યુઅલ મશીન `SRV-2025-DC01` પર એક્ટિવ ડિરેક્ટરી રોલ સ્થાપિત કરીશું:

1. #hl-yellow[Server Manager] ખોલો અને ઉપર જમણી બાજુ આપેલ #hl-green['Manage'] મેનૂ પર ક્લિક કરીને #hl-yellow['Add Roles and Features'] પસંદ કરો.
2. 'Before You Begin' સ્ક્રીન પર 'Next' દબાવો.
3. Installation Type માં #hl-yellow['Role-based or feature-based installation'] પસંદ કરીને 'Next' દબાવો.
4. Server Selection માં ખાતરી કરો કે પૂલમાં તમારી મશીન #hl-green[`SRV-2025-DC01 (192.168.1.10)`] પસંદ કરેલ છે. 'Next' દબાવો.
5. Server Roles ની યાદીમાં #mark-yellow[Active Directory Domain Services] ચેકબોક્સ પર ટિક કરો.
6. એક પોપ-અપ વિંડો ખુલશે: 'Add Features that are required for #hl-yellow[Active Directory Domain Services]' (RSAT ટૂલ્સ સામેલ). #hl-green['Add Features'] પર ક્લિક કરો અને 'Next' દબાવો.
7. Features સ્ક્રીન પર ડિફોલ્ટ પસંદગી રહેવા દો અને 'Next' દબાવો.
8. Confirmation સ્ક્રીન પર 'Restart the destination server automatically if required' ને અનચેક રહેવા દો અને #hl-green['Install'] પર ક્લિક કરો.
9. 2 થી 3 મિનિટમાં રોલ ઇન્સ્ટોલેશન પૂર્ણ થશે. 'Close' પર ક્લિક કરો.

#v(6pt)

=== 4.5 પ્રેક્ટિકલ લેબ: સર્વરને રૂટ #hl-yellow[ડોમેન કંટ્રોલર] પ્રમોટ કરવું (DC Promotion)
રોલ ઇન્સ્ટોલ થયા પછી સર્વર આપમેળે DC બનતું નથી. તેને પ્રમોટ કરવું પડે છે:

1. #hl-yellow[Server Manager] ની ટોચ પર આપેલ પીળા રંગના ચેતવણી ધ્વજ (#text(weight: "bold", fill: rtech-amber)[⚠️ Notification Flag]) પર ક્લિક કરો.
2. વાદળી રંગની લિંક પર ક્લિક કરો: #mark-green[Promote this server to a domain controller].
3. #text(weight: "bold")[Deployment Configuration:] આપણે પહેલી વાર નવું ડોમેન બનાવી રહ્યા છીએ, તેથી ત્રીજો વિકલ્પ પસંદ કરો: #hl-yellow['Add a new forest'].
   - Root domain name માં લખો: #hl-green[`corp.rtechlab.local`]. 'Next' દબાવો.
4. #text(weight: "bold")[Domain Controller Options:]
   - Forest & Domain functional level: #hl-green[Windows Server 2025] (નવીનતમ સુરક્ષા સુવિધાઓ માટે).
   - 'Domain Name System (DNS) server' અને 'Global Catalog (GC)' ને ચેક રહેવા દો.
   - #text(weight: "bold", fill: rtech-navy)[Directory Services Restore Mode (#hl-orange[DSRM]) Password:] આ આપત્તિ સમયે AD ડેટાબેઝ રિસ્ટોર કરવા માટેનો માસ્ટર રિકવરી પાસવર્ડ છે. એક મજબૂત પાસવર્ડ દાખલ કરો (દા.ત. #hl-green[`Dsrm@2025!`]). 'Next' દબાવો.
5. #text(weight: "bold")[DNS Options:] 'A delegation for this DNS server cannot be created...' ની સામાન્ય પીળી ચેતવણી આવશે, તેને અવગણીને સીધા જ 'Next' દબાવો.
6. #text(weight: "bold")[Additional Options:] વિઝાર્ડ આપમેળે NetBIOS નામ જનરેટ કરશે: #hl-yellow[`CORP`]. 'Next' દબાવો.
7. #text(weight: "bold")[Paths:] ડેટાબેઝ, લોગ અને SYSVOL ના ડિફોલ્ટ પાથ રહેવા દો (`C:\Windows\NTDS` અને `C:\Windows\SYSVOL`). 'Next' દબાવો.
8. #text(weight: "bold")[Prerequisites Check:] સિસ્ટમ તમામ પૂર્વ-આવશ્યકતાઓની ચકાસણી કરશે. ટોચ પર લીલો ટિક દેખાશે: #hl-green['All prerequisite checks passed successfully'].
9. નીચે આપેલ #mark-green[Install] બટન પર ક્લિક કરો!
10. સર્વર AD DS કન્ફિગર કરશે અને આપમેળે રીબૂટ થશે. રીબૂટ પછી લોગિન સ્ક્રીન પર તમને દેખાશે: #hl-yellow[`CORP\Administrator`]. અભિનંદન, તમારું #hl-yellow[ડોમેન કંટ્રોલર] હવે લાઈવ છે!

#v(6pt)

=== 4.6 FSMO ના 5 વિશિષ્ટ રોલ્સની કાર્યપ્રણાલી (5 FSMO Master Roles)
જો કે એક્ટિવ ડિરેક્ટરી મલ્ટી-માસ્ટર રેપ્લિકેશન મોડેલ પર કાર્ય કરે છે (જ્યાં કોઈપણ DC પર યુઝર બનાવી શકાય છે), પરંતુ ડેટા ટકરાવ (Conflicts) રોકવા માટે 5 એવા મહત્વપૂર્ણ કાર્યો છે જે એક સમયે સમગ્ર નેટવર્કમાં માત્ર *એક જ વિશિષ્ટ #hl-yellow[ડોમેન કંટ્રોલર]* દ્વારા કરી શકાય છે. આમને #hl-yellow[FSMO (Flexible Single Master Operations)] રોલ્સ કહેવામાં આવે છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/fsmo_roles_architecture.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 4.2: FSMO 5 રોલ્સનો વંશવેલો — 2 ફોરેસ્ટ-વાઇડ રોલ્સ અને 3 ડોમેન-વાઇડ રોલ્સની કાર્યપ્રણાલી]
]

#v(4pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: white,
  radius: 4pt,
  inset: 6pt,
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-navy)[FSMO રોલ્સનું સંપૂર્ણ વિવરણ (MNC Interview Goldmine):]\
    - #text(weight: "bold", fill: rtech-blue)[ફોરેસ્ટ-વાઇડ રોલ્સ (સમગ્ર ફોરેસ્ટમાં માત્ર 1 DC પર):]
      1. #text(weight: "bold")[Schema Master:] સમગ્ર ફોરેસ્ટમાં AD ના સ્કીમા (ક્લાસ અને એટ્રિબ્યુટ્સ) માં થતા ફેરફારોને નિયંત્રિત કરે છે (જેમ કે Exchange સર્વર ઇન્સ્ટોલ કરતી વખતે).
      2. #text(weight: "bold")[Domain Naming Master:] ફોરેસ્ટમાં નવા ડોમેનને જોડવા અથવા જૂના ડોમેનને હટાવવાનો વિશેષ અધિકાર ધરાવે છે.
    - #text(weight: "bold", fill: rtech-emerald)[ડોમેન-વાઇડ રોલ્સ (ફોરેસ્ટના દરેક ડોમેનમાં 1-1 DC પર):]
      3. #text(weight: "bold")[PDC Emulator (સર્વોચ્ચ મહત્વપૂર્ણ રોલ):] #hl-orange[Kerberos] પાસવર્ડ ફેરફારોનું તાત્કાલિક પ્રોસેસિંગ, ટાઇમ સિન્ક્રોનાઇઝેશન (NTP Master), ગ્રુપ પોલિસી એડિટિંગ અને એકાઉન્ટ લોકઆઉટ સંભાળે છે.
      4. #text(weight: "bold")[RID Master (Relative ID Master):] જ્યારે પણ નવો યુઝર કે ગ્રુપ બને છે, તેને એક યુનિક SID મળે છે. RID Master દરેક DC ને 500 RIDs નો એક પૂલ ફાળવે છે જેથી SIDs ડુપ્લિકેટ ન થાય.
      5. #text(weight: "bold")[Infrastructure Master:] મલ્ટી-ડોમેન એન્વાયર્નમેન્ટમાં અન્ય ડોમેનના ગ્રુપ્સમાં સામેલ યુઝર્સના ક્રોસ-ડોમેન રેફરન્સ (GUID અને SID મેપિંગ) અપડેટ રાખે છે.
  ]
)

#v(4pt)
#pro-tip(title: "FSMO રોલ્સ તપાસવા માટેનો 1-સેકન્ડ કમાન્ડ")[
  કમાન્ડ પ્રોમ્પ્ટમાં ચલાવો: #hl-green[`netdom query fsmo`] — આ તરત જ બતાવી દેશે કે તમારા 5 રોલ્સ કયા સર્વર પર સ્થિત છે!
]

#v(6pt)

=== 4.7 AD ડેટાબેઝની આંતરિક ફાઇલો અને હેલ્થ વેરિફિકેશન
- #text(weight: "bold", fill: rtech-navy)[`ntds.dit` (New Technology Directory Services Database):] આ એક્ટિવ ડિરેક્ટરીની મુખ્ય ડેટાબેઝ ફાઇલ છે જે `C:\Windows\NTDS\` માં સ્થિત હોય છે. તે ESE (Extensible Storage Engine - Jet Blue) પર આધારિત હોય છે. Server 2025 માં તેનો પેજ સાઇઝ 32 KB છે.
- #text(weight: "bold", fill: rtech-navy)[`SYSVOL` ફોલ્ડર:] આ `C:\Windows\SYSVOL\` માં સ્થિત હોય છે. તે નેટવર્ક પર શેયર્ડ હોય છે અને તમામ ડોમેન કંટ્રોલર્સ વચ્ચે DFSR (Distributed File System Replication) દ્વારા સિંક થાય છે. આમાં જ તમામ ગ્રુપ પોલિસી ફાઇલો અને લોગિન સ્ક્રિપ્ટ્સ હોય છે.
- #text(weight: "bold", fill: rtech-navy)[હેલ્થ ચેક કમાન્ડ:] એડમિન કમાન્ડ પ્રોમ્પ્ટમાં #hl-green[`dcdiag /v`] ચલાવો. આ 30 થી વધુ આંતરિક પરીક્ષણો (Connectivity, Advertising, Replications, FrsSysvol) ચલાવીને પુષ્ટિ કરે છે કે તમારું DC 100% સ્વસ્થ છે.

#v(8pt)

// =============================================================================
// CHAPTER 04 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  શરૂઆતી વિન્ડોઝ NT 4.0 ના સમયગાળામાં ડિરેક્ટરી ડેટાબેઝ માત્ર એક ફ્લેટ ફાઇલ (SAM) રહેતી હતી જે મહત્તમ 40,000 ઓબ્જેક્ટ્સ જ સંભાળી શકતી હતી. વર્ષ 2000 માં એક્ટિવ ડિરેક્ટરી આવ્યા પછી માઇક્રોસોફ્ટે Microsoft Exchange માંથી જેટ બ્લૂ (Jet Blue ESE) ડેટાબેઝ એન્જિન અપનાવ્યું. આજે Windows Server 2025 માં એક જ એક્ટિવ ડિરેક્ટરી ડેટાબેઝ #hl-yellow[2 અબજ (2 Billion) થી વધુ ઓબ્જેક્ટ્સ] ને કોઈપણ પરફોર્મન્સ ડિગ્રેડેશન વિના પ્રોસેસ કરી શકે છે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 04 પ્રેક્ટિસ બહુવિકલ્પીય પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "એક્ટિવ ડિરેક્ટરીના 5 FSMO રોલ્સમાંથી કયા બે રોલ્સ સમગ્ર ફોરેસ્ટ (Forest-Wide) સ્તરે અદ્વિતીય હોય છે?",
  optA: "PDC Emulator અને RID Master",
  optB: "Schema Master અને Domain Naming Master",
  optC: "Infrastructure Master અને PDC Emulator",
  optD: "RID Master અને Infrastructure Master",
  ans: "B",
  exp: "Schema Master અને Domain Naming Master સમગ્ર ફોરેસ્ટમાં માત્ર 1-1 હોય છે; બાકીના ત્રણ રોલ્સ પ્રતિ ડોમેન 1-1 હોય છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "એક્ટિવ ડિરેક્ટરીની મુખ્ય ડેટાબેઝ ફાઇલનું વાસ્તવિક નામ અને એક્સટેન્શન શું હોય છે?",
  optA: "activedirectory.mdf",
  optB: "ntds.dit",
  optC: "sam.dat",
  optD: "ad_database.db",
  ans: "B",
  exp: "એક્ટિવ ડિરેક્ટરીની ડેટાબેઝ ફાઇલનું નામ ntds.dit (Directory Information Tree) હોય છે."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "ડોમેનમાં કોઈ યુઝરના પાસવર્ડ ફેરફારનું તાત્કાલિક પ્રોસેસિંગ, ટાઇમ સિન્ક્રોનાઇઝેશન અને એકાઉન્ટ લોકઆઉટ કયા FSMO રોલ દ્વારા સંભાળવામાં આવે છે?",
  optA: "Schema Master",
  optB: "Domain Naming Master",
  optC: "PDC Emulator",
  optD: "Infrastructure Master",
  ans: "C",
  exp: "PDC Emulator ડોમેનનો સૌથી વ્યસ્ત FSMO રોલ છે જે પાસવર્ડ ઓથેન્ટિકેશન, ટાઇમ અને GPO એડિટિંગને નિયંત્રિત કરે છે."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "એક્ટિવ ડિરેક્ટરીમાં તમામ 5 FSMO રોલ્સ કયા ડોમેન કંટ્રોલર પાસે છે, તે ચકાસવા માટે કયા સત્તાવાર કમાન્ડનો ઉપયોગ થાય છે?",
  optA: "ipconfig /all",
  optB: "netdom query fsmo",
  optC: "gpresult /v",
  optD: "dcdiag /test:dns",
  ans: "B",
  exp: "netdom query fsmo કમાન્ડ પાંચેય FSMO રોલ ધારકોના નામ એક સેકન્ડમાં પ્રદર્શિત કરી દે છે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "ગ્લોબલ કેટલોગ (Global Catalog - GC) સર્વર મલ્ટી-ડોમેન ક્વેરી સાંભળવા માટે કયા વિશિષ્ટ પોર્ટ નંબરનો ઉપયોગ કરે છે?",
  optA: "પોર્ટ 80 (HTTP)",
  optB: "પોર્ટ 389 (LDAP)",
  optC: "પોર્ટ 3268 (LDAP GC)",
  optD: "પોર્ટ 445 (SMB)",
  ans: "C",
  exp: "સામાન્ય LDAP પોર્ટ 389 પર ચાલે છે, જ્યારે Global Catalog ક્વેરીઝ પોર્ટ 3268 (અથવા SSL માં 3269) પર સાંભળવામાં આવે છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'જો PDC Emulator રોલ ધારક સર્વર અચાનક ક્રેશ થઈ જાય, તો ડોમેન પર શું અસર પડશે?'",
  a: "જવાબ: PDC Emulator ડાઉન થવા પર ડોમેન તરત જ બંધ નથી થતું, પરંતુ ઘણી સમસ્યાઓ શરૂ થઈ જાય છે: 1. યુઝર દ્વારા પાસવર્ડ બદલવા પર તરત રેપ્લિકેશન થશે નહીં અને જૂના પાસવર્ડથી થોડા સમય માટે લોગિન થઈ શકે છે, 2. ખોટા પાસવર્ડ પર એકાઉન્ટ લોકઆઉટ પ્રોસેસ થશે નહીં, 3. સમગ્ર ડોમેનના મશીનોમાં ટાઇમ ડ્રિફ્ટ (Clock Skew) આવવા લાગશે, અને 4. GPMC માં ગ્રુપ પોલિસી એડિટ કરતી વખતે ડિફોલ્ટ DC મળશે નહીં. આને તાત્કાલિક અન્ય કોઈ DC પર સીઝ (Seize) કરવું જરૂરી બને છે.",
  tip: "HCL, Infosys અને Tech Mahindra ના L2 ડિરેક્ટરી સર્વિસિસ ઇન્ટરવ્યુનો આ સૌથી મહત્વપૂર્ણ સવાલ છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'FSMO રોલ્સમાં Transfer અને Seize વચ્ચે શું તફાવત હોય છે?'",
  a: "જવાબ: 'Transfer' ત્યારે કરવામાં આવે છે જ્યારે જૂનો DC ઓનલાઇન અને સ્વસ્થ હોય; આમાં ગ્રેસફુલી બંને સર્વર્સ પરસ્પર સંવાદ કરીને રોલ સોંપે છે. 'Seize' ત્યારે કરવામાં આવે છે જ્યારે જૂનો DC હાર્ડવેર ફેલિયર અથવા ક્રેશના કારણે હંમેશા માટે નષ્ટ થઈ ગયો હોય અને ક્યારેય ઓનલાઇન ન આવી શકે. Seize કર્યા પછી જૂના DC ને ક્યારેય તે જ નામથી નેટવર્ક પર ફરી ચાલુ ન કરવો જોઈએ.",
  tip: "ડિઝાસ્ટર રિકવરી અને FSMO રોલ માઇગ્રેશનમાં આ મૂળભૂત તફાવત પૂછવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: '#hl-orange[DSRM] (#hl-orange[Directory Services Restore Mode]) પાસવર્ડ શું છે, અને તે સામાન્ય ડોમેન એડમિન પાસવર્ડથી કેવી રીતે અલગ છે?'",
  a: "જવાબ: ડોમેન એડમિનનો પાસવર્ડ એક્ટિવ ડિરેક્ટરી ડેટાબેઝ (ntds.dit) ની અંદર સ્ટોર થાય છે. જો AD ડેટાબેઝ કરપ્ટ થઈ જાય અથવા સર્વર Safe Mode (#hl-orange[DSRM]) માં બૂટ થાય જ્યાં AD સર્વિસિસ બંધ હોય છે, તો ડોમેન એડમિન લોગિન કામ કરશે નહીં. આવી કટોકટીમાં સર્વરના લોકલ SAM ડેટાબેઝમાં માત્ર #hl-orange[DSRM] પાસવર્ડ જ કામ કરે છે જેના દ્વારા ડેટાબેઝ રિસ્ટોર કરવામાં આવે છે.",
  tip: "આ ઉત્તર સાબિત કરે છે કે તમે માત્ર ટૂલ્સ નથી ચલાવતા, પરંતુ ઇન્ટરનલ રિકવરી આર્કિટેક્ચરને સમજો છો."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'RID Master ની શું ભૂમિકા છે, અને RID Exhaustion શું હોય છે?'",
  a: "જવાબ: જ્યારે પણ કોઈ યુઝર, ગ્રુપ કે કમ્પ્યુટર બને છે, તેને એક SID મળે છે (Domain SID + RID). RID Master દરેક DC ને 500 RIDs નો પૂલ આપે છે. 30-બીટ આર્કિટેક્ચરમાં એક ડોમેનમાં આશરે 1 અબજ RIDs ઉપલબ્ધ હોય છે. જો કોઈ ઓટોમેટેડ સ્ક્રિપ્ટ લાખો એકાઉન્ટ્સ બનાવીને ડિલીટ કરતી રહે, તો RIDs સમાપ્ત થઈ શકે છે; Windows Server 2025 માં 31-બીટ RID સ્પેસ અને વોર્નિંગ ઇવેન્ટ્સ આપીને તેને સુરક્ષિત બનાવવામાં આવ્યું છે.",
  tip: "Cognizant અને TCS ના સિનિયર L2 સપોર્ટ રાઉન્ડનો આ લોકપ્રિય પ્રશ્ન છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'SYSVOL ફોલ્ડરનું શું કામ છે અને તે ડોમેન કંટ્રોલર્સ વચ્ચે કયા પ્રોટોકોલથી સિંક થાય છે?'",
  a: "જવાબ: SYSVOL ફોલ્ડર ડોમેનના તમામ ક્લાયન્ટ્સ માટે શેયર્ડ ડિરેક્ટરી છે જેમાં તમામ ગ્રુપ પોલિસી ઓબ્જેક્ટ્સ (GPT - Templates) અને લોગિન/લોગઓફ સ્ક્રિપ્ટ્સ સ્ટોર હોય છે. આધુનિક વિન્ડોઝ સર્વરમાં તે સર્વર્સ વચ્ચે DFSR (Distributed File System Replication) દ્વારા સિંક થાય છે (જૂના Server 2003 માં વપરાતું FRS હવે બંધ કરી દેવામાં આવ્યું છે).",
  tip: "GPO રેપ્લિકેશન અને ઇન્ફ્રાસ્ટ્રક્ચર સપોર્ટમાં DFSR નું જ્ઞાન અનિવાર્ય માનવામાં આવે છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 04 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - AD DS કોઈપણ એન્ટરપ્રાઇઝની કેન્દ્રીય ઓળખ અને સુરક્ષાની કરોડરજ્જુ છે (ડેટાબેઝ: `ntds.dit`, શેર: `SYSVOL`).
      - FSMO ના 5 રોલ્સમાંથી PDC Emulator દૈનિક કામગીરી (પાસવર્ડ, ટાઇમ, GPO) માટે સૌથી મહત્વપૂર્ણ છે.
      - `netdom query fsmo` અને `dcdiag /v` દરેક સિસ્ટમ એડમિનિસ્ટ્રેટરના મુખ્ય દૈનિક ડાયગ્નોસ્ટિક કમાન્ડ્સ છે.
    ]
  ]
)

#pagebreak()
