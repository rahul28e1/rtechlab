// =============================================================================
// CHAPTER 10: FILE SERVER RESOURCE MANAGER (#hl-orange[FSRM]), NTFS & QUOTA MANAGEMENT
// =============================================================================

[#metadata("ch10") <chapter-10>]

#chapter-header(
  chapter-num: "CHAPTER 10",
  category: "भाग 10 : स्टोरेज, शेयरिंग एवं फाइल रिसोर्स मैनेजमेंट (Storage & #hl-orange[FSRM])",
  title: "फाइल सर्वर रिसोर्स मैनेजर (#hl-orange[FSRM]), NTFS अनुमतियां एवं कोटा प्रबंधन",
  subtitle: "शेयर्ड फ़ोल्डर्स · SMB 3.1.1 · शेयर vs NTFS अनुमतियां (इफेक्टिव फॉर्मूला) · #hl-orange[FSRM] रोल · हार्ड vs सॉफ्ट स्टोरेज कोटा · फाइल स्क्रीनिंग (MP3/EXE ब्लॉक) · स्टोरेज रिपोर्ट्स"
)

=== 10.1 एंटरप्राइज फाइल शेयरिंग आर्किटेक्चर एवं SMB 3.1.1 प्रोटोकॉल
किसी भी कॉर्पोरेट संगठन में कर्मचारियों का दैनिक कार्य फाइलों (Word, Excel, PDFs, प्रोजेक्ट कोड) के लेन-देन पर निर्भर होता है। यदि सभी कर्मचारी डेटा को अपने निजी लैपटॉप पर रखेंगे, तो लैपटॉप खोने पर कंपनी का संपूर्ण डेटा नष्ट हो सकता है।

#mark-yellow[फाइल सर्वर (File Server) एक केंद्रीय सर्वर होता है जो नेटवर्क पर सभी विभागों (HR, Accounts, Legal) के साझा डेटा को सुरक्षित स्टोर करता है और SMB (Server Message Block) प्रोटोकॉल के जरिए एक्सेस प्रदान करता है।]

विंडोज सर्वर 2025 में फाइल शेयरिंग #hl-green[SMB 3.1.1] पर आधारित है:
- डिफ़ॉल्ट पोर्ट: #hl-green[TCP Port 445]
- #text(weight: "bold", fill: rtech-navy)[SMB Signing (हस्ताक्षर):] Server 2025 में डिफ़ॉल्ट अनिवार्य (Mandatory) है जो मैन-इन-द-मिडिल रिले अटैक्स को रोकता है।
- #text(weight: "bold", fill: rtech-navy)[SMB Encryption:] एंड-टू-एंड AES-256-GCM एनक्रिप्शन जो अनधिकृत नेटवर्क स्निफिंग से डेटा सुरक्षित रखता है।

#v(4pt)

=== 10.2 शेयर अनुमतियां (Share Permissions) बनाम NTFS अनुमतियां
यह विंडोज इंफ्रास्ट्रक्चर के सबसे महत्वपूर्ण विषयों में से एक है:

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
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 10.1: शेयर अनुमतियां बनाम NTFS अनुमतियां — इफेक्टिव परमिशन फॉर्मूला एवं मोस्ट रेस्ट्रिक्टिव नियम]
]

#v(4pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "शेयर अनुमतियां (Share Permissions)")[
      - केवल तभी लागू होती हैं जब यूजर नेटवर्क के जरिए शेयर्ड फोल्डर को एक्सेस करता है (`\\Server\Share`)।
      - यदि यूजर सर्वर पर स्थानीय रूप से लॉगिन है, तो शेयर परमिशन काम नहीं करती।
      - केवल 3 स्तर होते हैं: #hl-yellow[Read], #hl-green[Change], और #hl-orange[Full Control]।
    ]
  ],
  [
    #info-box(title: "NTFS सुरक्षा अनुमतियां (Security Permissions)")[
      - स्थानीय (Local) और नेटवर्क (Network) दोनों तरह के एक्सेस पर 100% लागू होती हैं।
      - NTFS फॉर्मेटेड वॉल्यूम पर ही कार्य करती हैं।
      - अत्यधिक विस्तृत स्तर: #hl-yellow[Read], #hl-green[Write], #hl-orange[Modify], #hl-green[Read & Execute], और #hl-orange[Full Control]।
    ]
  ]
)

