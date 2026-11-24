// =============================================================================
// CHAPTER 05: ADUC CONSOLE: OUS, DOMAIN USERS & GROUP MANAGEMENT
// =============================================================================

[#metadata("ch5") <chapter-5>]

#chapter-header(
  chapter-num: "CHAPTER 05",
  category: "ભાગ 5 : ડિરેક્ટરી ઓબ્જેક્ટ્સ અને એક્સેસ કંટ્રોલ (Directory Objects & RBAC)",
  title: "ADUC કન્સોલ: OUs, ડોમેન યુઝર્સ અને સિક્યુરિટી ગ્રુપ્સનું મેનેજમેન્ટ",
  subtitle: "ADUC (dsa.msc) · એન્ટરપ્રાઇઝ OU વંશવેલો · નવા ડોમેન યુઝર એકાઉન્ટ્સ · પાસવર્ડ અને લોકઆઉટ નીતિઓ · સિક્યુરિટી vs ડિસ્ટ્રિબ્યુશન ગ્રુપ્સ · AGDLP · PowerShell બલ્ક"
)

=== 5.1 Active Directory Users and Computers (`dsa.msc`) ઇન્ટરફેસ
ડોમેન કંટ્રોલર પ્રમોટ થયા પછી, એક્ટિવ ડિરેક્ટરીના તમામ ઓબ્જેક્ટ્સ (Users, Computers, Groups, OUs) ને સંચાલિત કરવા માટેનું પ્રાથમિક ગ્રાફિકલ એડમિનિસ્ટ્રેટિવ ટૂલ #hl-yellow[Active Directory Users and Computers (ADUC)] છે.

*ADUC કન્સોલ ખોલવાની 2 ઝડપી રીતો:*
1. Server Manager માં -> ઉપર જમણી બાજુએ #hl-green[Tools] મેનૂ -> #hl-yellow[Active Directory Users and Computers] પર ક્લિક કરો.
2. રન ડાયલોગ (`Win + R`) માં શોર્ટકટ કમાન્ડ ટાઇપ કરો: #mark-green[`dsa.msc`] અને Enter દબાવો.

કન્સોલની ડાબી બાજુએ તમારું ડોમેન `#text(weight: "bold")[corp.rtechlab.local]` દેખાશે. તેની નીચે કેટલાક ડિફોલ્ટ કન્ટેનર્સ પહેલેથી બનેલા હોય છે:
- #text(weight: "bold", fill: rtech-navy)[Builtin:] સિસ્ટમના ડિફોલ્ટ સુરક્ષા ગ્રુપ્સ (Administrators, Account Operators, Backup Operators વગેરે).
- #text(weight: "bold", fill: rtech-navy)[Computers:] જ્યારે કોઈ સામાન્ય ક્લાયન્ટ કમ્પ્યુટર ડોમેન જોઈન કરે છે, ત્યારે તેનું ખાતું ડિફોલ્ટ રીતે આ જ ફોલ્ડરમાં બને છે.
- #text(weight: "bold", fill: rtech-navy)[Domain Controllers:] આ ડોમેનના તમામ અધિકૃત ડોમેન કંટ્રોલર સર્વર્સનું સમર્પિત OU.
- #text(weight: "bold", fill: rtech-navy)[Users:] ડિફોલ્ટ ડોમેન યુઝર્સ અને ગ્રુપ્સ (દા.ત. Administrator, Guest, Domain Admins, Domain Users).

#warning-box(title: "ડિફોલ્ટ કન્ટેનર vs ઓર્ગેનાઇઝેશનલ યુનિટ (Critical Architectural Difference)")[
  'Computers' અને 'Users' સામાન્ય કન્ટેનર (Generic Containers) છે, તે OU નથી! #hl-orange[ડિફોલ્ટ કન્ટેનર્સ પર ક્યારેય ગ્રુપ પોલિસી ઓબ્જેક્ટ (GPO) સીધું લિંક કરી શકાતું નથી.] તેથી એન્ટરપ્રાઇઝ પ્રોડક્શનમાં કર્મચારીઓ કે કમ્પ્યુટર્સને ક્યારેય ડિફોલ્ટ ફોલ્ડરમાં રાખવામાં આવતા નથી; હંમેશા કસ્ટમ OUs બનાવવામાં આવે છે.
]

#v(4pt)

