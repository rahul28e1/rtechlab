// =============================================================================
// CHAPTER 09: DNS SERVER ARCHITECTURE: ZONES, RECORDS & SCAVENGING
// =============================================================================

[#metadata("ch9") <chapter-9>]

#chapter-header(
  chapter-num: "CHAPTER 09",
  category: "भाग 9 : कॉर्पोरेट नेम रेजोल्यूशन एवं DNS (Enterprise Name Resolution)",
  title: "DNS सर्वर आर्किटेक्चर: फ़ॉरवर्ड/रिवर्स ज़ोन, रिकॉर्ड्स एवं स्कैवेंजिंग",
  subtitle: "DNS का एंटरप्राइज महत्व · AD-Integrated ज़ोन · फ़ॉरवर्ड vs रिवर्स लुकअप · A, PTR, CNAME, MX व SRV रिकॉर्ड्स · #hl-yellow[रूट हिंट्स] vs फॉरवर्डर्स · DNS स्कैवेंजिंग"
)

=== 9.1 DNS का एंटरप्राइज महत्व एवं एक्टिव डायरेक्टरी से अटूट संबंध
यदि एक्टिव डायरेक्टरी कॉर्पोरेट नेटवर्क का *मस्तिष्क* है, तो DNS सर्वर उसका *हृदय* है। संपूर्ण विंडोज डोमेन एनवायरनमेंट में कोई भी सेवा (Login, #hl-orange[Kerberos], File Sharing, GPO) DNS के बिना 1 सेकंड भी कार्य नहीं कर सकती।

#mark-yellow[डोमेन नेम सिस्टम (DNS) एक श्रेणीबद्ध और वितरित डेटाबेस सेवा (Hierarchical Distributed Database) है जो मनुष्य के समझने योग्य कंप्यूटर नामों (उदा. `portal.corp.rtechlab.local`) को नेटवर्क के समझने योग्य IP पतों (`192.168.1.50`) में अनुवादित (Resolve) करती है।]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    #info-box(title: "DNS पोर्ट्स एवं प्रोटोकॉल्स")[
      DNS डिफ़ॉल्ट रूप से #hl-green[Port 53] पर कार्य करता है। सामान्य नेम रेजोल्यूशन क्वेरीज (< 512 बाइट्स) के लिए यह तेज #hl-green[UDP Port 53] का उपयोग करता है, जबकि ज़ोन ट्रांसफर और बड़े पैकेट्स के लिए विश्वसनीय #hl-yellow[TCP Port 53] का उपयोग करता है।
    ]
  ],
  [
    #warning-box(title: "SRV रिकॉर्ड्स का जीवन आधार")[
      जब कोई क्लाइंट डोमेन जॉइन या लॉगिन करता है, तो वह डोमेन कंट्रोलर का नाम नहीं जानता। वह DNS से विशेष #hl-orange[SRV रिकॉर्ड्स] मांगता है (`_ldap._tcp.dc._msdcs`)। यदि DNS में ये रिकॉर्ड्स न हों, तो डोमेन पूरी तरह ठप हो जाता है!
    ]
  ]
)

#v(4pt)

=== 9.2 DNS ज़ोन के प्रकार (Types of DNS Zones)
DNS में ज़ोन उस प्रशासनिक हिस्से (Database Partition) को कहते हैं जिसके लिए वह DNS सर्वर अधिकृत (Authoritative) होता है:

#align(center)[
  #block(
    stroke: 0.5pt + rgb("#64748B"),
    radius: 4pt,
    fill: rgb("#F8FAFC"),
    inset: 4pt,
    [
      #image("../02_BRAND_ASSETS/screenshots/dns_architecture_zones.png", width: 78%)
    ]
  )
  #text(size: 7.2pt, fill: rtech-muted, style: "italic")[चित्र 9.1: एंटरप्राइज DNS आर्किटेक्चर — फ़ॉरवर्ड/रिवर्स ज़ोन, रिसोर्स रिकॉर्ड्स एवं स्कैवेंजिंग लाइफसाइकिल]
]

#v(4pt)

