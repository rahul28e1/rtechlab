// =============================================================================
// CHAPTER 05: ADUC CONSOLE: OUS, DOMAIN USERS & GROUP MANAGEMENT
// =============================================================================

[#metadata("ch5") <chapter-5>]

#chapter-header(
  chapter-num: "CHAPTER 05",
  category: "भाग 5 : डायरेक्टरी ऑब्जेक्ट्स एवं एक्सेस कंट्रोल (Directory Objects & RBAC)",
  title: "ADUC कंसोल: OUs, डोमेन यूजर्स एवं सिक्योरिटी ग्रुप्स का प्रबंधन",
  subtitle: "ADUC (dsa.msc) · एंटरप्राइज OU पदानुक्रम · नए डोमेन यूजर अकाउंट्स · पासवर्ड व लॉकआउट नीतियां · सिक्योरिटी vs डिस्ट्रीब्यूशन ग्रुप्स · AGDLP मॉडल · PowerShell बल्क क्रिएशन"
)

=== 5.1 Active Directory Users and Computers (`dsa.msc`) इंटरफ़ेस
डोमेन कंट्रोलर प्रमोट होने के बाद, एक्टिव डायरेक्टरी के सभी ऑब्जेक्ट्स (Users, Computers, Groups, OUs) को प्रबंधित करने का प्राथमिक ग्राफिकल टूल #hl-yellow[Active Directory Users and Computers (ADUC)] है।

*ADUC कंसोल खोलने के 2 त्वरित तरीके:*
1. Server Manager -> शीर्ष दाईं ओर #hl-green[Tools] मेनू -> #hl-yellow[Active Directory Users and Computers] पर क्लिक करें।
2. रन डायलॉग (`Win + R`) में शॉर्टकट कमांड टाइप करें: #mark-green[`dsa.msc`] और Enter दबाएं।

कंसोल के बाईं ओर आपका डोमेन `#text(weight: "bold")[corp.rtechlab.local]` दिखेगा। इसके नीचे कुछ डिफ़ॉल्ट कंटेनर्स पहले से बने होते हैं:
- #text(weight: "bold", fill: rtech-navy)[Builtin:] सिस्टम के डिफ़ॉल्ट सुरक्षा ग्रुप्स (Administrators, Account Operators, Backup Operators आदि)।
- #text(weight: "bold", fill: rtech-navy)[Computers:] जब कोई साधारण क्लाइंट कंप्यूटर डोमेन जॉइन करता है, तो उसका खाता डिफ़ॉल्ट रूप से इसी फोल्डर में बनता है।
- #text(weight: "bold", fill: rtech-navy)[Domain Controllers:] इस डोमेन के सभी अधिकृत डोमेन कंट्रोलर सर्वर्स का OU।
- #text(weight: "bold", fill: rtech-navy)[Users:] डिफ़ॉल्ट डोमेन यूजर्स और ग्रुप्स (उदा. Administrator, Guest, Domain Admins, Domain Users)।

#warning-box(title: "डिफ़ॉल्ट कंटेनर vs ऑर्गेनाइजेशनल यूनिट (Critical Architectural Difference)")[
  'Computers' और 'Users' साधारण कंटेनर (Generic Containers) हैं, वे OU नहीं हैं! #hl-orange[डिफ़ॉल्ट कंटेनर्स पर कभी भी ग्रुप पॉलिसी ऑब्जेक्ट (GPO) सीधे लिंक नहीं किया जा सकता।] इसलिए एंटरप्राइज में कभी भी कर्मचारियों या कंप्यूटरों को डिफ़ॉल्ट फोल्डर में नहीं छोड़ा जाता; हमेशा कस्टम OUs बनाए जाते हैं।
]

#v(4pt)

=== 5.2 एंटरप्राइज OU पदानुक्रम डिजाइन (Enterprise OU Hierarchy Design)
एक सुव्यवस्थित OU संरचना कॉर्पोरेट प्रशासन और सुरक्षा नीतियों को सुगम बनाती है:

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
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 5.1: एंटरप्राइज OU संरचना एवं AGDLP रोल-बेस्ड एक्सेस कंट्रोल (RBAC) नेस्टिंग फ्रेमवर्क]
]