=== 5.2 એન્ટરપ્રાઇઝ OU વંશવેલો ડિઝાઇન (Enterprise OU Hierarchy Design)
એક સુવ્યવસ્થિત OU માળખું કોર્પોરેટ પ્રશાસન, ડેલિગેશન અને સુરક્ષા નીતિઓના અમલીકરણને સરળ બનાવે છે:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/ou_hierarchy_agdlp.png", width: 92%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[આકૃતિ 5.1: એન્ટરપ્રાઇઝ OU માળખું અને AGDLP રોલ-બેઝ્ડ એક્સેસ કંટ્રોલ (RBAC) નેસ્ટિંગ ફ્રેમવર્ક]
]

#v(4pt)

*કસ્ટમ OU બનાવવાની સ્ટેપ-બાય-સ્ટેપ રીત:*
1. ADUC માં ડોમેન નામ `#text(weight: "bold")[corp.rtechlab.local]` પર રાઇટ-ક્લિક કરો -> #hl-yellow[New -> Organizational Unit].
2. Name માં ટાઇપ કરો: #hl-green[`RTechLab-Enterprise`].
3. #mark-orange['Protect container from accidental deletion'] ચેકબોક્સને હંમેશા ચેક કરેલું જ રાખો. આ સુરક્ષા કોઈપણ એડમિન દ્વારા ભૂલથી OU ડિલીટ થવાથી બચાવે છે. 'OK' પર ક્લિક કરો.
4. હવે `RTechLab-Enterprise` પર રાઇટ-ક્લિક કરીને સબ-OUs બનાવો:
   - #hl-yellow[`Corporate-Departments`] (તેની અંદર `HR`, `Finance`, `IT-Admins`, અને `Sales` સબ-OUs)
   - #hl-yellow[`Workstations`] (કર્મચારીઓના Windows 10/11 લેપટોપ અને ડેસ્કટોપ માટે)
   - #hl-yellow[`Servers`] (મેમ્બર સર્વર્સ જેવા કે File Server, Web Server માટે)

#v(6pt)

=== 5.3 નવું ડોમેન યુઝર એકાઉન્ટ બનાવવું (Creating Domain User Accounts)
હવે આપણે HR વિભાગ માટે એક નવું ડોમેન યુઝર એકાઉન્ટ બનાવીશું:

1. `Corporate-Departments -> HR` OU પર રાઇટ-ક્લિક કરો -> #hl-yellow[New -> User].
2. #text(weight: "bold")[First name:] `Rahul`, #text(weight: "bold")[Last name:] `Patel`.
3. #text(weight: "bold")[User logon name (UPN):] #hl-green[`rpatel`]\@corp.rtechlab.local.
4. #text(weight: "bold")[User logon name (pre-Windows 2000):] `CORP\rpatel` (આપોઆપ ભરાઈ જશે). 'Next' દબાવો.
5. #text(weight: "bold")[પાસવર્ડ સેટિંગ્સ અને 4 મહત્વપૂર્ણ ચેકબોક્સ:]
   - #text(weight: "bold", fill: rtech-blue)[✓ User must change password at next logon:] (કોર્પોરેટ બેસ્ટ પ્રેક્ટિસ — જ્યારે કર્મચારી પ્રથમ વખત લોગિન કરશે, ત્યારે સિસ્ટમ તેને પોતાનો અંગત પાસવર્ડ સેટ કરવાની ફરજ પાડશે).
   - #text(weight: "bold", fill: rtech-muted)[User cannot change password:] (શેર્ડ અથવા કિયોસ્ક કમ્પ્યુટર એકાઉન્ટ્સ માટે).
   - #text(weight: "bold", fill: rtech-rose)[Password never expires:] (માત્ર સર્વિસ એકાઉન્ટ્સ માટે; સામાન્ય યુઝર્સ પર આ સેટ કરવું ગંભીર સુરક્ષા ઉલ્લંઘન ગણાય છે).
   - #text(weight: "bold", fill: rtech-amber)[Account is disabled:] (કર્મચારીના નોટિસ પીરિયડ અથવા લાંબી રજા દરમિયાન એકાઉન્ટ કામચલાઉ બંધ કરવા માટે).