#v(6pt)

=== 10.3 इफेक्टिव परमिशंस नियम (The Most Restrictive Rule)
जब कोई यूजर नेटवर्क से किसी फोल्डर में फाइल खोलने का प्रयास करता है, तो विंडोज शेयर परमिशन और NTFS परमिशन दोनों की तुलना करता है:

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0FDF4"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "bold", fill: rtech-emerald)[इफेक्टिव परमिशन का कॉर्पोरेट फॉर्मूला (The Golden Law):]\
    #align(center)[#text(size: 9.5pt, weight: "black", fill: rtech-navy)[
      Effective Permission = Most Restrictive (Share Permission, NTFS Permission)
    ]]\
    #text(size: 7.5pt, fill: rtech-text)[
      - *उदाहरण 1:* यदि Share परमिशन = #hl-green[Read] है और NTFS परमिशन = #hl-green[Full Control] है, तो प्रभावी परमिशन केवल #mark-yellow[Read] होगी (यूजर फाइल में बदलाव नहीं कर पाएगा)!
      - *उदाहरण 2:* यदि Share परमिशन = #hl-green[Full Control] है और NTFS परमिशन = #hl-green[Modify] है, तो प्रभावी परमिशन #mark-green[Modify] होगी!
      - #text(weight: "bold", fill: rtech-blue)[एंटरप्राइज बेस्ट प्रैक्टिस:] शेयर परमिशन को हमेशा `Authenticated Users = Change` (या `Full Control`) पर खुला छोड़ें, और वास्तविक सुरक्षा अनुमतियां केवल *NTFS ACLs* के जरिए नियंत्रित करें!
    ]
  ]
)

#v(6pt)