#v(4pt)

*कस्टम OU बनाने के चरण:*
1. ADUC में डोमेन नाम `#text(weight: "bold")[corp.rtechlab.local]` पर राइट-क्लिक करें -> #hl-yellow[New -> Organizational Unit]।
2. Name में टाइप करें: #hl-green[`RTechLab-Enterprise`]।
3. #mark-orange['Protect container from accidental deletion'] चेकबॉक्स को हमेशा चेक रहने दें। यह OU को किसी एडमिन द्वारा गलती से डिलीट होने से बचाता है। 'OK' दबाएं।
4. अब `RTechLab-Enterprise` पर राइट-क्लिक करके सब-OUs बनाएं:
   - #hl-yellow[`Corporate-Departments`] (इसके भीतर `HR`, `Finance`, `IT-Admins`, `Sales` सब-OUs)
   - #hl-yellow[`Workstations`] (कर्मचारियों के Windows 10/11 लैपटॉप व डेस्कटॉप)
   - #hl-yellow[`Servers`] (सदस्य सर्वर्स जैसे File Server, Web Server)

#v(6pt)

=== 5.3 नया डोमेन यूजर अकाउंट बनाना (Creating Domain User Accounts)
अब हम HR विभाग के लिए एक नया डोमेन यूजर बनाएंगे:

1. `Corporate-Departments -> HR` OU पर राइट-क्लिक करें -> #hl-yellow[New -> User]।
2. #text(weight: "bold")[First name:] `Rahul`, #text(weight: "bold")[Last name:] `Patel`।
3. #text(weight: "bold")[User logon name (UPN):] #hl-green[`rpatel`]\@corp.rtechlab.local।
4. #text(weight: "bold")[User logon name (pre-Windows 2000):] `CORP\rpatel` (स्वतः भर जाएगा)। 'Next' दबाएं।
5. #text(weight: "bold")[पासवर्ड सेटिंग्स एवं 4 महत्वपूर्ण चेकबॉक्स:]
   - #text(weight: "bold", fill: rtech-blue)[✓ User must change password at next logon:] (कॉर्पोरेट बेस्ट प्रैक्टिस — जब कर्मचारी पहली बार लॉगिन करेगा, तो सिस्टम उसे अपना निजी पासवर्ड बनाने के लिए मजबूर करेगा)।
   - #text(weight: "bold", fill: rtech-muted)[User cannot change password:] (शेयर्ड या कियोस्क कंप्यूटर खातों के लिए)।
   - #text(weight: "bold", fill: rtech-rose)[Password never expires:] (केवल सर्विस अकाउंट्स के लिए; सामान्य यूजर्स पर इसे लगाना गंभीर सुरक्षा उल्लंघन है)।
   - #text(weight: "bold", fill: rtech-amber)[Account is disabled:] (कर्मचारी के नोटिस पीरियड या छुट्टी पर जाने पर खाता अस्थायी बंद करने के लिए)।