1. #text(weight: "bold", fill: rtech-blue)[Active Directory-Integrated Zone (सर्वश्रेष्ठ एंटरप्राइज विकल्प):] यह ज़ोन किसी अलग फाइल में स्टोर होने के बजाय सीधे एक्टिव डायरेक्टरी डेटाबेस (`ntds.dit`) में स्टोर होता है। इसके 3 अद्वितीय फायदे हैं:
   - #hl-green[मल्टी-मास्टर रेप्लिकेशन:] किसी भी DC पर रिकॉर्ड बदलें, वह सभी DCs पर अपने आप सिंक हो जाता है।
   - #hl-green[सिक्योर डायनामिक अपडेट्स:] केवल डोमेन के अधिकृत कंप्यूटर्स ही अपना IP रिकॉर्ड रजिस्टर कर सकते हैं (हैकर नहीं)।
   - #hl-green[एनक्रिप्टेड रेप्लिकेशन:] संपूर्ण DNS डेटा #hl-orange[Kerberos] द्वारा एनक्रिप्ट होकर जाता है।
2. #text(weight: "bold", fill: rtech-navy)[Standard Primary Zone:] यह एक पारंपरिक टेक्स्ट फाइल (`zone.dns`) में स्टोर होता है। इसमें केवल प्राइमरी सर्वर ही रिकॉर्ड्स लिख सकता है (Single Master)।
3. #text(weight: "bold", fill: rtech-navy)[Standard Secondary Zone:] प्राइमरी ज़ोन की केवल रीड-ओनली (Read-Only) प्रतिलिपि। बैकअप और लोड डिस्ट्रीब्यूशन के लिए उपयोगी।
4. #text(weight: "bold", fill: rtech-muted)[Stub Zone:] इसमें केवल NS (Name Server), SOA (Start of Authority) और ग्लू A रिकॉर्ड्स होते हैं ताकि अन्य डोमेन के अधिकृत सर्वर्स को त्वरित खोजा जा सके।

#v(6pt)

=== 9.3 #hl-yellow[फ़ॉरवर्ड लुकअप ज़ोन] बनाम #hl-yellow[रिवर्स लुकअप ज़ोन]
- #text(weight: "bold", fill: rtech-navy)[फ़ॉरवर्ड लुकअप ज़ोन (#hl-yellow[Forward Lookup Zone]):] कंप्यूटर नाम को IP एड्रेस में बदलता है (Name -> IP)। जब आप ब्राउज़र में `srv-2025-dc01.corp.rtechlab.local` टाइप करते हैं, तो फ़ॉरवर्ड ज़ोन `192.168.1.10` लौटाता है।
- #text(weight: "bold", fill: rtech-navy)[रिवर्स लुकअप ज़ोन (#hl-yellow[Reverse Lookup Zone]):] IP एड्रेस को कंप्यूटर नाम में बदलता है (IP -> Name)। यह विशेष इन-एड्रेस आर्पा डोमेन का उपयोग करता है (उदा. `1.168.192.in-addr.arpa`)।
  - *रिवर्स ज़ोन क्यों अनिवार्य है?* #hl-orange[Kerberos] ऑथेंटिकेशन में SPN वैलिडेशन, मेल सर्वर्स में स्पैम ब्लॉक से बचना, और कमांड प्रॉम्प्ट में `nslookup 192.168.1.10` चलाकर होस्ट का सही नाम जानना।

#v(6pt)

=== 9.4 आवश्यक एंटरप्राइज DNS रिकॉर्ड्स (Resource Records)
DNS कंसोल (`dnsmgmt.msc`) में 5 सबसे महत्वपूर्ण रिकॉर्ड्स होते हैं:

1. #text(weight: "bold", fill: rtech-blue)[Host (A एवं AAAA रिकॉर्ड):] Hostname को IPv4 (A रिकॉर्ड) या IPv6 (AAAA रिकॉर्ड) पते से जोड़ता है। उदा. `srv-dc01` -> `192.168.1.10`।
2. #text(weight: "bold", fill: rtech-emerald)[Pointer (PTR रिकॉर्ड):] #hl-yellow[रिवर्स लुकअप ज़ोन] में IP को Hostname से जोड़ता है। उदा. `10` -> `srv-dc01.corp.rtechlab.local`।
3. #text(weight: "bold", fill: rtech-amber)[Alias (CNAME - Canonical Name):] एक कंप्यूटर के लिए दूसरा उपनाम बनाता है। उदा. कर्मचारी `portal.corp.rtechlab.local` खोलें तो वह CNAME द्वारा बैकएंड सर्वर `srv-2025-web01.corp.rtechlab.local` पर निर्देशित हो जाए।
4. #text(weight: "bold", fill: rtech-navy)[Mail Exchanger (MX रिकॉर्ड):] डोमेन के ईमेल सर्वर्स (Microsoft Exchange) का IP और उनकी प्राथमिकता (Priority/Preference नंबर) बताता है।
5. #text(weight: "bold", fill: rtech-rose)[Service Location (SRV रिकॉर्ड):] पूरे AD का रीढ़ की हड्डी। यह बताता है कि LDAP, #hl-orange[Kerberos], और Global Catalog जैसी सेवाएं किस पोर्ट और किस सर्वर पर चल रही हैं (उदा. `_ldap._tcp.dc._msdcs.corp.rtechlab.local` #hl-green[Port 389])।

#v(6pt)

=== 9.5 #hl-yellow[रूट हिंट्स] (Root Hints) बनाम DNS फ़ॉरवर्डर्स (Forwarders)
जब कोई कर्मचारी अपने ऑफिस लैपटॉप पर बाहरी वेबसाइट (जैसे `google.com`) खोलता है, तो हमारा आंतरिक DNS सर्वर उसे कैसे खोजता है?

- #text(weight: "bold", fill: rtech-navy)[रूट हिंट्स (Root Hints):] दुनिया में 13 वैश्विक लॉजिकल रूट सर्वर क्लस्टर्स हैं (`a.root-servers.net` से `m.root-servers.net`)। यदि कोई फॉरवर्ड न हो, तो हमारा सर्वर सीधे रूट से पूछना शुरू करता है (रूट -> .com TLD -> google.com)। यह धीमा होता है।
- #text(weight: "bold", fill: rtech-emerald)[DNS फ़ॉरवर्डर्स (Forwarders - Best Practice):] हम अपने स्थानीय DNS सर्वर को निर्देश देते हैं कि जो भी बाहरी डोमेन तुम्हें न पता हो, वह सीधे हमारे अपस्ट्रीम ISP या विश्वसनीय पब्लिक DNS सर्वर्स से पूछो:
  - Primary Forwarder: #hl-green[`1.1.1.1`] (Cloudflare)
  - Secondary Forwarder: #hl-green[`8.8.8.8`] (Google DNS)
  - *लाभ:* इंटरनेट ब्राउजिंग अत्यधिक तेज हो जाती है और बाहरी उत्तर लोकल कैश में स्टोर हो जाते हैं।

#v(6pt)

=== 9.6 स्टेल रिकॉर्ड्स हटाना: DNS एजिंग एवं स्कैवेंजिंग (Aging & Scavenging)
जब सैकड़ों लैपटॉप वाई-फाई से जुड़ते और डिस्कनेक्ट होते हैं, तो DNS डेटाबेस में हजारों पुराने और मृत रिकॉर्ड्स (Stale Records) जमा हो जाते हैं। इसे स्वचालित साफ करने के लिए #hl-yellow[Aging & Scavenging] सक्षम किया जाता है:

1. #text(weight: "bold")[No-refresh interval (डिफ़ॉल्ट 7 दिन):] इस अवधि के दौरान यदि क्लाइंट दोबारा वही IP रिफ्रेश करता है, तो DNS टाइमस्टैम्प को अपडेट नहीं करता (ताकि सर्वर का रेप्लिकेशन ट्रैफिक न बढ़े)।
2. #text(weight: "bold")[Refresh interval (डिफ़ॉल्ट 7 दिन):] इस अवधि में क्लाइंट टाइमस्टैम्प को रिफ्रेश कर सकता है।
3. #text(weight: "bold")[Scavenging Period (डिफ़ॉल्ट 7 दिन):] सर्वर एक स्वीपर की तरह सफाई चलाता है। यदि किसी रिकॉर्ड का टाइमस्टैम्प 14 दिनों (7 + 7 दिन) से पुराना है और रिफ्रेश नहीं हुआ, तो DNS उसे डेटाबेस से हमेशा के लिए डिलीट कर देता है!

#v(8pt)