6. પ્રારંભિક જટિલ પાસવર્ડ દાખલ કરો (દા.ત. #hl-green[`Welcome@2025#`]) અને 'Next' -> 'Finish' કરો.

#v(6pt)

=== 5.4 એકાઉન્ટ લોકઆઉટ અને ફાઇન-ગ્રેઇન્ડ પાસવર્ડ પોલિસી (Account Lockout & FGPP)
બ્રુટ-ફોર્સ પાસવર્ડ ગેસિંગ એટેક્સ અટકાવવા માટે એક્ટિવ ડિરેક્ટરીમાં ઓટોમેટેડ એકાઉન્ટ લોકઆઉટ સુરક્ષા વ્યવસ્થા હોય છે:
- જો કોઈ કર્મચારી કે અનધિકૃત વ્યક્તિ સતત 5 વખત ખોટો પાસવર્ડ દાખલ કરે (Account lockout threshold), તો તેનું એકાઉન્ટ 30 મિનિટ માટે આપોઆપ લોક થઈ જાય છે.
- *એકાઉન્ટ અનલોક કરવાની રીત:* ADUC માં યુઝર પર રાઇટ-ક્લિક કરો -> #hl-yellow[Properties -> Account] ટેબ પર જાઓ. નીચે આપેલા ચેકબોક્સ #hl-green['Unlock account. This account is currently locked out on this Active Directory Domain Controller'] પર ટીક લગાવો અને 'Apply' કરો.

#v(6pt)

=== 5.5 સિક્યુરિટી ગ્રુપ્સ vs ડિસ્ટ્રિબ્યુશન ગ્રુપ્સ (Group Types)
એક્ટિવ ડિરેક્ટરીમાં બે અલગ પ્રકારના ગ્રુપ્સ હોય છે:
1. #text(weight: "bold", fill: rtech-navy)[સિક્યુરિટી ગ્રુપ્સ (Security Groups):] આ ગ્રુપ્સનો પ્રાથમિક હેતુ નેટવર્ક રિસોર્સિસ (શેર્ડ ફોલ્ડર્સ, પ્રિન્ટર્સ, શેરપોઇન્ટ) પર પરવાનગીઓ (Permissions) આપવાનો હોય છે. તેનો ઉપયોગ ઇમેઇલ ડિલિવરી માટે પણ થઈ શકે છે.
2. #text(weight: "bold", fill: rtech-navy)[ડિસ્ટ્રિબ્યુશન ગ્રુપ્સ (Distribution Groups):] આ ગ્રુપ્સ માત્ર ઇમેઇલ લિસ્ટ્સ (Distribution Lists - Exchange Server/Outlook) બનાવવા માટે વપરાય છે. #hl-orange[ડિસ્ટ્રિબ્યુશન ગ્રુપ્સને ક્યારેય કોઈ ફાઇલ કે ફોલ્ડરની NTFS સુરક્ષા પરવાનગી આપી શકાતી નથી!]

#v(6pt)

=== 5.6 ગ્રુપ સ્કોપ્સ અને AGDLP બેસ્ટ પ્રેક્ટિસ (The AGDLP Standard)
માઇક્રોસોફ્ટ એન્ટરપ્રાઇઝમાં રોલ્સ અને પરમિશન્સ મેનેજ કરવા માટે #hl-yellow[AGDLP મોડેલ] નો ઉપયોગ કરવાની ભલામણ કરે છે:

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[AGDLP ફોર્મ્યુલા (MNC ઇન્ટરવ્યુમાં 100% પૂછાતો મુખ્ય સિદ્ધાંત):]\
    - #text(weight: "bold", fill: rtech-blue)[A (Accounts):] યુઝર એકાઉન્ટ્સ (દા.ત. `rpatel`, `ajain`).
    - #text(weight: "bold", fill: rtech-blue)[G (Global Groups):] યુઝર્સને તેમના વિભાગ કે જોબ રોલ અનુસાર ગ્લોબલ ગ્રુપમાં ઉમેરો (દા.ત. `GG_HR_Staff`).
    - #text(weight: "bold", fill: rtech-amber)[DL (Domain Local Groups):] રિસોર્સની જરૂરિયાત મુજબ ડોમેન લોકલ ગ્રુપ બનાવો અને ગ્લોબલ ગ્રુપને તેમાં નેસ્ટ કરો (દા.ત. `DL_HR_Payroll_Read`).
    - #text(weight: "bold", fill: rtech-emerald)[P (Permissions):] રિસોર્સ (Shared Folder) પર માત્ર Domain Local ગ્રુપને જ NTFS/Share પરમિશન્સ ફાળવો!
  ]
)

#v(6pt)