=== 10.4 फाइल सर्वर रिसोर्स मैनेजर (#hl-orange[FSRM]) रोल इंस्टॉलेशन
#hl-orange[FSRM] माइक्रोसॉफ्ट का उन्नत स्टोरेज प्रबंधन टूल है जो उपयोगकर्ताओं द्वारा डिस्क स्पेस की बर्बादी और अनधिकृत फाइलों को रोकने की सुविधा देता है:

1. #hl-yellow[Server Manager] -> #hl-green[Add Roles and Features] में जाएं।
2. Server Roles -> #text(weight: "bold")[File and Storage Services] -> #text(weight: "bold")[File and iSCSI Services] का विस्तार करें।
3. #mark-yellow[File Server Resource Manager] चेकबॉक्स पर टिक करें।
4. 'Add Features' (FSRM टूल्स) चुनकर 'Install' करें।
5. इंस्टॉलेशन के बाद Tools मेनू से #hl-green[File Server Resource Manager] खोलें (या रन में टाइप करें: #mark-green[`fsrm.msc`])।

#v(6pt)

=== 10.5 स्टोरेज कोटा प्रबंधन: हार्ड कोटा बनाम सॉफ्ट कोटा (Quota Management)
बिना कोटा नियंत्रण के कोई भी कर्मचारी सर्वर पर सैकड़ों गीगाबाइट की निजी फाइलें अपलोड करके पूरी हार्ड डिस्क भर सकता है:

- #text(weight: "bold", fill: rtech-rose)[हार्ड कोटा (Hard Quota):] यह एक सख्त सीमा है। जैसे ही यूजर की स्टोरेज सीमा 100% (उदा. 10 GB) तक पहुंचती है, विंडोज उसे आगे 1 बाइट भी लिखने नहीं देता और स्क्रीन पर 'There is not enough space on the disk' का एरर आ जाता है।
- #text(weight: "bold", fill: rtech-amber)[सॉफ्ट कोटा (Soft Quota):] यह केवल निगरानी सीमा है। जब यूजर 100% स्पेस भर लेता है, तब भी फाइल सेविंग ब्लॉक नहीं होती, लेकिन सिस्टम एडमिनिस्ट्रेटर और यूजर को ईमेल चेतावनी भेजी जाती है ताकि वे अतिरिक्त स्टोरेज खरीद सकें।

*कोटा कॉन्फ़िगरेशन चरण:*
1. `fsrm.msc` में बाईं ओर #hl-yellow[Quota Management -> Quotas] पर जाएं।
2. दाईं ओर 'Create Quota...' पर क्लिक करें।
3. Quota path: अपने शेयर्ड फोल्डर का पाथ चुनें (उदा. `C:\Shares\HR_Data`)।
4. 'Derive properties from this quota template': #hl-green['10 GB Limit (Hard Quota)'] चुनें।
5. Notification Thresholds: 85% और 95% भरने पर ऑटोमैटिक ईमेल अलर्ट टिक करें। 'Create' दबाएं।

#v(6pt)

=== 10.6 फाइल स्क्रीनिंग (File Screening): ऑडियो, वीडियो एवं मैलवेयर ब्लॉक करना
कर्मचारी अक्सर कंपनी के सर्वर पर पाइरेटेड फिल्में, गाने (`.mp3`, `.mp4`), या पर्सनल बैकअप स्टोर करने लगते हैं। फाइल स्क्रीनिंग इसे तत्काल रोक देती है:

1. FSRM कंसोल में जाएं: #hl-yellow[File Screening Management -> File Screens]।
2. 'Create File Screen...' पर क्लिक करें।
3. File screen path: `C:\Shares\` चुनें।
4. 'Block Audio and Video Files' टेम्पलेट चुनें (जिसमें `*.mp3`, `*.mp4`, `*.avi`, `*.mkv`, `*.wav` पहले से परिभाषित होते हैं)।
5. Screening Type में #mark-yellow[Active screening: Do not allow users to save unauthorized files] चुनें।
6. 'Create' दबाएं। अब यदि कोई यूजर उस फोल्डर में MP3 या MP4 फाइल कॉपी करने का प्रयास करेगा, तो विंडोज तुरंत #hl-orange['Access is Denied'] का डायलॉग दिखाकर फाइल को सेव होने से रोक देगा!

#v(6pt)

=== 10.7 ऑटोमेटेड स्टोरेज उपयोगिता रिपोर्ट्स (Storage Reports Management)
FSRM एडमिनिस्ट्रेटर को स्टोरेज की ऑडिट रिपोर्ट स्वचालित रूप से ईमेल करने की सुविधा देता है:
- #text(weight: "bold")[Duplicate Files Report:] डिस्क पर एक ही फाइल की डुप्लिकेट कॉपियां ढूंढकर स्टोरेज बचाता है।
- #text(weight: "bold")[Large Files Report:] 500 MB से बड़ी फाइलों की सूची निकालता है।
- #text(weight: "bold")[Least Recently Accessed Files:] वे पुरानी फाइलें जो 1 वर्ष से किसी ने नहीं खोलीं (आर्काइव करने योग्य)।

#v(8pt)

// =============================================================================
// CHAPTER 10 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  विंडोज सर्वर में एक जादुई फीचर होता है जिसे #hl-yellow[Volume Shadow Copies (#hl-green[VSS] / Previous Versions)] कहा जाता है। यदि कोई कर्मचारी गलती से 5 घंटे की मेहनत वाली Excel फाइल डिलीट कर दे या ओवरराइट कर दे, तो एडमिन को बैकअप टेप ढूंढने की जरूरत नहीं होती! कर्मचारी फाइल पर राइट-क्लिक करके #hl-green['Restore previous versions'] पर क्लिक करता है और सुबह 9:00 बजे की सुरक्षित कॉपी बिना एडमिन की मदद के खुद रिस्टोर कर लेता है!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 10 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "यदि किसी शेयर्ड फोल्डर पर Share Permission 'Read' है और NTFS Permission 'Full Control' है, तो नेटवर्क से जुड़ने वाले यूजर की प्रभावी अनुमति (Effective Permission) क्या होगी?",
  optA: "Full Control",
  optB: "Modify",
  optC: "Read",
  optD: "Write Only",
  ans: "C",
  exp: "इफेक्टिव परमिशन का नियम है: Share और NTFS में से जो सबसे अधिक प्रतिबंधात्मक (Most Restrictive) हो, वही लागू होती है।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "FSRM में उस कोटा प्रकार को क्या कहते हैं जो निर्धारित सीमा तक पहुंचने पर यूजर को आगे फाइलें सेव करने से पूरी तरह रोक देता है?",
  optA: "Soft Quota",
  optB: "Hard Quota",
  optC: "Dynamic Quota",
  optD: "Elastic Quota",
  ans: "B",
  exp: "Hard Quota सीमा पार होते ही 'Disk is full' एरर देकर राइट ऑपरेशन को 100% ब्लॉक कर देता है।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "कंपनी के शेयर्ड फोल्डर में कर्मचारियों द्वारा MP3 गाने और MP4 फिल्में सेव करने से रोकने के लिए FSRM के किस फीचर का उपयोग किया जाता है?",
  optA: "Storage Spaces",
  optB: "File Screening Management",
  optC: "DNS Scavenging",
  optD: "Shadow Copies",
  ans: "B",
  exp: "File Screening तकनीक प्रतिबंधित फाइल एक्सटेंशन (.mp3, .mp4, .exe) को स्टोरेज में सेव होने से रोकती है।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "विंडोज सर्वर में File Server Resource Manager कंसोल को सीधे खोलने का आधिकारिक रन कमांड क्या है?",
  optA: "diskmgmt.msc",
  optB: "fsrm.msc",
  optC: "storagemgmt.msc",
  optD: "fsmgmt.msc",
  ans: "B",
  exp: "fsrm.msc सीधे File Server Resource Manager कंसोल को खोलता है।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "विंडोज सर्वर 2025 में फाइल शेयरिंग (SMB 3.1.1) डिफ़ॉल्ट रूप से किस मानक नेटवर्क पोर्ट पर संचालित होती है?",
  optA: "TCP पोर्ट 80",
  optB: "TCP पोर्ट 445",
  optC: "TCP पोर्ट 3389",
  optD: "UDP पोर्ट 53",
  ans: "B",
  exp: "SMB (Server Message Block) फाइल शेयरिंग आधिकारिक तौर पर TCP पोर्ट 445 पर कार्य करती है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'शेयर परमिशन और NTFS परमिशन में कौन अधिक शक्तिशाली है, और प्रोडक्शन में माइक्रोसॉफ्ट की आधिकारिक सिफारिश क्या है?'",
  a: "उत्तर: नेटवर्क एक्सेस के समय दोनों में से जो 'सबसे अधिक प्रतिबंधात्मक' (Most Restrictive) हो, वह लागू होती है। हालांकि स्थानीय एक्सेस पर केवल NTFS काम करती है। माइक्रोसॉफ्ट की आधिकारिक सर्वोत्तम प्रथा यह है कि शेयर परमिशन को 'Authenticated Users = Change' या 'Full Control' पर खुला रखा जाए, और सुरक्षा का संपूर्ण सूक्ष्म नियंत्रण (Granular Control) केवल NTFS ACLs द्वारा किया जाए क्योंकि NTFS में विरासत (Inheritance), ओनरशिप और 13 विस्तृत परमिशन स्तर उपलब्ध होते हैं।",
  tip: "Capgemini, Infosys और TCS के L1/L2 इंफ्रास्ट्रक्चर इंटरव्यू का यह क्लासिक प्रश्न है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'NTFS Permissions में 'Modify' और 'Write' परमिशन के बीच क्या अंतर होता है?'",
  a: "उत्तर: 'Write' परमिशन यूजर को नई फाइल बनाने और मौजूदा फाइल में डेटा जोड़ने का अधिकार देती है, लेकिन वह फाइल को 'डिलीट' नहीं कर सकता। 'Modify' परमिशन में Read, Write, Execute के साथ-साथ फाइलों और सब-फोल्डर्स को 'डिलीट' करने का पूर्ण अधिकार शामिल होता है।",
  tip: "यह सूक्ष्म अंतर अधिकांश छात्र नहीं जानते; सही उत्तर आपको तुरंत बढ़त दिलाता है।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'FSRM में Active Screening और Passive Screening में क्या अंतर होता है?'",
  a: "उत्तर: Active Screening यूजर को प्रतिबंधित फाइल (उदा. song.mp3) सेव करने से तुरंत रोक देती है (Access Denied) और एडमिन को ईमेल भेजती है। Passive Screening यूजर को फाइल सेव करने देती है (काम नहीं रोकती), लेकिन बैकग्राउंड में इवेंट लॉग और एडमिन को ईमेल अलर्ट भेज देती है ताकि निगरानी रखी जा सके।",
  tip: "स्टोरेज एडमिनिस्ट्रेशन और कम्प्लायंस रोल्स में यह प्रश्न हमेशा पूछा जाता है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'Volume Shadow Copies (#hl-green[VSS]) क्या है, और यह डिस्क पर कितना स्पेस लेता है?'",
  a: "उत्तर: #hl-green[VSS] वॉल्यूम का पॉइंट-इन-टाइम ब्लॉक-लेवल स्नैपशॉट लेता है। यह पूरी फाइल की नई कॉपी नहीं बनाता, बल्कि केवल 'बदले हुए ब्लॉक्स' (Delta Changes) को 'System Volume Information' में स्टोर करता है। डिफ़ॉल्ट रूप से यह वॉल्यूम का अधिकतम 10% स्पेस लेता है और यूजर को 'Previous Versions' से स्वतः फाइल रिस्टोर करने की सुविधा देता है।",
  tip: "बैकअप और डेटा रिकवरी के इंटरव्यूज का यह मुख्य सवाल है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'Access-Based Enumeration (ABE) क्या है, और यह कर्मचारियों के लिए क्यों उपयोगी है?'",
  a: "उत्तर: ABE एक शानदार विंडोज फीचर है। इसके सक्षम होने पर यूजर को शेयर्ड ड्राइव के अंदर केवल वही फोल्डर्स दिखाई देते हैं जिन पर उसके पास कम से कम 'Read' परमिशन हो! जिन फोल्डर्स पर उसके पास परमिशन नहीं है, वे उसकी स्क्रीन से पूरी तरह गायब (Hide) हो जाते हैं। इससे कर्मचारियों में अनावश्यक जिज्ञासा और 'Access Denied' की हेल्पडेस्क कॉल्स 90% कम हो जाती हैं।",
  tip: "सीनियर सिस्टम एडमिनिस्ट्रेटर राउंड में ABE का व्यावहारिक उपयोग परखा जाता है।"
)

#v(4pt)

#block(
  width: 100%,
  stroke: 0.8pt + rgb("#BAE6FD"),
  fill: rgb("#F0F9FF"),
  radius: 4pt,
  inset: (x: 8pt, y: 5pt),
  [
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 10 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - इफेक्टिव परमिशन शेयर और NTFS का 'मोस्ट रेस्ट्रिक्टिव' नियम मानती है; परमिशन केवल NTFS ACLs द्वारा दें।
      - FSRM का Hard Quota डिस्क भरने से बचाता है और File Screening गैर-कॉर्पोरेट फाइलों (MP3/MP4) को ब्लॉक करती है।
      - #hl-green[VSS] Shadow Copies और Access-Based Enumeration (ABE) एंटरप्राइज फाइल सर्वर की यूजर फ्रेंडली क्षमता को बढ़ाते हैं।
    ]
  ]
)

#pagebreak()