// =============================================================================
// CHAPTER 09 ENDING PEDAGOGY: DID YOU KNOW, MCQS & INTERVIEW VAULT
// =============================================================================
#did-you-know[
  Windows Server 2025 में DNS में नेटिव #hl-yellow[DoH (DNS over HTTPS)] सपोर्ट शामिल किया गया है। इसका अर्थ है कि सर्वर से बाहर इंटरनेट पर जाने वाली सभी DNS क्वेरीज अब सादे टेक्स्ट (Cleartext UDP 53) में जाने के बजाय #hl-green[HTTPS (#hl-green[Port 443])] के जरिए पूरी तरह एनक्रिप्ट होकर जाती हैं, जिससे आईएसपी या हैकर कभी यह नहीं देख सकते कि कंपनी के अंदर कर्मचारी किन डोमेन्स को एक्सेस कर रहे हैं!
]

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[📝 अध्याय 09 अभ्यास बहुविकल्पीय प्रश्न (Practice MCQs)]
#v(3pt)

#mcq-item(
  num: "1",
  q: "एक्टिव डायरेक्टरी-इंटीग्रेटेड DNS ज़ोन (AD-Integrated Zone) का डेटाबेस किस फाइल में स्टोर होता है?",
  optA: "system32\\dns\\zone.dns फाइल में",
  optB: "एक्टिव डायरेक्टरी डेटाबेस ntds.dit के अंदर",
  optC: "Windows Registry में",
  optD: "SYSVOL शेयर्ड फोल्डर में",
  ans: "B",
  exp: "AD-Integrated ज़ोन सीधे ntds.dit में स्टोर होता है जिससे मल्टी-मास्टर रेप्लिकेशन और एनक्रिप्शन मिलता है।"
)

#v(3pt)

#mcq-item(
  num: "2",
  q: "#hl-yellow[रिवर्स लुकअप ज़ोन] में किसी IP पते को होस्टनेम में मैप करने वाले आधिकारिक रिकॉर्ड का क्या नाम है?",
  optA: "A Record",
  optB: "CNAME Record",
  optC: "PTR Record",
  optD: "MX Record",
  ans: "C",
  exp: "Pointer (PTR) रिकॉर्ड IP पते को संबंधित Hostname में बदलने का कार्य करता है।"
)

#v(3pt)

#mcq-item(
  num: "3",
  q: "एक्टिव डायरेक्टरी डोमेन कंट्रोलर, #hl-orange[Kerberos] और LDAP सेवाओं की खोज के लिए किस विशेष DNS रिकॉर्ड का उपयोग किया जाता है?",
  optA: "TXT Record",
  optB: "SRV (Service Location) Record",
  optC: "SOA Record",
  optD: "NS Record",
  ans: "B",
  exp: "SRV रिकॉर्ड्स (_ldap._tcp.dc._msdcs) के द्वारा ही क्लाइंट्स डोमेन कंट्रोलर के पोर्ट और आईपी खोजते हैं।"
)

#v(3pt)

#mcq-item(
  num: "4",
  q: "DNS सर्वर सामान्य नेम रेजोल्यूशन क्वेरी के लिए किस मानक पोर्ट और ट्रांसपोर्ट प्रोटोकॉल का उपयोग करता है?",
  optA: "TCP पोर्ट 80",
  optB: "UDP पोर्ट 53",
  optC: "TCP पोर्ट 445",
  optD: "UDP पोर्ट 67",
  ans: "B",
  exp: "मानक DNS क्वेरी UDP पोर्ट 53 पर होती है; बड़े ज़ोन ट्रांसफर TCP पोर्ट 53 पर होते हैं।"
)

#v(3pt)

#mcq-item(
  num: "5",
  q: "DNS डेटाबेस से पुराने और अप्रयुक्त (Stale) डायनामिक रिकॉर्ड्स को स्वचालित रूप से हटाने की प्रक्रिया को क्या कहा जाता है?",
  optA: "Zone Transfer",
  optB: "#hl-yellow[Aging and Scavenging]",
  optC: "DNS Forwarding",
  optD: "Dynamic Registration",
  ans: "B",
  exp: "Aging और Scavenging प्रक्रिया समय सीमा समाप्त होने पर अप्रयुक्त डायनामिक रिकॉर्ड्स को स्वतः हटा देती है।"
)

#v(6pt)