=== 5.7 PowerShell દ્વારા બલ્ક યુઝર ક્રિએશન (Automated Bulk User Onboarding)
જ્યારે 200 નવા કર્મચારીઓ એક સાથે કંપનીમાં જોડાય છે, ત્યારે ADUC કન્સોલમાં એક પછી એક યુઝર બનાવવું અશક્ય બની જાય છે. એન્ટરપ્રાઇઝ એડમિનિસ્ટ્રેટર્સ PowerShell નો ઉપયોગ કરે છે:

```powershell
# Single User Provisioning:
New-ADUser -Name "Rahul Patel" -GivenName "Rahul" -Surname "Patel" `
  -SamAccountName "rpatel" -UserPrincipalName "rpatel@corp.rtechlab.local" `
  -Path "OU=HR,OU=Corporate-Departments,OU=RTechLab-Enterprise,DC=corp,DC=rtechlab,DC=local" `
  -AccountPassword (ConvertTo-SecureString "Welcome@2025#" -AsPlainText -Force) `
  -Enabled $true -ChangePasswordAtLogon $true

# Bulk Provisioning 500 Users from a CSV File:
Import-Csv -Path "C:\HR_New_Employees.csv" | ForEach-Object {
    New-ADUser -Name "$($_.FirstName) $($_.LastName)" -SamAccountName $_.Username `
      -Path $_.OUPath -AccountPassword (ConvertTo-SecureString $_.DefaultPassword -AsPlainText -Force) `
      -Enabled $true -ChangePasswordAtLogon $true
}
```

#v(8pt)