6. प्रारंभिक सुरक्षित पासवर्ड डालें (उदा. #hl-green[`Welcome@2025#`]) और 'Next' -> 'Finish' करें।

#v(6pt)

=== 5.4 अकाउंट लॉकआउट एवं फाइन-ग्रेंड पासवर्ड नीतियां (Account Lockout & FGPP)
ब्रूट-फोर्स पासवर्ड अटैक्स को रोकने के लिए एक्टिव डायरेक्टरी में अकाउंट लॉकआउट सुरक्षा तंत्र होता है:
- यदि कोई कर्मचारी या हैकर लगातार 5 बार गलत पासवर्ड डालता है (Account lockout threshold), तो उसका खाता 30 मिनट के लिए स्वतः लॉक हो जाता है।
- *अकाउंट अनलॉक करने का तरीका:* ADUC में यूजर पर राइट-क्लिक -> #hl-yellow[Properties -> Account] टैब पर जाएं। नीचे स्थित चेकबॉक्स #hl-green['Unlock account. This account is currently locked out on this Active Directory Domain Controller'] पर टिक लगाएं और 'Apply' करें।

#v(6pt)

=== 5.5 सिक्योरिटी ग्रुप्स बनाम डिस्ट्रीब्यूशन ग्रुप्स (Group Types)
एक्टिव डायरेक्टरी में दो प्रकार के ग्रुप्स होते हैं:
1. #text(weight: "bold", fill: rtech-navy)[सिक्योरिटी ग्रुप्स (Security Groups):] इनका प्राथमिक उद्देश्य नेटवर्क संसाधनों (फाइल शेयर, प्रिंटर, शेयरपॉइंट) पर अनुमतियां (Permissions) प्रदान करना होता है। इनका उपयोग ईमेल वितरण के लिए भी किया जा सकता है।
2. #text(weight: "bold", fill: rtech-navy)[डिस्ट्रीब्यूशन ग्रुप्स (Distribution Groups):] इनका उपयोग केवल ईमेल सूचियां (Distribution Lists - Exchange Server/Outlook) बनाने के लिए किया जाता है। #hl-orange[डिस्ट्रीब्यूशन ग्रुप्स को कभी भी किसी फाइल या फोल्डर की NTFS सुरक्षा अनुमति नहीं दी जा सकती!]

#v(6pt)

=== 5.6 ग्रुप स्कोप्स एवं AGDLP बेस्ट प्रैक्टिस (The AGDLP Standard)
माइक्रोसॉफ्ट एंटरप्राइज में रोल्स और परमिशंस प्रबंधित करने के लिए #hl-yellow[AGDLP मॉडल] की सिफारिश करता है:

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[AGDLP फॉर्मूला (MNC इंटरव्यू में 100% पूछा जाने वाला सिद्धांत):]\
    - #text(weight: "bold", fill: rtech-blue)[A (Accounts):] यूजर अकाउंट्स (उदा. `rpatel`, `ajain`)।
    - #text(weight: "bold", fill: rtech-blue)[G (Global Groups):] यूजर्स को उनके कार्य/विभाग के आधार पर ग्लोबल ग्रुप में जोड़ें (उदा. `GG_HR_Staff`)।
    - #text(weight: "bold", fill: rtech-amber)[DL (Domain Local Groups):] संसाधन की आवश्यकता के अनुसार डोमेन लोकल ग्रुप बनाएं और ग्लोबल ग्रुप को इसमें नेस्ट करें (उदा. `DL_HR_Payroll_Read`)।
    - #text(weight: "bold", fill: rtech-emerald)[P (Permissions):] संसाधन (Shared Folder) पर केवल Domain Local ग्रुप को NTFS/Share अनुमति आवंटित करें!
  ]
)

#v(6pt)

=== 5.7 PowerShell द्वारा बल्क यूजर निर्माण (Automated Bulk User Onboarding)
उत्पादन में जब 200 नए कर्मचारी एक साथ कंपनी जॉइन करते हैं, तो ADUC में एक-एक करके यूजर बनाना असंभव होता है। एडमिनिस्ट्रेटर PowerShell का उपयोग करते हैं:

```powershell
# एकल यूजर निर्माण:
New-ADUser -Name "Rahul Patel" -GivenName "Rahul" -Surname "Patel" `
  -SamAccountName "rpatel" -UserPrincipalName "rpatel@corp.rtechlab.local" `
  -Path "OU=HR,OU=Corporate-Departments,OU=RTechLab-Enterprise,DC=corp,DC=rtechlab,DC=local" `
  -AccountPassword (ConvertTo-SecureString "Welcome@2025#" -AsPlainText -Force) `
  -Enabled $true -ChangePasswordAtLogon $true

# CSV फाइल से 500 यूजर्स एक साथ बनाना:
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
  एक्टिव डायरेक्टरी में एक गुप्त सुरक्षा प्रक्रिया होती है जिसे #hl-yellow[AdminSDHolder] और #hl-yellow[SDProp (Security Descriptor Propagator)] कहा जाता है। हर 60 मिनट में PDC Emulator डोमेन के सभी विशेषाधिकार प्राप्त ग्रुप्स (Domain Admins, Enterprise Admins, Schema Admins) के सदस्यों की सुरक्षा अनुमतियों को रीसेट कर देता है और इन्हेरिटेंस को ब्लॉक कर देता है ताकि कोई कनिष्ठ एडमिन अनजाने में शीर्ष एडमिन खातों के अधिकार न बदल सके!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 05 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "Active Directory Users and Computers ग्राफिकल कंसोल को सीधे खोलने का आधिकारिक रन कमांड क्या है?",
  optA: "gpmc.msc",
  optB: "dsa.msc",
  optC: "dnsmgmt.msc",
  optD: "compmgmt.msc",
  ans: "B",
  exp: "dsa.msc (Directory Services Administration) ADUC कंसोल का आधिकारिक शॉर्टकट है।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "माइक्रोसॉफ्ट के अनुसार डिफ़ॉल्ट 'Users' और 'Computers' कंटेनर्स पर ग्रुप पॉलिसी (GPO) लागू न हो पाने का क्या कारण है?",
  optA: "वे पासवर्ड से सुरक्षित होते हैं",
  optB: "वे साधारण जेनेरिक कंटेनर हैं, ऑर्गेनाइजेशनल यूनिट (OU) नहीं हैं",
  optC: "उनमें कोई लाइसेंस नहीं होता",
  optD: "वे केवल रीड-ओनली होते हैं",
  ans: "B",
  exp: "ग्रुप पॉलिसी केवल साइट, डोमेन और ऑर्गेनाइजेशनल यूनिट्स (OUs) पर ही सीधे लिंक की जा सकती है, जेनेरिक कंटेनर्स पर नहीं।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "माइक्रोसॉफ्ट के अनुशंसित AGDLP एक्सेस कंट्रोल मॉडल में 'DL' अक्षर का क्या तात्पर्य है?",
  optA: "Distribution List",
  optB: "Domain Local Group",
  optC: "Dynamic Link",
  optD: "Data Lock",
  ans: "B",
  exp: "AGDLP का पूर्ण रूप है: Accounts -> Global Groups -> Domain Local Groups -> Permissions।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "किसी नए यूजर को बनाते समय 'User must change password at next logon' चेक करने का प्राथमिक लाभ क्या है?",
  optA: "एडमिनिस्ट्रेटर को यूजर का पासवर्ड कभी पता नहीं रहता और जवाबदेही (Non-Repudiation) बनी रहती है",
  optB: "पासवर्ड की जटिलता समाप्त हो जाती है",
  optC: "यूजर कभी लॉकआउट नहीं होता",
  optD: "यूजर स्वतः डोमेन एडमिन बन जाता है",
  ans: "A",
  exp: "यह कॉर्पोरेट सुरक्षा नीति का नियम है ताकि केवल कर्मचारी ही अपने खाते के क्रेडेंशियल्स का मालिक रहे।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "PowerShell में एक्टिव डायरेक्टरी के अंदर नया यूजर अकाउंट बनाने के लिए किस आधिकारिक Cmdlet का उपयोग किया जाता है?",
  optA: "Add-User",
  optB: "Create-ADAccount",
  optC: "New-ADUser",
  optD: "Set-DomainUser",
  ans: "C",
  exp: "New-ADUser एक्टिव डायरेक्टरी मॉड्यूल का मानक आधिकारिक Cmdlet है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'Security Groups और Distribution Groups में तकनीकी अंतर क्या है, और क्या हम Distribution Group को शेयर फोल्डर पर परमिशन दे सकते हैं?'",
  a: "उत्तर: नहीं, Distribution Group को कभी भी शेयर या NTFS परमिशन नहीं दी जा सकती क्योंकि उनके पास SID (Security Identifier) का सुरक्षा संदर्भ नहीं होता; वे केवल Exchange/Outlook मेलिंग लिस्ट के लिए होते हैं। केवल Security Groups के पास ही सुरक्षा SID होता है और उन्हें संसाधनों पर ACLs (Access Control Lists) में अनुमतियां दी जा सकती हैं।",
  tip: "TCS और Cognizant के L1/L2 सपोर्ट इंटरव्यू में यह प्रश्न बार-बार दोहराया जाता है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'AGDLP नेस्टिंग मॉडल का उपयोग क्यों किया जाता है? क्या हम यूजर्स को सीधे फोल्डर पर परमिशन नहीं दे सकते?'",
  a: "उत्तर: यूजर्स को सीधे फोल्डर पर परमिशन देना (Discretionary Access Control) एंटरप्राइज में प्रशासनिक अराजकता (Administrative Nightmare) पैदा करता है। जब कोई कर्मचारी नौकरी छोड़ता है या विभाग बदलता है, तो उसके राइट्स खोजना असंभव हो जाता है। AGDLP में परमिशन केवल Domain Local ग्रुप को मिलती है; कर्मचारी के बदलने पर केवल उसे Global ग्रुप से हटाना या जोड़ना पड़ता है, फोल्डर की ACLs को कभी छूना नहीं पड़ता।",
  tip: "यह उत्तर आपके उच्च-स्तरीय सिस्टम आर्किटेक्चर ज्ञान को प्रदर्शित करता है।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'एक यूजर का खाता लॉक हो गया है। ADUC में जाए बिना कमांड-लाइन या PowerShell से उसे 2 सेकंड में कैसे अनलॉक करेंगे?'",
  a: "उत्तर: PowerShell में सिर्फ एक कमांड चलाएंगे: 'Unlock-ADAccount -Identity rpatel'। इससे PDC Emulator पर खाता तुरंत अनलॉक हो जाता है।",
  tip: "PowerShell ऑटोमेशन की समझ आपको साधारण उम्मीदवारों से तुरंत अलग कर देती है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'OU पर 'Protect container from accidental deletion' चेकबॉक्स आंतरिक रूप से कैसे काम करता है?'",
  a: "उत्तर: जब यह चेकबॉक्स टिक होता है, तो एक्टिव डायरेक्टरी उस OU के Access Control List (ACL) पर 'Everyone' और 'Domain Admins' के लिए 'Deny Delete' और 'Deny Delete Subtree' का परमिशन प्रविष्टि जोड़ देती है। यदि कोई एडमिन इसे डिलीट करने का प्रयास करेगा तो 'Access Denied' एरर आएगा। इसे डिलीट करने के लिए पहले View -> Advanced Features में जाकर Object टैब से इस सुरक्षा को हटाना पड़ता है।",
  tip: "विस्तृत आंतरिक सुरक्षा समझ L2 डायरेक्टरी सर्विसेज इंटरव्यू में बहुत सराही जाती है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'Fine-Grained Password Policies (FGPP) क्या है, और यह डिफ़ॉल्ट डोमेन पासवर्ड पॉलिसी से कैसे भिन्न है?'",
  a: "उत्तर: पुराने विंडोज सर्वर में पूरे डोमेन में केवल एक ही पासवर्ड पॉलिसी (Default Domain Policy) लागू हो सकती थी। FGPP (Password Settings Objects - PSO) के द्वारा एडमिनिस्ट्रेटर एक ही डोमेन के अलग-अलग OUs या ग्रुप्स के लिए अलग-अलग पासवर्ड नीतियां बना सकते हैं (उदा. सामान्य कर्मचारियों के लिए 8-अक्षर का पासवर्ड लेकिन IT Admins के लिए अनिवार्य 16-अक्षर का जटिल पासवर्ड और 15-दिन की एक्सपायरी)।",
  tip: "एंटरप्राइज कंप्लायंस और सुरक्षा ऑडिट्स से जुड़ा यह अत्यंत महत्वपूर्ण प्रश्न है।"
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 05 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - OUs का उपयोग ऑब्जेक्ट्स को तार्किक रूप से वर्गीकृत करने और उन पर ग्रुप पॉलिसी लागू करने के लिए किया जाता है।
      - संसाधनों की अनुमतियों के लिए हमेशा AGDLP नेस्टिंग मॉडल का पालन करें; कभी भी यूजर को सीधे परमिशन न दें।
      - PowerShell का `New-ADUser` और `Unlock-ADAccount` एंटरप्राइज हेल्पडेस्क ऑपरेशंस की गति को 10 गुना बढ़ा देते हैं।
    ]
  ]
)

#pagebreak()