#text(size: 10.5pt, weight: "black", fill: rtech-navy)[🎯 टॉप MNC प्लेसमेंट इंटरव्यू प्रश्न (High-Yield Interview Vault)]
#v(3pt)

#interview-item(
  num: "1",
  q: "इंटरव्यूअर: 'एक्टिव डायरेक्टरी-इंटीग्रेटेड ज़ोन और स्टैंडर्ड प्राइमरी ज़ोन में सुरक्षा और रेप्लिकेशन के नजरिए से क्या मुख्य अंतर है?'",
  a: "उत्तर: स्टैंडर्ड प्राइमरी ज़ोन एक सिंगल-मास्टर मॉडल है जहाँ केवल प्राइमरी सर्वर पर रिकॉर्ड लिखे जा सकते हैं और सेकेंडरी सर्वर्स पर जाने वाला ज़ोन ट्रांसफर अन-एनक्रिप्टेड होता है। इसके विपरीत AD-Integrated ज़ोन में मल्टी-मास्टर रेप्लिकेशन होता है (किसी भी DC पर रिकॉर्ड लिखा जा सकता है), डेटा #hl-orange[Kerberos] एनक्रिप्टेड होकर AD रेप्लिकेशन के साथ जाता है, और यह 'Secure Dynamic Updates' का समर्थन करता है ताकि गैर-डोमेन मशीनें फर्जी रिकॉर्ड न बना सकें।",
  tip: "Wipro, Infosys और TCS के L2 SysAdmin इंटरव्यू में यह सबसे निर्णायक तुलनात्मक सवाल है।"
)

#v(3pt)

#interview-item(
  num: "2",
  q: "इंटरव्यूअर: 'DNS Forwarders और Root Hints में क्या अंतर होता है, और प्रोडक्शन में किसे प्राथमिकता दी जाती है?'",
  a: "उत्तर: Root Hints 13 वैश्विक मूल सर्वर्स से सीधे इटरेटिव क्वेरी करते हैं जो अत्यधिक धीमी होती है। Forwarders किसी विशिष्ट अपस्ट्रीम DNS (उदा. 1.1.1.1 या ISP DNS) को क्वेरी भेजते हैं जो पहले से कैश्ड रिस्पॉन्स तुरंत लौटा देता है। प्रोडक्शन में हमेशा DNS Forwarders को प्राथमिकता दी जाती है क्योंकि यह बैंडविड्थ बचाता है और इंटरनेट एक्सेस को बहुत तेज करता है।",
  tip: "यह उत्तर सिद्ध करता है कि आप नेटवर्क ट्रैफिक और लेटेंसी ऑप्टिमाइज़ेशन की गहरी समझ रखते हैं।"
)

#v(3pt)

#interview-item(
  num: "3",
  q: "इंटरव्यूअर: 'क्लाइंट मशीन पर 'nslookup' चलाने पर 'Default Server: Unknown' और IP एड्रेस 192.168.1.10 आ रहा है। इसे कैसे ठीक करेंगे?'",
  a: "उत्तर: 'Default Server: Unknown' आने का अर्थ है कि DNS सर्वर के पास अपने ही IP (192.168.1.10) के लिए '#hl-yellow[Reverse Lookup Zone]' में PTR रिकॉर्ड मौजूद नहीं है। इसे ठीक करने के लिए DNS कंसोल में 192.168.1.x सबनेट के लिए #hl-yellow[Reverse Lookup Zone] बनाएंगे और DC का PTR रिकॉर्ड जोड़ेंगे। उसके बाद nslookup तुरंत सर्वर का FQDN दिखाएगा।",
  tip: "L1/L2 हेल्पडेस्क ट्रबलशूटिंग का यह क्लासिक इंटरव्यू परिदृश्य है।"
)

#v(3pt)

#interview-item(
  num: "4",
  q: "इंटरव्यूअर: 'DNS Cache Poisoning क्या होती है और इससे कैसे बचा जाता है?'",
  a: "उत्तर: जब कोई अटैकर फर्जी DNS रिस्पॉन्स इंजेक्ट करके DNS सर्वर के कैश में किसी लोकप्रिय डोमेन (उदा. bank.com) को अपने दुर्भावनापूर्ण आईपी से मैप करवा देता है, तो इसे Cache Poisoning कहते हैं। इससे बचने के लिए विंडोज सर्वर में #hl-green[DNSSEC] (DNS Security Extensions) और Socket Pools सक्षम किए जाते हैं।",
  tip: "साइबर सुरक्षा और इंफ्रास्ट्रक्चर ऑडिट्स का यह पसंदीदा सवाल है।"
)