// =============================================================================
// CHAPTER 05 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  એક્ટિવ ડિરેક્ટરીમાં એક ગુપ્ત સુરક્ષા પ્રક્રિયા હોય છે જેને #hl-yellow[AdminSDHolder] અને #hl-yellow[SDProp (Security Descriptor Propagator)] કહેવામાં આવે છે. દર 60 મિનિટે PDC Emulator ડોમેનના તમામ પ્રિવિલેજ્ડ ગ્રુપ્સ (Domain Admins, Enterprise Admins, Schema Admins) ના સભ્યોની સુરક્ષા પરમિશન્સને રીસેટ કરી દે છે અને ઇનહેરિટન્સ બ્લોક કરી દે છે જેથી કોઈ જુનિયર એડમિનિસ્ટ્રેટર ભૂલથી પણ મુખ્ય એડમિન એકાઉન્ટ્સના અધિકારો બદલી ન શકે!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 પ્રકરણ 05 પ્રેક્ટિસ બહુવિકલ્પી પ્રશ્નો (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "Active Directory Users and Computers ગ્રાફિકલ કન્સોલને સીધું ખોલવા માટેનો સત્તાવાર રન કમાન્ડ કયો છે?",
  optA: "gpmc.msc",
  optB: "dsa.msc",
  optC: "dnsmgmt.msc",
  optD: "compmgmt.msc",
  ans: "B",
  exp: "dsa.msc (Directory Services Administration) ADUC કન્સોલનો સત્તાવાર માઇક્રોસોફ્ટ શોર્ટકટ કમાન્ડ છે."
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "માઇક્રોસોફ્ટ અનુસાર ડિફોલ્ટ 'Users' અને 'Computers' કન્ટેનર્સ પર ગ્રુપ પોલિસી (GPO) સીધી લાગુ ન થવાનું મુખ્ય કારણ શું છે?",
  optA: "તે પાસવર્ડથી પ્રોટેક્ટેડ હોય છે",
  optB: "તે સામાન્ય જેનેરિક કન્ટેનર છે, ઓર્ગેનાઇઝેશનલ યુનિટ (OU) નથી",
  optC: "તેમાં કોઈ લાયસન્સ હોતું નથી",
  optD: "તે માત્ર રીડ-ઓન્લી હોય છે",
  ans: "B",
  exp: "ગ્રુપ પોલિસી માત્ર સાઇટ્સ, ડોમેન અને ઓર્ગેનાઇઝેશનલ યુનિટ્સ (OUs) પર જ સીધી લિંક કરી શકાય છે, જેનેરિક કન્ટેનર્સ પર નહીં."
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "માઇક્રોસોફ્ટના ભલામણ કરેલ AGDLP એક્સેસ કંટ્રોલ મોડેલમાં 'DL' અક્ષરનો અર્થ શું છે?",
  optA: "Distribution List",
  optB: "Domain Local Group",
  optC: "Dynamic Link",
  optD: "Data Lock",
  ans: "B",
  exp: "AGDLP નું સંપૂર્ણ સ્વરૂપ છે: Accounts -> Global Groups -> Domain Local Groups -> Permissions."
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "નવો યુઝર બનાવતી વખતે 'User must change password at next logon' ચેક રાખવાનો મુખ્ય ફાયદો શું છે?",
  optA: "એડમિનિસ્ટ્રેટરને યુઝરનો કાયમી પાસવર્ડ ક્યારેય ખબર પડતી નથી અને નોન-રિપ્યુડિએશન જળવાઈ રહે છે",
  optB: "પાસવર્ડની જટિલતા સમાપ્ત થઈ જાય છે",
  optC: "યુઝર એકાઉન્ટ ક્યારેય લોકઆઉટ થતું નથી",
  optD: "યુઝર આપોઆપ ડોમેન એડમિન બની જાય છે",
  ans: "A",
  exp: "આ સુરક્ષા નીતિ સુનિશ્ચિત કરે છે કે કર્મચારી પોતે જ પોતાના એકાઉન્ટ ક્રેડેન્શિયલ્સનો એકમાત્ર કસ્ટોડિયન રહે."
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "PowerShell માં એક્ટિવ ડિરેક્ટરી હેઠળ નવું યુઝર એકાઉન્ટ બનાવવા માટે કયા સત્તાવાર Cmdlet નો ઉપયોગ થાય છે?",
  optA: "Add-User",
  optB: "Create-ADAccount",
  optC: "New-ADUser",
  optD: "Set-DomainUser",
  ans: "C",
  exp: "New-ADUser એક્ટિવ ડિરેક્ટરી મોડ્યુલનો સ્ટાન્ડર્ડ સત્તાવાર Cmdlet છે."
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 ટોપ MNC પ્લેસમેન્ટ ઇન્ટરવ્યુ પ્રશ્નો (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "ઇન્ટરવ્યુઅર: 'Security Groups અને Distribution Groups વચ્ચે ટેકનિકલ તફાવત શું છે, અને શું આપણે Distribution Group ને શેર ફોલ્ડર પર પરમિશન આપી શકીએ?'",
  a: "જવાબ: ના, Distribution Group ને ક્યારેય શેર અથવા NTFS પરમિશન આપી શકાતી નથી કારણ કે તેમની પાસે સુરક્ષા સંદર્ભ (SID - Security Identifier) હોતો નથી; તે માત્ર Exchange/Outlook મેઇલિંગ લિસ્ટ માટે વપરાય છે. માત્ર Security Groups પાસે જ સિક્યુરિટી SID હોય છે અને તેમને રિસોર્સિસ પર ACLs (Access Control Lists) માં પરવાનગીઓ આપી શકાય છે.",
  tip: "TCS અને Cognizant ના L1/L2 સપોર્ટ ઇન્ટરવ્યુમાં આ પ્રશ્ન વારંવાર પૂછવામાં આવે છે."
)

#v(3pt)

#interview-item(
  num: "2",
  q: "ઇન્ટરવ્યુઅર: 'AGDLP નેસ્ટિંગ મોડેલ શા માટે ઉપયોગમાં લેવાય છે? શું આપણે યુઝર્સને સીધા ફોલ્ડર પર પરમિશન ન આપી શકીએ?'",
  a: "જવાબ: યુઝર્સને સીધા ફોલ્ડર પર પરમિશન આપવી (Discretionary Access Control) એન્ટરપ્રાઇઝમાં વહીવટી અરાજકતા (Administrative Nightmare) પેદા કરે છે. જ્યારે કર્મચારી નોકરી બદલે કે વિભાગ બદલે ત્યારે તેની વ્યક્તિગત પરમિશન્સ ટ્રેક કરવી અશક્ય બને છે. AGDLP માં પરમિશન્સ માત્ર Domain Local ગ્રુપને અપાય છે. ફેરફાર થાય ત્યારે માત્ર કર્મચારીને Global ગ્રુપમાંથી કાઢવો કે ઉમેરવો પડે છે, ફોલ્ડરની ACLs ને સ્પર્શ કરવો પડતો નથી.",
  tip: "આ ઉત્તર તમારી એન્ટરપ્રાઇઝ સિસ્ટમ આર્કિટેક્ચરની ઊંડી સમજને દર્શાવે છે."
)

#v(3pt)

#interview-item(
  num: "3",
  q: "ઇન્ટરવ્યુઅર: 'એક યુઝરનું એકાઉન્ટ લોક થઈ ગયું છે. ADUC ખોલ્યા વગર કમાન્ડ-લાઇન અથવા PowerShell થી તેને 2 સેકન્ડમાં કેવી રીતે અનલોક કરશો?'",
  a: "જવાબ: PowerShell માં માત્ર એક કમાન્ડ ચલાવીશું: 'Unlock-ADAccount -Identity rpatel'. આ કમાન્ડ PDC Emulator પર એકાઉન્ટને ગ્રાફિકલ ઓવરહેડ વિના તાત્કાલિક અનલોક કરી દે છે.",
  tip: "PowerShell ઓટોમેશનનું વ્યવહારુ જ્ઞાન તમને અન્ય ઉમેદવારો કરતાં તરત અલગ તારવે છે."
)

#v(3pt)

#interview-item(
  num: "4",
  q: "ઇન્ટરવ્યુઅર: 'OU પર 'Protect container from accidental deletion' ચેકબોક્સ આંતરિક રીતે કેવી રીતે કાર્ય કરે છે?'",
  a: "જવાબ: જ્યારે આ ચેકબોક્સ ટીક હોય છે, ત્યારે એક્ટિવ ડિરેક્ટરી તે OU ની Access Control List (ACL) માં 'Everyone' અને 'Domain Admins' માટે 'Deny Delete' અને 'Deny Delete Subtree' ની પરમિશન એન્ટ્રી ઉમેરી દે છે. જો કોઈ એડમિન તેને ડિલીટ કરવાનો પ્રયાસ કરશે તો 'Access Denied' એરર આવશે. તેને ડિલીટ કરવા માટે પહેલા View -> Advanced Features માં જઈને Object ટેબ પરથી આ પ્રોટેક્શન હટાવવું પડે છે.",
  tip: "ડિરેક્ટરી સુરક્ષાની ઊંડાણપૂર્વકની સમજ L2 ઇન્ટરવ્યુમાં અત્યંત પ્રશંસનીય ગણાય છે."
)

#v(3pt)

#interview-item(
  num: "5",
  q: "ઇન્ટરવ્યુઅર: 'Fine-Grained Password Policies (FGPP) શું છે, અને તે ડિફોલ્ટ ડોમેન પોલિસી કરતાં કઈ રીતે અલગ છે?'",
  a: "જવાબ: જૂના વિન્ડોઝ સર્વરમાં સમગ્ર ડોમેનમાં માત્ર એક જ પાસવર્ડ પોલિસી (Default Domain Policy) લાગુ થઈ શકતી હતી. FGPP (Password Settings Objects - PSO) દ્વારા એડમિનિસ્ટ્રેટર એક જ ડોમેનના અલગ-અલગ OUs અથવા સિક્યુરિટી ગ્રુપ્સ માટે અલગ-અલગ પાસવર્ડ નીતિઓ બનાવી શકે છે (દા.ત. સામાન્ય સ્ટાફ માટે 8-અક્ષરનો પાસવર્ડ પરંતુ IT Admins માટે ફરજિયાત 16-અક્ષરનો જટિલ પાસવર્ડ અને 15-દિવસની એક્સપાયરી).",
  tip: "એન્ટરપ્રાઇઝ કમ્પ્લાયન્સ અને સિક્યુરિટી ઓડિટ્સ સાથે જોડાયેલો આ મહત્વપૂર્ણ પ્રશ્ન છે."
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 પ્રકરણ 05 મુખ્ય કોર્પોરેટ તારણો (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - OUs નો ઉપયોગ ઓબ્જેક્ટ્સનું તાર્કિક વર્ગીકરણ કરવા અને તેમના પર ગ્રુપ પોલિસી લાગુ કરવા માટે થાય છે.
      - રિસોર્સ પરમિશન્સ માટે હંમેશા AGDLP નેસ્ટિંગ મોડેલ અનુસરો; ક્યારેય યુઝરને સીધી પરમિશન્સ ન આપો.
      - PowerShell ના `New-ADUser` અને `Unlock-ADAccount` એન્ટરપ્રાઇઝ હેલ્પડેસ્ક કામગીરીની ઝડપ 10 ગણી વધારી દે છે.
    ]
  ]
)

#pagebreak()