#v(3pt)

#interview-item(
  num: "5",
  q: "इंटरव्यूअर: 'DNS Scavenging को सक्षम करते समय किन दो जगहों पर सेटिंग्स ऑन करना अनिवार्य होता है?'",
  a: "उत्तर: Scavenging को दो स्तरों पर सक्षम करना अनिवार्य होता है: 1. ज़ोन स्तर पर (Zone Properties -> General -> Aging बटन -> 'Scavenge stale resource records' टिक करना), और 2. सर्वर स्तर पर (Server Properties -> Advanced -> 'Enable automatic scavenging of stale records' टिक करना)। यदि दोनों जगह टिक नहीं होगा, तो स्कैवेंजिंग कभी रन नहीं होगी।",
  tip: "यह सूक्ष्म व्यावहारिक ज्ञान इंटरव्यूअर को साबित करता है कि आपने वास्तव में लैब में इसे कॉन्फ़िगर किया है।"
)

#v(5pt)

#block(
  width: 100%,
  stroke: 0.5pt + rgb("#64748B"),
  fill: rgb("#F8FAFC"),
  radius: 4pt,
  inset: (x: 8pt, y: 6pt),
  [
    #text(size: 8.5pt, weight: "black", fill: rtech-navy)[🛠️ DNS कमांड-लाइन ट्रबलशूटिंग मास्टरकिट (Essential Commands):]\
    #v(3pt)
    #text(size: 7.5pt, fill: rtech-text)[
      - #text(weight: "bold", fill: rtech-blue)[`ipconfig /flushdns`]: क्लाइंट मशीन के स्थानीय DNS कैश को खाली करता है (ताकि बदला हुआ IP तुरंत दिखे)।
      - #text(weight: "bold", fill: rtech-emerald)[`ipconfig /registerdns`]: क्लाइंट के Host (A) और PTR रिकॉर्ड्स को DNS सर्वर पर दोबारा डायनामिकली रजिस्टर करता है।
      - #text(weight: "bold", fill: rtech-amber)[`nslookup -type=SRV _ldap._tcp.dc._msdcs.corp.rtechlab.local`]: यह पुष्टि करता है कि AD के SRV रिकॉर्ड्स सही काम कर रहे हैं।
      - #text(weight: "bold", fill: rtech-navy)[`dnscmd /clearcache`]: DNS सर्वर के पूरे इंटरनल रिजॉल्वर कैश को कमांड लाइन से खाली करता है।
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
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[✅ अध्याय 09 सत्यापन चेकलिस्ट (DNS Architecture Checklist):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - [ ] #hl-yellow[Forward Lookup Zone] `corp.rtechlab.local` एक्टिव डायरेक्टरी-इंटीग्रेटेड है।
      - [ ] #hl-yellow[Reverse Lookup Zone] `1.168.192.in-addr.arpa` में DC का PTR रिकॉर्ड मौजूद है।
      - [ ] बाहरी इंटरनेट समाधान के लिए Forwarders में `1.1.1.1` और `8.8.8.8` कॉन्फ़िगर हैं।
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
    #text(size: 8pt, weight: "bold", fill: rtech-blue)[💡 अध्याय 09 मुख्य कॉर्पोरेट निष्कर्ष (Corporate Takeaways):]\
    #text(size: 7.5pt, fill: rtech-text)[
      - DNS Active Directory का जीवन आधार है; SRV रिकॉर्ड्स डोमेन कंट्रोलर और Kerberos की पहचान कराते हैं।
      - प्रोडक्शन में हमेशा AD-Integrated ज़ोन और 1.1.1.1 / 8.8.8.8 पर आधारित DNS Forwarders का उपयोग करें।
      - स्टेल रिकॉर्ड्स को हटाने के लिए ज़ोन और सर्वर दोनों स्तरों पर Aging & Scavenging सक्षम करना अनिवार्य है।
    ]
  ]
)

#pagebreak()

