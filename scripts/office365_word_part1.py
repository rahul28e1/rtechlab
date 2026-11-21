#!/usr/bin/env python3
# =============================================================================
# RTechLab Office 365 Publishing Engine — Word Masterclass (Chapters 01 to 05)
# Covers: Architecture, Typography, Styles, Tables, Visual Graphics
# Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
# =============================================================================

import os

def generate_chapters(base_dir):
    eng_dir = os.path.join(base_dir, "English")
    hi_dir = os.path.join(base_dir, "Hindi")
    os.makedirs(eng_dir, exist_ok=True)
    os.makedirs(hi_dir, exist_ok=True)

    # =========================================================================
    # CHAPTER 01: Word Architecture, Workspace & File Backstage (3 Pages)
    # =========================================================================
    ch01_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 01]
= Word 365 Architecture, Workspace & File Backstage

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Microsoft Word 365 is the enterprise benchmark for corporate report authoring, legal contracts, executive documentation, and research publishing. Mastering its workspace layout, Backstage telemetry, and cloud storage mechanics forms the bedrock of professional computing literacy.
]

#v(2pt)

== 1.1 Enterprise Workspace Architecture & UI Anatomy

The Word 365 interface is organized into a hierarchy of contextual ribbons, toolbars, and canvas controls engineered for high-throughput business documentation:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*UI Element*], [*Enterprise Operational Scope*], [*Productivity Command / Shortcut*]),
  [Quick Access Toolbar (QAT)], [Persistent 1-click execution strip pinned above/below ribbon.], [Customizable (`Alt + 1`, `Alt + 2`, `Alt + 3`)],
  [Title Bar & Cloud State], [Displays file name, OneDrive sync status, version history & search.], [`Ctrl + F1` (Ribbon Display Toggle)],
  [The Fluent Ribbon], [10 Core tabs housing command groups organized by lifecycle.], [Press `Alt` to reveal letter-based KeyTips],
  [Document Canvas], [True WYSIWYG editing canvas mirroring exact paper geometry.], [`Ctrl + Wheel` (Dynamic Precision Zoom)],
  [Rulers & Gridlines], [Horizontal/vertical margin, indent, and tab stop alignment guides.], [`View > Show > Ruler` (`Alt + W + R`)],
  [Navigation Pane], [Hierarchical heading tree, thumbnail pages, and live regex search.], [`Ctrl + F` (Toggle Navigation Sidebar)],
  [Status Bar], [Real-time word count, language proofing, zoom slider, view modes.], [Right-click to customize telemetry badges]
)

#v(2pt)
#ribbon-specimen(path: "View > Show > Navigation Pane", command: "Headings Tree Navigation", shortcut: "Ctrl + F")
#v(2pt)

== 1.2 Backstage View (File Menu) Deep Dive

Clicking *File* transitions from canvas authoring to the Microsoft 365 Backstage management console. This console controls security, cloud storage, document hygiene, and export workflows:

- *Info & Inspect Document*: Detects hidden metadata, personal comments, tracked changes, and watermarks before external dispatch via `File > Info > Check for Issues > Inspect Document`.
- *Protect Document*: Restricts document access via enterprise password encryption, read-only permissions, digital signature attachment, or mandatory restrictive editing.
- *Version History*: When saved to OneDrive or SharePoint, Word records micro-versions every few minutes, enabling 1-click comparison and restoration of past revisions.
- *AutoSave Architecture*: Operates in real-time on cloud-stored `.docx` files, persisting keystrokes instantaneously without requiring manual `Ctrl + S` triggers.
- *Export Engines*: Direct compilation to PDF/XPS with selectable optimization (Standard for commercial printing vs. Minimum Size for web dispatch).

#concept-box(title: "CRITICAL ENTERPRISE PROTOCOL: METADATA INSPECTION", [
  Before emailing proposals or legal NDAs to external clients, always execute *Inspect Document*. Failing to remove hidden revisions or internal author comments has historically resulted in high-profile corporate contract leaks and confidentiality breaches.
])

#pagebreak()

== 1.3 Document View Modes & Productivity Environments

Word 365 provides 5 distinct rendering engines tailored to different phases of the document creation lifecycle:

#table(
  columns: (1fr, 2.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*View Mode*], [*Architectural Characteristics*], [*Best Enterprise Use Case*]),
  [Print Layout], [Default mode; displays exact headers, footers, margins, and page breaks.], [Final layout formatting, legal agreements, publishing preparation.],
  [Read Mode], [Hides ribbons; renders text in horizontal multi-column book layout.], [Reviewing long reports, reading on tablets or touch displays.],
  [Web Layout], [Renders as a fluid web page without page boundaries or margins.], [Drafting internal intranet articles, HTML knowledgebase docs.],
  [Outline View], [Displays hierarchical heading tree with promote/demote indent tools.], [Structuring 100+ page dissertations, whitepapers, book chapters.],
  [Draft View], [Strips margins, graphics, and headers for pure distraction-free typing.], [High-speed transcription, keyboard-centric content drafting.]
)

#v(2pt)

== 1.4 Immersive Reader & Modern Accessibility Tools

Under `View > Immersive Reader`, Word 365 unlocks cognitive accessibility features:
- *Column Width*: Adjusts text margins to Very Narrow, Narrow, Moderate, or Wide to optimize eye tracking.
- *Page Color*: Inverts canvas background to Sepia or Dark Inverse to reduce eye strain during extended night shifts.
- *Line Focus*: Restricts visibility to 1, 3, or 5 lines simultaneously, eliminating reading distractions.
- *Text Spacing & Syllables*: Increases character kerning and inserts break dots between linguistic syllables.
- *Read Aloud (`Ctrl + Alt + Space`)*: High-fidelity neural voice synthesis that highlights words in sync with vocal audio.

#v(2pt)
#ribbon-specimen(path: "View > Immersive Reader > Read Aloud", command: "Neural Text-to-Speech Engine", shortcut: "Ctrl + Alt + Space")
#v(2pt)

== 1.5 Word Options & Advanced System Configuration

The *Word Options* dialog (`File > Options` or `Alt + F + T`) controls deep engine parameters:
1. *General*: User name, Office Theme (Dark Gray, Black, White, Colorful), and Start screen behavior.
2. *Proofing*: AutoCorrect exceptions, spelling dictionaries, and grammar check strictness (formal vs. casual).
3. *Save*: Default local file save location, AutoRecover frequency interval (recommended: 3 minutes), and embed fonts format.
4. *Advanced*: Editing options, cut/copy/paste format matching rules, image compression defaults (220 ppi high-fidelity), and display units (inches vs. centimeters).

#pagebreak()

== 1.6 Production Workflow: Setting Up Corporate Standard Templates

When establishing document templates for corporate teams, follow this standardized 5-step commissioning protocol:

```
Step 1: Open fresh blank document (Ctrl + N)
Step 2: Define Standard Geometry -> Layout > Margins > Custom (Top: 1", Bottom: 1", Left: 1", Right: 1")
Step 3: Establish Default Typographic Hierarchy -> Home > Styles > Modify "Normal" to Aptos / 11pt / 1.15 line spacing
Step 4: Configure Document Properties -> File > Info > Properties > Add Company Name, Category & Author
Step 5: Export as Template -> File > Save As > Word Template (*.dotx) in Custom Office Templates directory
```

#v(2pt)

== 1.7 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Where is the AutoSave toggle located in Word 365?", ans: "Top-left corner of Title Bar; requires OneDrive/SharePoint storage.")
    #short-qa(num: 2, q: "Which key displays alphanumeric KeyTips across all ribbon tabs?", ans: "Pressing the Alt key.")
    #short-qa(num: 3, q: "Which tool eliminates hidden author metadata before external emailing?", ans: "File > Info > Inspect Document.")
    #short-qa(num: 4, q: "What is the recommended AutoRecover backup interval for mission-critical files?", ans: "3 minutes (configured in File > Options > Save).")
  ],
  [
    #mcq(num: 1, q: "Which file format preserves embedded Visual Basic (VBA) macros in Word?", a: ".docx", b: ".docm", c: ".dotx", d: ".docb", ans: "B", expl: ".docm specifically enables macros; .docx strips all executable code for security.")
    #mcq(num: 2, q: "Which view mode is optimized for rearranging major chapter structures?", a: "Print Layout", b: "Web Layout", c: "Outline View", d: "Draft View", ans: "C", expl: "Outline view provides promote/demote buttons for rapid structural reorganization.")
    #mcq(num: 3, q: "What keyboard shortcut activates the Read Aloud neural voice synthesis engine?", a: "Ctrl + Shift + S", b: "Ctrl + Alt + Space", c: "Alt + Shift + R", d: "F7", ans: "B", expl: "Ctrl + Alt + Space begins continuous text-to-speech reading from the cursor position.")
  ]
)

#v(2pt)

#spotlight-box("2027 CLOUD SYNCHRONIZATION ADVANCEMENTS", [
  Word 365 Enterprise utilizes differential delta sync: when modifying a 500-page document, only modified paragraph blocks are transmitted over the network rather than the entire 50MB file. This reduces bandwidth consumption by 94% and eliminates lock contention during multi-user co-authoring sessions.
])
"""

    ch01_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"))[भाग 1: माइक्रोसॉफ्ट वर्ड 365 एंटरप्राइज मास्टरक्लास · अध्याय 01]
= वर्ड 365 आर्किटेक्चर, वर्कस्पेस एवं फाइल बैकस्टेज

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  माइक्रोसॉफ्ट वर्ड 365 व्यावसायिक दस्तावेज निर्माण, कानूनी अनुबंध, शैक्षणिक शोध पत्र और कॉर्पोरेट रिपोर्ट्स तैयार करने का वैश्विक मानक है। इसके यूजर इंटरफेस और क्लाउड-सिंक्रनाइज़्ड फाइल सिस्टम को समझना आधुनिक कार्यस्थल की उत्पादकता हेतु अनिवार्य है।
]

#v(2pt)

== 1.1 ऑफिस 365 मॉडर्न इंटरफेस संरचना

वर्ड 365 के कमांड्स को एक बहुस्तरीय, प्रासंगिक ग्राफिकल ढांचे में व्यवस्थित किया गया है, जिससे 1,400 से अधिक फॉर्मेटिंग टूल्स तक त्वरित पहुंच सुनिश्चित होती है:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*UI घटक*], [*कार्यात्मक भूमिका एवं तकनीकी उपयोग*], [*एंटरप्राइज प्रोडक्टिविटी शॉर्टकट*]),
  [क्विक एक्सेस टूलबार (QAT)], [अक्सर उपयोग होने वाले कमांड्स (Save, Undo, Redo) की कस्टमाइजेबल स्ट्रिप।], [कस्टमाइजेबल (`Alt + 1`, `Alt + 2`, आदि)],
  [टाइटल बार व क्लाउड स्थिति], [फाइल का नाम, वनड्राइव सिंक स्थिति, वर्जन हिस्ट्री और कोपायलट AI आइकन दर्शाता है।], [`Ctrl + F1` (रिबन को छिपाना/दिखाना)],
  [द फ्लुएंट रिबन], [कमांड्स को तार्किक श्रेणियों (Home, Insert, Layout) और समूहों में विभाजित करता है।], [`Alt` की दबाकर KeyTips सक्रिय करें],
  [डॉक्यूमेंट कैनवास], [प्रिंट मार्जिन, पेज लेआउट और ग्रिड के अनुसार वास्तविक WYSIWYG कार्यक्षेत्र।], [`Ctrl + माउस व्हील` (डायनामिक ज़ूम)],
  [रूलर एवं ग्रिडलाइन्स], [मार्जिन, इंडेंट और टैब स्टॉप्स को सटीक सेट करने हेतु क्षैतिज व ऊर्ध्वाधर स्केल।], [`View > Show > Ruler` (`Alt + W + R`)],
  [नेविगेशन पेन], [दस्तावेज़ की हेडिंग हायरार्की, पेज थंबनेल और लाइव सर्च परिणाम प्रदर्शित करता है।], [`Ctrl + F` (नेविगेशन पेन टॉगल करें)],
  [स्टेटस बार], [पेज संख्या, शब्द गणना, स्पेलिंग जांच स्थिति और व्यू मोड्स प्रदर्शित करता है।], [राइट-क्लिक करके मेट्रिक्स कस्टमाइज़ करें]
)

#v(2pt)
#ribbon-specimen(path: "View > Show > Navigation Pane", command: "हेडिंग्स ट्री नेविगेशन", shortcut: "Ctrl + F")
#v(2pt)

== 1.2 बैकस्टेज व्यू (File Menu) का गहन विश्लेषण

*File* टैब पर क्लिक करने पर बैकस्टेज मैनेजमेंट कंसोल खुलता है, जो सुरक्षा, स्टोरेज, क्लीनअप और एक्सपोर्ट को नियंत्रित करता है:

- *Info एवं Inspect Document*: दस्तावेज भेजने से पहले छुपे हुए मेटाडाटा, टिप्पणियां, और ट्रैक चेंजेस को हटाता है।
- *Protect Document*: पासवर्ड एन्क्रिप्शन, रीड-ओनली एक्सेस, डिजिटल हस्ताक्षर अथवा संपादन प्रतिबंध लागू करता है।
- *Version History*: वनड्राइव/शेयरपॉइंट पर सहेजी गई फाइलों के प्रत्येक पिछले संपादन को देखने और रीस्टोर करने की सुविधा।
- *AutoSave आर्किटेक्चर*: क्लाउड फाइलों पर प्रत्येक अक्षर को रियल-टाइम में सहेजता है, जिससे `Ctrl + S` की आवश्यकता समाप्त होती है।
- *Export इंजन*: उच्च गुणवत्ता वाली कमर्शियल प्रिंटिंग अथवा हल्की वेब शेयरिंग हेतु डायरेक्ट PDF/XPS तैयार करना।

#concept-box(title: "महत्वपूर्ण कॉर्पोरेट प्रोटोकॉल: मेटाडाटा जांच (Inspect Document)", [
  किसी बाहरी क्लाइंट को प्रस्ताव या कानूनी अनुबंध ईमेल करने से पहले सदैव *Inspect Document* चलाएं। छिपी हुई टिप्पणियों या संशोधित डेटा को न हटाने से कई बार संवेदनशील कॉर्पोरेट डेटा लीक हो जाता है।
])

#pagebreak()

== 1.3 डॉक्यूमेंट व्यू मोड्स एवं उत्पादकता वातावरण

वर्ड 365 में विभिन्न प्रकार के कार्यों हेतु 5 विशिष्ट रेंडरिंग मोड्स प्रदान किए गए हैं:

#table(
  columns: (1fr, 2.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*व्यू मोड*], [*आर्किटेक्चरल विशेषताएं*], [*सर्वश्रेष्ठ कॉर्पोरेट उपयोग*]),
  [Print Layout], [डिफ़ॉल्ट मोड; वास्तविक हेडर, फुटर, मार्जिन और पेज ब्रेक दिखाता है।], [अंतिम दस्तावेज़ लेआउट, कानूनी अनुबंध, मुद्रण तैयारी।],
  [Read Mode], [रिबन को छुपाकर पाठ को पुस्तक के समान दोहरे कॉलम में प्रस्तुत करता है।], [लंबी रिपोर्ट्स पढ़ना, टैबलेट अथवा टच स्क्रीन पर समीक्षा करना।],
  [Web Layout], [पेज सीमाओं के बिना संपूर्ण विंडो में वेब पेज जैसा लेआउट बनाता है।], [इंट्रानेट आलेख, HTML नॉलेज-बेस दस्तावेज़ तैयार करना।],
  [Outline View], [हेडिंग हायरार्की को प्रमोट/डिमोट करने हेतु आउटलाइन टूल्स प्रदान करता है।], [100+ पेजों की किताबों, शोध पत्रों व थीसिस की संरचना बदलना।],
  [Draft View], [मार्जिन व ग्राफिक्स को हटाकर केवल शुद्ध टाइपिंग पर ध्यान केंद्रित कराता है।], [अत्यंत तीव्र गति से सामग्री टाइपिंग व ट्रांसक्रिप्शन कार्य।]
)

#v(2pt)

== 1.4 इमर्सिव रीडर एवं आधुनिक एक्सेसिबिलिटी टूल्स

`View > Immersive Reader` के अंतर्गत पढ़ने की क्षमता व एकाग्रता बढ़ाने वाले टूल्स उपलब्ध हैं:
- *कॉलम चौड़ाई (Column Width)*: पढ़ने की सुविधा अनुसार टेक्स्ट की चौड़ाई को Very Narrow, Narrow, Moderate या Wide में बदलना।
- *पेज कलर (Page Color)*: आंखों के तनाव को कम करने के लिए कैनवास को सीपिया (Sepia) अथवा डार्क इनवर्टेड बैकग्राउंड में बदलना।
- *लाइन फोकस (Line Focus)*: एक समय में केवल 1, 3 या 5 पंक्तियों को दृश्यमान रखकर अन्य सभी टेक्स्ट को डिम करना।
- *टेक्स्ट स्पेसिंग व शब्दांश*: अक्षरों के बीच की दूरी बढ़ाना और शब्दों के बीच शब्दांश ब्रेक डॉट्स जोड़ना।
- *रीड अलाउड (`Ctrl + Alt + Space`)*: न्यूरल AI वॉयस सिंथेसिस जो टेक्स्ट को बोलते समय शब्दों को हाईलाइट करता है।

#v(2pt)
#ribbon-specimen(path: "View > Immersive Reader > Read Aloud", command: "न्यूरल टेक्स्ट-टू-स्पीच इंजन", shortcut: "Ctrl + Alt + Space")
#v(2pt)

== 1.5 वर्ड ऑप्शन्स एवं एडवांस्ड सिस्टम कॉन्फ़िगरेशन

*Word Options* कंसोल (`File > Options` अथवा `Alt + F + T`) से आंतरिक सेटिंग्स नियंत्रित होती हैं:
1. *General*: यूजर नेम, ऑफिस थीम (Dark Gray, Black, White, Colorful) और स्टार्ट स्क्रीन व्यवहार।
2. *Proofing*: ऑटो-करेक्ट अपवाद, कस्टम डिक्शनरी, और व्याकरण जांच की कठोरता (औपचारिक बनाम अनौपचारिक)।
3. *Save*: डिफ़ॉल्ट लोकल सेव पाथ, ऑटो-रिकवर फ्रीक्वेंसी (अनुशंसित: 3 मिनट), और एम्बेडेड फॉन्ट्स सेटिंग।
4. *Advanced*: एडिटिंग ऑप्शन्स, पेस्ट फॉर्मेट मैचिंग रूल्स, इमेज कम्प्रेशन (220 ppi हाई-फिडेलिटी) व डिस्प्ले यूनिट्स।

#pagebreak()

== 1.6 प्रोडक्शन वर्कफ्लो: कॉर्पोरेट स्टैंडर्ड टेम्पलेट तैयार करना

कॉर्पोरेट टीमों के लिए मास्टर दस्तावेज़ टेम्पलेट बनाते समय इस 5-चरणीय मानक प्रोटोकॉल का पालन करें:

```
चरण 1: नया रिक्त दस्तावेज़ खोलें (Ctrl + N)
चरण 2: मानक मार्जिन तय करें -> Layout > Margins > Custom (चारों तरफ 1 इंच)
चरण 3: डिफ़ॉल्ट टाइपोग्राफी सेट करें -> Home > Styles > Modify "Normal" (Aptos, 11pt, 1.15 लाइन स्पेसिंग)
चरण 4: मेटाडाटा कॉन्फ़िगर करें -> File > Info > Properties > कंपनी नाम, श्रेणी एवं लेखक दर्ज करें
चरण 5: टेम्पलेट के रूप में सेव करें -> File > Save As > Word Template (*.dotx) रूप में सुरक्षित करें
```

#v(2pt)

== 1.7 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "वर्ड 365 में AutoSave बटन कहाँ स्थित होता है?", ans: "टाइटल बार के ऊपरी-बाएं कोने में; इसके लिए OneDrive/SharePoint अनिवार्य है।")
    #short-qa(num: 2, q: "रिबन के सभी टैब्स पर अक्षरात्मक KeyTips प्रदर्शित करने वाली की कौन सी है?", ans: "Alt की।")
    #short-qa(num: 3, q: "सार्वजनिक ईमेल भेजने से पूर्व छिपे हुए मेटाडाटा को कौन सा टूल हटाता है?", ans: "File > Info > Inspect Document।")
    #short-qa(num: 4, q: "अत्यंत महत्वपूर्ण फाइलों के लिए अनुशंसित ऑटो-रिकवर अंतराल क्या है?", ans: "3 मिनट (File > Options > Save में)।")
  ],
  [
    #mcq(num: 1, q: "वर्ड में एम्बेडेड VBA मैक्रोज़ को सुरक्षित रखने वाला फाइल फॉर्मेट कौन सा है?", a: ".docx", b: ".docm", c: ".dotx", d: ".docb", ans: "B", expl: ".docm मैक्रोज़ का समर्थन करता है; .docx सुरक्षा कारणों से निष्पादन योग्य कोड हटा देता है।")
    #mcq(num: 2, q: "बड़े अध्यायों की संरचना को पुनर्व्यवस्थित करने हेतु कौन सा व्यू सर्वोत्तम है?", a: "Print Layout", b: "Web Layout", c: "Outline View", d: "Draft View", ans: "C", expl: "Outline view हेडिंग्स को प्रमोट/डिमोट करने के लिए समर्पित टूल्स देता है।")
    #mcq(num: 3, q: "रीड अलाउड न्यूरल वॉयस इंजन सक्रिय करने का शॉर्टकट क्या है?", a: "Ctrl + Shift + S", b: "Ctrl + Alt + Space", c: "Alt + Shift + R", d: "F7", ans: "B", expl: "Ctrl + Alt + Space दबाते ही कर्सर स्थिति से टेक्स्ट-टू-स्पीच प्रारंभ हो जाती है।")
  ]
)

#v(2pt)

#spotlight-box("2027 क्लाउड सिंक्रनाइज़ेशन में प्रगति", [
  वर्ड 365 एंटरप्राइज डेल्टा-सिंक प्रोटोकॉल का उपयोग करता है: 500-पेज के दस्तावेज में केवल बदले गए पैराग्राफ क्लाउड पर ट्रांसमिट होते हैं, जिससे 94% डेटा की बचत होती है और मल्टी-यूज़र को-ऑथरिंग में फाइल लॉक नहीं होती।
])
"""

    with open(os.path.join(eng_dir, "chapter-01.typ"), "w", encoding="utf-8") as f:
        f.write(ch01_en)
    with open(os.path.join(hi_dir, "chapter-01.typ"), "w", encoding="utf-8") as f:
        f.write(ch01_hi)

    # =========================================================================
    # CHAPTER 02: Typography & Paragraph Mechanics (3 Pages)
    # =========================================================================
    ch02_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 02]
= Home Tab: Typography, Character Formatting & Paragraph Mechanics

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Precision typographic hierarchy and mathematical paragraph geometry differentiate amateur word processing from world-class corporate documentation. Mastering font pair metrics, kerning, line spacing ratios, and tab stop mechanics ensures visual authority in executive proposals.
]

#v(2pt)

== 2.1 The Modern Font Hierarchy & Enterprise Pairing

In Office 365, Microsoft introduced *Aptos* as the default sans-serif typeface, replacing Calibri. Enterprise typography relies on deliberate pairing between Heading (Display) and Body (Text) fonts:

#table(
  columns: (1.5fr, 1.5fr, 2.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Heading Typeface*], [*Body Typeface*], [*Psychological Tone & Corporate Industry*], [*Readability Metric*]),
  [Aptos Display], [Aptos], [Modern corporate, clean technical reports, SaaS documentation], [Optically optimized for 4K displays],
  [Segoe UI Semibold], [Segoe UI], [Engineering specifications, IT infrastructure manuals], [High legibility at 8pt-10pt sizes],
  [Georgia Bold], [Calibri], [Legal briefs, executive boardroom summaries, financial audits], [Strong serif/sans-serif visual contrast],
  [Consolas], [Aptos], [Technical developer guides, code documentation, CLI manuals], [Fixed-width monospace precision]
)

#v(2pt)
#ribbon-specimen(path: "Home > Font > Change Case", command: "Sentence / Lower / Upper / Capitalize Each Word", shortcut: "Shift + F3")
#v(2pt)

== 2.2 Character Formatting & Advanced Kerning Mechanics

The *Font Dialog* (`Ctrl + D` or `Ctrl + Shift + F`) exposes low-level typographic levers:
- *Strikethrough & Double Strikethrough*: Utilized in legal drafting to indicate deleted statutory contract clauses without obliterating historical text.
- *Superscript (`Ctrl + Shift + +`) & Subscript (`Ctrl + =`)*: Mandatory for scientific chemical notations (H₂O) and mathematical exponents (x² + y²).
- *Character Spacing (Advanced Tab)*: *Expanded* or *Condensed* tracking (in tenths of a point) to eliminate typographical widows and orphans at paragraph endings.
- *OpenType Features*: Ligatures (Standard, Contextual, Discretionary), Number Forms (Proportional Lining vs. Tabular Oldstyle for accounting data).

#concept-box(title: "KEYBOARD PRODUCTIVITY: SHIFT + F3 CASE CYCLING", [
  Highlight any selected sentence and press `Shift + F3` repeatedly. Word cycles dynamically through: (1) all lowercase, (2) ALL UPPERCASE, and (3) Capitalize Each Word (Title Case) without requiring manual retyping.
])

#pagebreak()

== 2.3 Paragraph Alignment, Geometry & Justification Dynamics

Paragraph geometry dictates the cognitive flow of text across printed columns:

#table(
  columns: (1fr, 1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Alignment*], [*Shortcut*], [*Mechanics & Visual Result*], [*Enterprise Context*]),
  [Align Left], [`Ctrl + L`], [Ragged right edge; uniform natural word spacing.], [Corporate emails, standard memos, technical specs.],
  [Center], [`Ctrl + E`], [Symmetric around horizontal page center.], [Cover page titles, certificates, formal invitations.],
  [Align Right], [`Ctrl + R`], [Ragged left edge; flush right margin.], [Sign-off signatures, invoice header dates, PO numbers.],
  [Justify], [`Ctrl + J`], [Aligns flush to both margins by expanding word spaces.], [Books, legal contracts, multi-column newspapers.]
)

#v(2pt)

== 2.4 Line Spacing & Paragraph Inset Mechanics

Amateur document authors repeatedly press the `Enter` key to create vertical separation between paragraphs. This corrupts pagination when opened on different screens.

*The Professional Protocol*:
1. Set *Line Spacing* to exactly `1.15` or `1.2` lines for optimal optical scanning velocity.
2. Configure *Spacing Before* to `0 pt` and *Spacing After* to `6 pt` or `8 pt` under `Home > Paragraph`.
3. To insert a soft line break without starting a new paragraph (preventing extra spacing), press `Shift + Enter`.
4. *Drop Cap*: Under `Insert > Text > Drop Cap`, format the opening letter of a major chapter to drop 3 lines into the text block for editorial magazine styling.

#v(2pt)
#ribbon-specimen(path: "Home > Paragraph > Line and Paragraph Spacing", command: "Line Spacing Options Dialog", shortcut: "Ctrl + 1 / Ctrl + 2 / Ctrl + 5")
#v(2pt)

== 2.5 Tab Stops & Precision Horizontal Alignment

Pressing the `Tab` key moves the cursor 0.5 inches by default. Professional forms, resumes, and price lists utilize custom tab stops configured on the horizontal ruler:
- *Left Tab (L)*: Text flows to the right from the tab stop position.
- *Center Tab (T-inverted)*: Text centers symmetrically beneath the stop marker.
- *Right Tab (Reverse-L)*: Text flows to the left, guaranteeing right-aligned numbers or dates.
- *Decimal Tab (Dot)*: Aligns numbers strictly on their decimal points, critical for financial currency tables.
- *Tab Leaders*: Generates dotted, dashed, or solid lines bridging column gaps (essential for menus and manual tables).

#pagebreak()

== 2.6 Bullets, Numbering & Enterprise Multilevel List Engineering

Simple bullet points fail when documenting multi-tier legal bylaws or technical policies. Word 365 features a robust *Multilevel List Engine*:

```
1. CORPORATE PROCUREMENT POLICY (Level 1: 18pt Bold, Space Before 12pt)
   1.1 Capital Expenditure Authorization (Level 2: 14pt SemiBold, Indent 0.25")
       1.1.1 Purchases Exceeding \$50,000 (Level 3: 11pt Regular, Indent 0.5")
             (a) Mandatory 3-Vendor RFP competitive bidding
             (b) Chief Financial Officer sign-off required
```

*Steps to Link Multilevel Lists to Heading Styles*:
1. Click `Home > Paragraph > Multilevel List > Define New Multilevel List`.
2. Click *More* in the bottom-left corner to expand deep configuration levers.
3. Select *Level 1*, click *Link level to style*, and choose `Heading 1`.
4. Select *Level 2*, link to `Heading 2`, and check *Include level number from Level 1*.
5. Select *Level 3*, link to `Heading 3`. Now, applying headings automatically generates perfect decimal numbering throughout the 100+ page document!

#v(2pt)

== 2.7 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which shortcut dynamically cycles text through lowercase, uppercase, and title case?", ans: "Shift + F3.")
    #short-qa(num: 2, q: "What is the key difference between pressing Enter vs Shift+Enter?", ans: "Enter creates a new paragraph; Shift+Enter inserts a soft line break within the same paragraph.")
    #short-qa(num: 3, q: "Which tab stop type guarantees currency amounts align strictly along the decimal point?", ans: "Decimal Tab.")
    #short-qa(num: 4, q: "What replaced Calibri as the default sans-serif font family in Microsoft 365?", ans: "Aptos.")
  ],
  [
    #mcq(num: 1, q: "What is the shortcut to apply 1.5 line spacing to the selected paragraph?", a: "Ctrl + 1", b: "Ctrl + 2", c: "Ctrl + 5", d: "Ctrl + Shift + L", ans: "C", expl: "Ctrl + 1 is single space, Ctrl + 2 is double space, Ctrl + 5 applies 1.5 lines.")
    #mcq(num: 2, q: "Which typographic feature automatically drops the first character of a paragraph across multiple lines?", a: "WordArt", b: "Drop Cap", c: "SmartArt", d: "Superscript", ans: "B", expl: "Drop Cap (Insert > Text > Drop Cap) creates editorial magazine-style opening letters.")
    #mcq(num: 3, q: "What is the standard enterprise method to create vertical distance between paragraphs?", a: "Pressing Enter twice", b: "Adjusting 'Spacing After' in Paragraph settings", c: "Inserting a blank table", d: "Increasing top margin", ans: "B", expl: "Adjusting Spacing After (e.g., 6pt or 8pt) guarantees consistent pagination.")
  ]
)

#v(2pt)

#spotlight-box("2027 VARIABLE OPEN-TYPE TYPOGRAPHY IN WORD 365", [
  Word 365 now fully supports Variable OpenType Fonts (such as Aptos Variable). Instead of discrete weights (Regular, Bold), designers can dial in continuous weight axes (from 100 Hairline to 900 Ultra-Black) and optical width axes, allowing micro-typography adjustments that perfectly fill column headers without text clipping.
])
"""

    ch02_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"))[भाग 1: माइक्रोसॉफ्ट वर्ड 365 एंटरप्राइज मास्टरक्लास · अध्याय 02]
= होम टैब: टाइपोग्राफी, कैरेक्टर फॉर्मेटिंग एवं पैराग्राफ मैकेनिक्स

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  सटीक टाइपोग्राफिक हायरार्की और गणितीय पैराग्राफ लेआउट सामान्य वर्ड प्रोसेसिंग को विश्वस्तरीय कॉर्पोरेट दस्तावेज़ों से अलग करते हैं। फॉन्ट पेयरिंग, कर्निंग, लाइन स्पेसिंग अनुपात और टैब स्टॉप्स की कार्यप्रणाली में महारत हासिल करना आधुनिक व्यावसायिक प्रस्तावों के लिए अनिवार्य है।
]

#v(2pt)

== 2.1 आधुनिक फॉन्ट हायरार्की एवं एंटरप्राइज पेयरिंग

ऑफिस 365 में माइक्रोसॉफ्ट ने कैलीबरी (Calibri) के स्थान पर *Aptos* को डिफ़ॉल्ट सैंस-सेरिफ़ टाइपफेस बनाया है। कॉर्पोरेट टाइपोग्राफी हेडिंग (Display) और बॉडी (Text) फॉन्ट्स के संतुलित समन्वय पर निर्भर करती है:

#table(
  columns: (1.5fr, 1.5fr, 2.5fr, 1.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*हेडिंग टाइपफेस*], [*बॉडी टाइपफेस*], [*कॉर्पोरेट प्रभाव एवं उद्योग*], [*पठनीयता विशेषता*]),
  [Aptos Display], [Aptos], [आधुनिक कॉर्पोरेट, तकनीकी रिपोर्ट्स, SaaS दस्तावेज़], [4K स्क्रीन हेतु ऑप्टिकली अनुकूलित],
  [Segoe UI Semibold], [Segoe UI], [इंजीनियरिंग स्पेसिफिकेशन्स, IT मैनुअल्स], [8pt-10pt पर अत्यंत स्पष्ट पठनीयता],
  [Georgia Bold], [Calibri], [कानूनी अनुबंध, वित्तीय ऑडिट, बोर्डरूम रिपोर्ट्स], [सेरिफ़ व सैंस-सेरिफ़ का उत्तम कंट्रास्ट],
  [Consolas], [Aptos], [सॉफ्टवेयर डेवलपर्स गाइड, कोड डॉक्यूमेंटेशन, CLI], [फिक्स्ड-विड्थ मोनोस्पेस शुद्धता]
)

#v(2pt)
#ribbon-specimen(path: "Home > Font > Change Case", command: "Sentence / Lower / Upper / Capitalize Each Word", shortcut: "Shift + F3")
#v(2pt)

== 2.2 कैरेक्टर फॉर्मेटिंग एवं एडवांस्ड कर्निंग मैकेनिक्स

*Font Dialog Box* (`Ctrl + D` अथवा `Ctrl + Shift + F`) से सूक्ष्म टाइपोग्राफिक सेटिंग्स नियंत्रित होती हैं:
- *Strikethrough एवं Double Strikethrough*: कानूनी प्रारूपण में निरस्त धाराओं को हटाने के बजाय क्रॉस लाइन से दर्शाना ताकि ऐतिहासिक संदर्भ सुरक्षित रहे।
- *Superscript (`Ctrl + Shift + +`) व Subscript (`Ctrl + =`)*: वैज्ञानिक रासायनिक सूत्रों (H₂O) एवं गणितीय घातों (x² + y²) हेतु अनिवार्य।
- *कैरेक्टर स्पेसिंग (Advanced Tab)*: *Expanded* अथवा *Condensed* स्पेसिंग द्वारा पैराग्राफ के अंत में अकेली लटकी पंक्तियों (Widows/Orphans) को समाप्त करना।
- *OpenType विशेषताएं*: लिगेचर्स (Ligatures) एवं टेबलर नंबर फॉर्मेट्स (Tabular Lining) जो अकाउंटिंग डेटा को बिल्कुल एक सीध में दर्शाते हैं।

#concept-box(title: "कीबोर्ड प्रोडक्टिविटी: SHIFT + F3 केस चक्रण", [
  चयनित टेक्स्ट पर `Shift + F3` बार-बार दबाने पर वर्ड स्वतः तीन रूपों में बदलता है: (1) सभी छोटे अक्षर (lowercase), (2) सभी बड़े अक्षर (UPPERCASE), और (3) प्रत्येक शब्द का पहला अक्षर बड़ा (Title Case)।
])

#pagebreak()

== 2.3 पैराग्राफ अलाइनमेंट एवं जस्टिफिकेशन डायनामिक्स

पैराग्राफ अलाइनमेंट दस्तावेज़ के दृश्य प्रवाह और औपचारिकता को निर्धारित करता है:

#table(
  columns: (1fr, 1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*अलाइनमेंट*], [*शॉर्टकट*], [*मैकेनिक्स एवं दृश्य परिणाम*], [*कॉर्पोरेट उपयोग*]),
  [Align Left], [`Ctrl + L`], [बाईं ओर सीधी रेखा; दाईं ओर प्राकृतिक असमान छोर।], [ईमेल्स, मानक मेमो, तकनीकी विवरण।],
  [Center], [`Ctrl + E`], [क्षैतिज रूप से पेज के केंद्र में संतुलित।], [कवर पेज शीर्षक, प्रमाण पत्र, निमंत्रण।],
  [Align Right], [`Ctrl + R`], [दाईं ओर सीधी रेखा; बाईं ओर असमान छोर।], [हस्ताक्षर ब्लॉक, इनवॉइस दिनांक, कोटेशन।],
  [Justify], [`Ctrl + J`], [शब्दों के बीच सूक्ष्म दूरी बढ़ाकर दोनों किनारों को सीधा करना।], [पुस्तके, कानूनी अनुबंध, समाचार पत्र।]
)

#v(2pt)

== 2.4 लाइन स्पेसिंग एवं पैराग्राफ अंतराल मैकेनिक्स

अनुभवहीन उपयोगकर्ता पैराग्राफ के बीच दूरी बनाने के लिए बार-बार `Enter` दबाते हैं, जिससे लेआउट बिगड़ जाता है।

*पेशेवर मानक प्रक्रिया*:
1. तीव्र और सहज पठनीयता हेतु *Line Spacing* को सदैव `1.15` अथवा `1.2` पर सेट करें।
2. `Home > Paragraph` में जाकर *Spacing Before* को `0 pt` तथा *Spacing After* को `6 pt` अथवा `8 pt` रखें।
3. बिना नया पैराग्राफ बनाए केवल पंक्ति बदलने हेतु सॉफ्ट लाइन ब्रेक (`Shift + Enter`) का उपयोग करें।
4. *Drop Cap*: अध्याय के पहले अक्षर को आकर्षक बनाने हेतु `Insert > Text > Drop Cap` से पहले अक्षर को 3 पंक्तियों जितना बड़ा बनाएं।

#v(2pt)
#ribbon-specimen(path: "Home > Paragraph > Line and Paragraph Spacing", command: "लाइन स्पेसिंग ऑप्शन्स डायलॉग", shortcut: "Ctrl + 1 / Ctrl + 2 / Ctrl + 5")
#v(2pt)

== 2.5 टैब स्टॉप्स एवं क्षैतिज अलाइनमेंट

डिफ़ॉल्ट रूप से `Tab` की दबाने पर कर्सर 0.5 इंच आगे बढ़ता है। पेशेवर फॉर्म्स और सूचियों में रूलर पर कस्टम टैब स्टॉप्स सेट किए जाते हैं:
- *Left Tab (L)*: टैब स्टॉप की स्थिति से टेक्स्ट दाईं ओर आगे बढ़ता है।
- *Center Tab (उल्टा-T)*: टेक्स्ट टैब मार्कर के दोनों ओर समान रूप से फैलता है।
- *Right Tab (उल्टा-L)*: टेक्स्ट बाईं ओर बढ़ता है, जिससे संख्याएं अथवा तिथियां दाईं ओर एक सीध में आती हैं।
- *Decimal Tab (दशमलव-डॉट)*: संख्याओं को दशमलव बिंदु (Decimal) पर बिल्कुल सीधा रखता है (वित्तीय टेबल्स हेतु सर्वोत्तम)।
- *Tab Leaders*: कॉलमों के बीच रिक्त स्थान को डॉटेड (....) अथवा डैश (----) रेखा से भरना।

#pagebreak()

== 2.6 बुलेट्स, नंबरिंग एवं एंटरप्राइज मल्टीलेवल लिस्ट इंजीनियरिंग

कॉर्पोरेट नीतियों अथवा कानूनी उप-नियमों के दस्तावेजीकरण हेतु वर्ड 365 का *Multilevel List Engine* अत्यंत शक्तिशाली है:

```
1. कॉर्पोरेट प्रोक्योरमेंट नीति (Level 1: 18pt Bold, Space Before 12pt)
   1.1 पूंजीगत व्यय प्राधिकरण (Level 2: 14pt SemiBold, Indent 0.25")
       1.1.1 \$50,000 से अधिक की खरीद (Level 3: 11pt Regular, Indent 0.5")
             (क) न्यूनतम 3 विक्रेताओं से कोटेशन अनिवार्य
             (ख) मुख्य वित्तीय अधिकारी (CFO) का अनुमोदन आवश्यक
```

*मल्टीलेवल लिस्ट को हेडिंग स्टाइल्स से लिंक करने के चरण*:
1. `Home > Paragraph > Multilevel List > Define New Multilevel List` पर क्लिक करें।
2. नीचे बाएं कोने में *More* पर क्लिक करके विस्तृत सेटिंग्स खोलें।
3. *Level 1* चुनें, *Link level to style* में जाकर `Heading 1` का चयन करें।
4. *Level 2* चुनें, उसे `Heading 2` से लिंक करें और *Include level number from Level 1* चेक करें।
5. *Level 3* को `Heading 3` से लिंक करें। अब हेडिंग चुनते ही पूरे 100+ पेज के दस्तावेज़ में स्वचालित रूप से दशमलव नंबरिंग (1.1, 1.1.1) लागू होगी!

#v(2pt)

== 2.7 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "चयनित टेक्स्ट के केस (अपर/लोअर/टाइटल) को बारी-बारी बदलने का शॉर्टकट क्या है?", ans: "Shift + F3.")
    #short-qa(num: 2, q: "Enter और Shift+Enter में क्या मौलिक अंतर है?", ans: "Enter नया पैराग्राफ बनाता है; Shift+Enter उसी पैराग्राफ में सॉफ्ट लाइन ब्रेक देता है।")
    #short-qa(num: 3, q: "मुद्रा मानों को दशमलव बिंदु की सीध में रखने वाला टैब स्टॉप कौन सा है?", ans: "Decimal Tab.")
    #short-qa(num: 4, q: "माइक्रोसॉफ्ट 365 में कैलीबरी के स्थान पर नया डिफ़ॉल्ट फॉन्ट कौन सा है?", ans: "Aptos.")
  ],
  [
    #mcq(num: 1, q: "चयनित पैराग्राफ में 1.5 लाइन स्पेसिंग लागू करने का शॉर्टकट क्या है?", a: "Ctrl + 1", b: "Ctrl + 2", c: "Ctrl + 5", d: "Ctrl + Shift + L", ans: "C", expl: "Ctrl + 1 सिंगल स्पेस, Ctrl + 2 डबल स्पेस और Ctrl + 5 से 1.5 लाइन स्पेसिंग लागू होती है।")
    #mcq(num: 2, q: "पैराग्राफ के पहले अक्षर को कई पंक्तियों जितना बड़ा बनाने वाला फीचर कौन सा है?", a: "WordArt", b: "Drop Cap", c: "SmartArt", d: "Superscript", ans: "B", expl: "Drop Cap (Insert > Text > Drop Cap) पत्रिका शैली का बड़ा शुरुआती अक्षर बनाता है।")
    #mcq(num: 3, q: "पैराग्राफों के बीच दूरी बनाने का मानक पेशेवर तरीका क्या है?", a: "बार-बार Enter दबाना", b: "Paragraph सेटिंग्स में Spacing After बढ़ाना", c: "खाली टेबल डालना", d: "मार्जिन बढ़ाना", ans: "B", expl: "Spacing After (6pt/8pt) सेट करने से सभी पेजों पर एक समान दूरी बनी रहती है।")
  ]
)

#v(2pt)

#spotlight-box("2027 वेरिएबल ओपन-टाइप टाइपोग्राफी", [
  वर्ड 365 अब वेरिएबल फॉन्ट्स (जैसे Aptos Variable) का पूर्ण समर्थन करता है। निश्चित भार (Regular/Bold) के बजाय उपयोगकर्ता 100 से 900 तक निरंतर फॉन्ट वेट और अक्षरों की चौड़ाई को सूक्ष्मता से समायोजित कर सकते हैं।
])
"""

    with open(os.path.join(eng_dir, "chapter-02.typ"), "w", encoding="utf-8") as f:
        f.write(ch02_en)
    with open(os.path.join(hi_dir, "chapter-02.typ"), "w", encoding="utf-8") as f:
        f.write(ch02_hi)

    # =========================================================================
    # CHAPTER 03: Heading Styles, Style Sets & Regex Wildcards (3 Pages)
    # =========================================================================
    ch03_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 03]
= Home Tab: Heading Styles, Style Sets & Advanced Wildcard Search Engine

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Styles are the programmatic skeleton of professional Word authoring. Relying on manual ad-hoc formatting destroys document structure. Utilizing semantic styles guarantees automated Table of Contents generation, Navigation Pane collapse/expand hierarchies, and instantaneous corporate re-theming.
]

#v(2pt)

== 3.1 The Semantic Styles Architecture

Word 365 categorizes styles into 5 programmatic types, each controlling distinct formatting scopes:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Style Type*], [*Scope of Application & Behavior*], [*Built-in System Examples*]),
  [Paragraph Style], [Controls font, line spacing, indents, borders, and tabs for full blocks.], [`Normal`, `Heading 1`, `Heading 2`, `List Bullet`],
  [Character Style], [Applies formatting to highlighted words without altering paragraph flow.], [`Strong`, `Emphasis`, `Subtle Reference`, `Book Title`],
  [Linked Style (¶/a)], [Acts as paragraph style when cursor rests; acts as character style on selection.], [`Heading 1` through `Heading 9`, `Intense Quote`],
  [Table Style], [Defines header row fills, alternating zebra striping, and grid borders.], [`Grid Table 4 - Accent 1`, `Plain Table 1`],
  [List Style], [Standardizes alignment, numbering formats, and indents for list tiers.], [`1 / 1.1 / 1.1.1`, `Bullet - Circle - Square`]
)

#v(2pt)
#ribbon-specimen(path: "Home > Styles > Heading 1 / Heading 2", command: "Apply Structural Semantic Heading", shortcut: "Ctrl + Alt + 1 / Ctrl + Alt + 2")
#v(2pt)

== 3.2 Modifying & Customizing Enterprise Styles

Never manually format 50 individual headings across a 100-page report. Instead, modify the underlying style definition:

1. Right-click the target style card in `Home > Styles` (e.g., *Heading 1*) and select *Modify*.
2. *Formatting Grid*: Adjust font family (`Aptos Display`), size (`18 pt`), color (`#0F172A` Navy), and weight (`Bold`).
3. *Format Dropdown (Bottom Left)*:
   - *Paragraph*: Set *Keep with next* (mandatory to prevent orphan headings at the bottom of pages) and *Page break before*.
   - *Border*: Apply a subtle horizontal bottom rule to demarcate major chapters.
4. *Scope Toggle*: Select *Only in this document* for isolated proposals, or *New documents based on this template* to establish company-wide corporate standards.

#concept-box(title: "CRITICAL LAYOUT PROTOCOL: 'KEEP WITH NEXT'", [
  Always enable `Keep with next` under `Paragraph > Line and Page Breaks` inside all Heading styles. This instructs Word's pagination engine never to leave a heading stranded alone at the bottom of a page while its first body paragraph spills onto the next.
])

#pagebreak()

== 3.3 Style Sets, Design Themes & Global Re-Skinning

The *Style Sets* engine (`Design > Document Formatting`) decouples semantic structure from visual presentation. Once a document is strictly tagged with `Heading 1`, `Heading 2`, `Title`, and `Normal`:

- Switching from *Formal* to *Modern* or *Centred* instantaneously recalculates font pairings, accent rules, and margin geometries across all 100+ pages in under 1 second.
- *Color Palettes*: Modifying the active palette (`Design > Colors`) swaps primary and secondary brand accents dynamically across shapes, table borders, and headings without manual recoloring.
- *Format Painter (`Ctrl + Shift + C` / `Ctrl + Shift + V`)*:
  - Single-click: Copies formatting of selected text and applies it to the next clicked word.
  - Double-click: Locks the painter active, allowing continuous sequential application across dozens of dislocated paragraphs until pressing `Esc`.

#v(2pt)
#ribbon-specimen(path: "Home > Clipboard > Format Painter", command: "Copy & Paste Visual Formatting", shortcut: "Ctrl + Shift + C / Ctrl + Shift + V")
#v(2pt)

== 3.4 Advanced Find & Replace with Regular Expression Wildcards

While basic search (`Ctrl + F`) locates words, enterprise data sanitization relies on the *Advanced Find and Replace Engine* (`Ctrl + H`) with the *Use wildcards* flag enabled:

#table(
  columns: (1fr, 1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Wildcard*], [*Syntax Pattern*], [*Matching Scope & Behavior*], [*Enterprise Data Clean Example*]),
  [Any Character], [`?`], [Matches exactly one single character.], [`c?t` matches cat, cot, cut],
  [String Range], [`*`], [Matches any string of characters.], [`comp*r` matches computer, compiler],
  [Word Boundary], [`<` and `>`], [Enforces strict beginning or ending of word.], [`<in>` matches in, but not inside or tin],
  [Character Set], [`[a-z]`], [Matches any single character within specified range.], [`[0-9]` matches any single digit],
  [Count Qualifier], [`{n,m}`], [Matches between n and m occurrences of prior token.], [`[0-9]{10}` matches 10-digit mobile numbers],
  [Tagged Group], [`( )` and `\1`], [Groups tokens for back-reference rearrangement.], [Swap First/Last Name: `(<*>) (<*>)` -> `\2, \1`]
)

#pagebreak()

== 3.5 Production Workflow: Cleaning Messy Pasted Text

When pasting unformatted raw text from web portals or OCR scans into Word, clean it systematically using these 4 wildcard replacement passes:

```
Pass 1: Eliminate Double/Triple Blank Lines
Find: ^p^p+ (or ^13^13)  --> Replace: ^p

Pass 2: Eradicate Multiple Trailing Spaces
Find: [ ]{2,}           --> Replace: [Single Space]

Pass 3: Standardize Indian Mobile Numbers (+91-XXXXX-XXXXX)
Find: ([0-9]{5})([0-9]{5}) --> Replace: \1-\2

Pass 4: Strip Trailing Manual Line Breaks
Find: ^l                --> Replace: ^p
```

#v(2pt)

== 3.6 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which shortcut applies the Heading 1 style to the active paragraph?", ans: "Ctrl + Alt + 1.")
    #short-qa(num: 2, q: "How do you lock the Format Painter tool for multiple continuous applications?", ans: "Double-click the Format Painter icon.")
    #short-qa(num: 3, q: "Which paragraph pagination setting prevents a heading from separating from its text?", ans: "'Keep with next' (in Paragraph > Line and Page Breaks).")
    #short-qa(num: 4, q: "In wildcard search, which pattern matches exactly 10 consecutive numeric digits?", ans: "[0-9]{10}.")
  ],
  [
    #mcq(num: 1, q: "What is the shortcut to copy text formatting only (without copying text content)?", a: "Ctrl + C", b: "Ctrl + Shift + C", c: "Alt + C", d: "Shift + F3", ans: "B", expl: "Ctrl + Shift + C copies formatting; Ctrl + Shift + V pastes formatting.")
    #mcq(num: 2, q: "In Word wildcard find/replace, what does the expression (<*>) (<*>) with replace \\2, \\1 accomplish?", a: "Deletes all words", b: "Swaps First Name and Last Name order", c: "Capitalizes the words", d: "Inserts a footnote", ans: "B", expl: "Parentheses tag tokens into groups; \\2, \\1 reorders the second word before the first.")
    #mcq(num: 3, q: "What is the primary architectural benefit of using semantic Heading styles?", a: "Makes text bold", b: "Enables automated Table of Contents and Navigation Pane tree", c: "Reduces file size", d: "Prevents printing", ans: "B", expl: "Styles provide the programmatic metadata required for TOC generation and structural navigation.")
  ]
)

#v(2pt)

#spotlight-box("2027 AI-POWERED STYLE HOMOGENIZATION", [
  Word 365 Enterprise integrates automated semantic style harmonization. When combining contributions from 10 different co-authors, Copilot detects rogue manual formatting (e.g., 14pt Arial bold text masquerading as a heading) and converts them into standardized corporate Heading styles with a single click.
])
"""

    ch03_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"))[भाग 1: माइक्रोसॉफ्ट वर्ड 365 एंटरप्राइज मास्टरक्लास · अध्याय 03]
= होम टैब: हेडिंग स्टाइल्स, स्टाइल सेट्स एवं एडवांस्ड वाइल्डकार्ड सर्च इंजन

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  स्टाइल्स पेशेवर वर्ड डॉक्यूमेंटेशन का प्रोग्रामेटिक ढांचा हैं। बिना स्टाइल्स के मैन्युअल फॉर्मेटिंग करने से दस्तावेज़ की संरचना खंडित हो जाती है। हेडिंग स्टाइल्स का उपयोग करने से ऑटोमैटिक टेबल ऑफ कंटेंट्स (TOC), नेविगेशन पेन हायरार्की और क्षण भर में कॉर्पोरेट री-थीमिंग संभव होती है।
]

#v(2pt)

== 3.1 सेमांटिक स्टाइल्स आर्किटेक्चर

वर्ड 365 में स्टाइल्स को 5 प्रोग्रामेटिक श्रेणियों में विभाजित किया गया है:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*स्टाइल प्रकार*], [*लागू होने का दायरा एवं व्यवहार*], [*सिस्टम में निर्मित प्रमुख उदाहरण*]),
  [Paragraph Style], [पूरे पैराग्राफ के फॉन्ट, लाइन स्पेसिंग, इंडेंट और बॉर्डर को नियंत्रित करता है।], [`Normal`, `Heading 1`, `Heading 2`, `List Bullet`],
  [Character Style], [पैराग्राफ बदले बिना केवल चयनित शब्दों पर फॉर्मेटिंग लागू करता है।], [`Strong`, `Emphasis`, `Subtle Reference`, `Book Title`],
  [Linked Style (¶/a)], [कर्सर होने पर पैराग्राफ और चयन होने पर कैरेक्टर स्टाइल के रूप में कार्य करता है।], [`Heading 1` से `Heading 9`, `Intense Quote`],
  [Table Style], [हेडर रो बैकग्राउंड, एकांतर ज़ेबरा स्ट्रिपिंग और ग्रिड बॉर्डर्स तय करता है।], [`Grid Table 4 - Accent 1`, `Plain Table 1`],
  [List Style], [मल्टीलेवल सूचियों के विभिन्न स्तरों की नंबरिंग व इंडेंटेशन निर्धारित करता है।], [`1 / 1.1 / 1.1.1`, `Bullet - Circle - Square`]
)

#v(2pt)
#ribbon-specimen(path: "Home > Styles > Heading 1 / Heading 2", command: "स्ट्रक्चरल सेमांटिक हेडिंग लागू करें", shortcut: "Ctrl + Alt + 1 / Ctrl + Alt + 2")
#v(2pt)

== 3.2 कॉर्पोरेट स्टाइल्स को कस्टमाइज़ करना

100-पेज की रिपोर्ट में 50 अलग-अलग हेडिंग्स को मैन्युअल रूप से कभी फॉर्मेट न करें। इसके बजाय मूल स्टाइल को संशोधित करें:

1. `Home > Styles` में लक्षित स्टाइल (जैसे *Heading 1*) पर राइट-क्लिक करें और *Modify* चुनें।
2. *फॉर्मेटिंग ग्रिड*: फॉन्ट फैमिली (`Aptos Display`), साइज (`18 pt`), रंग (`#0F172A` नेवी ब्लू) और वेट (`Bold`) सेट करें।
3. *Format ड्रॉपडाउन (नीचे बाएं)*:
   - *Paragraph*: *Keep with next* को अनिवार्य रूप से चेक करें (ताकि हेडिंग पेज के निचले छोर पर अकेली न छूटे) तथा आवश्यकतानुसार *Page break before* लगाएं।
   - *Border*: अध्याय के विभाजन को स्पष्ट करने हेतु नीचे एक आकर्षक पतली रेखा जोड़ें।
4. *दायरा (Scope)*: केवल वर्तमान दस्तावेज़ हेतु *Only in this document* चुनें, अथवा कंपनी-स्तरीय मानक बनाने हेतु *New documents based on this template* का चयन करें।

#concept-box(title: "महत्वपूर्ण लेआउट प्रोटोकॉल: 'KEEP WITH NEXT'", [
  सभी हेडिंग स्टाइल्स में `Paragraph > Line and Page Breaks` के तहत सदैव `Keep with next` विकल्प चालू रखें। यह वर्ड के पेजिनेशन इंजन को निर्देश देता है कि हेडिंग को कभी भी पेज के निचले कोने पर अकेला न छोड़े, बल्कि उसे हमेशा उसके अगले पैराग्राफ के साथ रखे।
])

#pagebreak()

== 3.3 स्टाइल सेट्स, डिजाइन थीम्स एवं ग्लोबल री-स्किनिंग

*Style Sets* इंजन (`Design > Document Formatting`) सामग्री की संरचना को उसके दृश्य रूप से अलग करता है। एक बार दस्तावेज़ में `Heading 1`, `Heading 2`, और `Normal` का प्रयोग होने के बाद:

- *Formal* से *Modern* अथवा *Centred* पर स्विच करने पर 1 सेकंड के भीतर सभी 100+ पेजों के फॉन्ट, बॉर्डर्स और मार्जिन अनुपात स्वतः बदल जाते हैं।
- *कलर पैलेट्स*: सक्रिय पैलेट (`Design > Colors`) बदलने से सभी शेप्स, टेबल्स और हेडिंग्स के ब्रांड कलर्स स्वतः अपडेट हो जाते हैं।
- *Format Painter (`Ctrl + Shift + C` / `Ctrl + Shift + V`)*:
  - सिंगल-क्लिक: चयनित टेक्स्ट की फॉर्मेटिंग कॉपी करके अगले क्लिक किए गए शब्द पर लागू करता है।
  - डबल-क्लिक: पेंटर को लॉक कर देता है, जिससे `Esc` दबाने तक दर्जनों अलग-अलग पैराग्राफों पर लगातार फॉर्मेटिंग लागू की जा सकती है।

#v(2pt)
#ribbon-specimen(path: "Home > Clipboard > Format Painter", command: "फॉर्मेटिंग कॉपी एवं पेस्ट करना", shortcut: "Ctrl + Shift + C / Ctrl + Shift + V")
#v(2pt)

== 3.4 वाइल्डकार्ड्स के साथ एडवांस्ड सर्च एवं रिप्लेस इंजन

सामान्य खोज (`Ctrl + F`) केवल शब्दों को ढूंढती है, जबकि कॉर्पोरेट डेटा क्लीनिंग हेतु *Advanced Find and Replace* (`Ctrl + H`) में *Use wildcards* का प्रयोग किया जाता है:

#table(
  columns: (1fr, 1.2fr, 2.5fr, 1.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*वाइल्डकार्ड*], [*सिंटैक्स पैटर्न*], [*मिलान का दायरा एवं व्यवहार*], [*डेटा क्लीनिंग उदाहरण*]),
  [Any Character], [`?`], [सटीक रूप से किसी एक अक्षर का मिलान करता है।], [`c?t` से cat, cot, cut],
  [String Range], [`*`], [शून्य अथवा अधिक अक्षरों की किसी भी श्रृंखला से मेल खाता है।], [`comp*r` से computer, compiler],
  [Word Boundary], [`<` एवं `>`], [शब्द की सटीक शुरुआत अथवा समाप्ति सुनिश्चित करता है।], [`<in>` से केवल in मिलेगा, inside नहीं],
  [Character Set], [`[a-z]`], [निर्दिष्ट सीमा के भीतर किसी एक अक्षर से मेल खाता है।], [`[0-9]` से कोई भी एक अंक],
  [Count Qualifier], [`{n,m}`], [पूर्व टोकन के n से m बार दोहराव का मिलान करता है।], [`[0-9]{10}` से 10-अंकीय मोबाइल नंबर],
  [Tagged Group], [`( )` व `\1`], [टोकन को ग्रुप में बांधकर उनके क्रम को बदलना।], [नाम उलटना: `(<*>) (<*>)` -> `\2, \1`]
)

#pagebreak()

== 3.5 प्रोडक्शन वर्कफ्लो: अव्यवस्थित पेस्ट किए गए टेक्स्ट की सफाई

वेबसाइट अथवा स्कैन किए गए OCR टेक्स्ट को वर्ड में पेस्ट करने के बाद इन 4 वाइल्डकार्ड चरणों से व्यवस्थित करें:

```
चरण 1: अनावश्यक खाली पंक्तियां हटाना
Find: ^p^p+ (अथवा ^13^13)  --> Replace: ^p

चरण 2: शब्दों के बीच कई स्पेस हटाना
Find: [ ]{2,}             --> Replace: [एकल स्पेस]

चरण 3: भारतीय मोबाइल नंबर मानकीकृत करना (+91-XXXXX-XXXXX)
Find: ([0-9]{5})([0-9]{5}) --> Replace: \1-\2

चरण 4: अनावश्यक सॉफ्ट ब्रेक हटाकर पैराग्राफ बनाना
Find: ^l                  --> Replace: ^p
```

#v(2pt)

== 3.6 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "सक्रिय पैराग्राफ पर Heading 1 स्टाइल लागू करने का शॉर्टकट क्या है?", ans: "Ctrl + Alt + 1.")
    #short-qa(num: 2, q: "Format Painter को लगातार कई स्थानों पर लागू करने हेतु कैसे लॉक करते हैं?", ans: "Format Painter आइकन पर डबल-क्लिक करके।")
    #short-qa(num: 3, q: "हेडिंग को उसके नीचे वाले पैराग्राफ से अलग होने से रोकने वाली सेटिंग कौन सी है?", ans: "'Keep with next' (Paragraph > Line and Page Breaks में)।")
    #short-qa(num: 4, q: "वाइल्डकार्ड सर्च में लगातार 10 अंकों को खोजने वाला एक्सप्रेशन क्या है?", ans: "[0-9]{10}.")
  ],
  [
    #mcq(num: 1, q: "केवल टेक्स्ट की फॉर्मेटिंग कॉपी करने (बिना टेक्स्ट कॉपी किए) का शॉर्टकट क्या है?", a: "Ctrl + C", b: "Ctrl + Shift + C", c: "Alt + C", d: "Shift + F3", ans: "B", expl: "Ctrl + Shift + C फॉर्मेटिंग कॉपी करता है और Ctrl + Shift + V फॉर्मेटिंग पेस्ट करता है।")
    #mcq(num: 2, q: "वाइल्डकार्ड में (<*>) (<*>) को खोजकर \\2, \\1 से रिप्लेस करने पर क्या परिणाम मिलेगा?", a: "सभी शब्द हट जाएंगे", b: "प्रथम और अंतिम नाम का क्रम उलट जाएगा", c: "अक्षर बड़े हो जाएंगे", d: "फुटनोट जुड़ जाएगा", ans: "B", expl: "कोष्ठक समूहों को टैग करते हैं; \\2, \\1 दूसरे शब्द को पहले स्थान पर ले आता है।")
    #mcq(num: 3, q: "हेडिंग स्टाइल्स का उपयोग करने का मुख्य लाभ क्या है?", a: "टेक्स्ट केवल बोल्ड होता है", b: "ऑटोमैटिक टेबल ऑफ कंटेंट्स व नेविगेशन ट्री का निर्माण संभव होता है", c: "फाइल साइज घटता है", d: "प्रिंटिंग बंद होती है", ans: "B", expl: "स्टाइल्स दस्तावेज़ को सेमांटिक डेटा प्रदान करती हैं जिससे TOC स्वतः तैयार होती है।")
  ]
)

#v(2pt)

#spotlight-box("2027 AI स्टाइल मानकीकरण", [
  वर्ड 365 एंटरप्राइज में AI स्टाइल हार्मोनाइजेशन शामिल है। 10 अलग-अलग कर्मचारियों द्वारा जोड़ी गई सामग्री में यदि किसी ने हेडिंग स्टाइल के बजाय मैन्युअल 14pt बोल्ड टेक्स्ट लिखा है, तो कोपायलट एक क्लिक में उसे मानक हेडिंग में बदल देता है।
])
"""

    with open(os.path.join(eng_dir, "chapter-03.typ"), "w", encoding="utf-8") as f:
        f.write(ch03_en)
    with open(os.path.join(hi_dir, "chapter-03.typ"), "w", encoding="utf-8") as f:
        f.write(ch03_hi)

    # =========================================================================
    # CHAPTER 04: Insert Tab: Tables & Matrix Data Manipulation (3 Pages)
    # =========================================================================
    ch04_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 04]
= Insert Tab: Tables, Matrix Data Manipulation & Table Formulas

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Tables represent the primary vehicle for structured data presentation in corporate proposals, invoices, financial balance sheets, and project matrices. Mastering table geometry, row pagination repeat headers, cell splitting, and formula evaluation ensures flawless multi-page data integrity.
]

#v(2pt)

== 4.1 Table Creation Methodologies & Structural Architecture

Word 365 provides 5 distinct methods to instantiate data matrices under `Insert > Tables > Table`:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Creation Method*], [*Operational Characteristics & Flexibility*], [*Enterprise Context*]),
  [Interactive Grid], [Hover up to 10 columns by 8 rows directly on drop-down palette.], [Rapid prototyping of small summary matrices.],
  [Insert Table Dialog], [Specify exact column/row counts and fixed vs. AutoFit behavior.], [Large structured forms with predefined schema.],
  [Draw Table Pencil], [Draw custom asymmetric cell boundaries with precise coordinate pencil.], [Complex invoice forms with varied row heights.],
  [Convert Text to Table], [Parses delimited text (commas, tabs, semicolons) into tabular matrix.], [Migrating CSV data or raw database dumps into Word.],
  [Excel Spreadsheet], [Embeds a live OLE Excel calculation grid with full formula engine.], [Financial models requiring dynamic chart linking.]
)

#v(2pt)
#ribbon-specimen(path: "Insert > Table > Convert Text to Table", command: "Transform Comma/Tab Delimited Data", shortcut: "Alt + N + T + V")
#v(2pt)

== 4.2 Table Tools: Design & Layout Ribbon Decomposition

When the cursor enters any table cell, Word activates two contextual ribbons:

1. *Table Design Tab*:
   - *Table Style Options*: Header Row, Total Row, Banded Rows (Zebra striping), First Column, Last Column, Banded Columns.
   - *Table Styles*: 100+ pre-formatted corporate color palettes adhering to document themes.
   - *Borders & Shading*: Custom line weights (0.25 pt to 6 pt), border colors, and Border Painter cursor.
2. *Table Layout Tab*:
   - *Rows & Columns*: Insert Above, Insert Below, Insert Left, Insert Right, Delete Rows/Columns/Table.
   - *Merge & Split*: Merge Cells, Split Cells (divide single cell into M × N matrix), Split Table.
   - *Cell Size & AutoFit*: *AutoFit Contents* (hugs text tightly), *AutoFit Window* (expands to 100% margin width), *Distribute Rows/Columns* evenly.
   - *Alignment Matrix*: 9-position spatial alignment grid (Top-Left, Center-Center, Bottom-Right) and Text Direction rotation (90° / 270°).

#pagebreak()

== 4.3 Multi-Page Table Management & Repeat Header Rows

When corporate data tables span across multiple pages (e.g., a 400-row inventory audit), two severe formatting errors frequently occur:
1. Rows split awkwardly across page breaks, slicing text lines in half.
2. Readers lose context on subsequent pages because the header column names vanish.

*The Enterprise Multi-Page Table Protocol*:
- *Repeat Header Rows*: Highlight the top header row, navigate to `Table Layout > Data > Repeat Header Rows`. Word automatically replicates the exact header styling at the top of every subsequent page break.
- *Prevent Row Split Across Pages*: Highlight all data rows, open `Table Properties > Row tab`, and uncheck *Allow row to break across pages*. This forces Word to push entire rows to the next page if space is insufficient.
- *CantSplit Flag*: Ensures legal clause numbers and signatures never get severed across physical paper boundaries.

#v(2pt)
#ribbon-specimen(path: "Table Layout > Data > Repeat Header Rows", command: "Universal Multi-Page Column Headers", shortcut: "Alt + J + L + H")
#v(2pt)

== 4.4 In-Table Formula Calculations (`=SUM`, `=AVERAGE`)

Word tables incorporate an internal calculation engine accessible via `Table Layout > Data > Formula` (`Alt + J + L + O`). Cells are addressed identically to Excel using coordinate notation (Column letters A, B, C... and Row numbers 1, 2, 3...):

#table(
  columns: (1.2fr, 1.8fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Function Syntax*], [*Positional Argument*], [*Computational Result & Enterprise Application*]),
  [`=SUM(ABOVE)`], [Positional (`ABOVE`)], [Sums all numeric values continuously above current cell in column.],
  [`=AVERAGE(LEFT)`], [Positional (`LEFT`)], [Calculates arithmetic mean of values immediately to the left.],
  [`=PRODUCT(B2, C2)`], [Coordinate (`B2, C2`)], [Multiplies Quantity (B2) by Unit Price (C2) in an invoice line.],
  [`=COUNT(ABOVE)`], [Positional (`ABOVE`)], [Counts number of numeric entries in a columnar audit register.],
  [`=MIN(D2:D20)`], [Range (`D2:D20`)], [Returns minimum value across a specified cell matrix range.]
)

#concept-box(title: "CRITICAL RE-CALCULATION PROTOCOL: F9 KEY", [
  Unlike Microsoft Excel, Word table formulas *do not automatically recalculate* when underlying numbers change! To update table sums after editing quantities, highlight the calculated cell (or entire table via `Ctrl + A`) and press the `F9` key.
])

#pagebreak()

== 4.5 Production Matrix: Corporate Quotation Invoice Blueprint

Below is an authentic specimen of a corporate procurement quotation table constructed with Word's calculation formulas and alignment matrices:

#table(
  columns: (0.8fr, 2.5fr, 0.9fr, 1.1fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if y == 4 { rgb("#FEF3C7") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Item*], [*Description of Hardware Equipment*], [*Qty*], [*Unit Price*], [*Total Amount*]),
  [01], [Dell PowerEdge R760 Rack Server (2U, Dual Xeon)], [02], [₹ 4,50,000], [₹ 9,00,000],
  [02], [Cisco Catalyst 9300 48-Port PoE+ Gigabit Switch], [04], [₹ 1,75,000], [₹ 7,00,000],
  [03], [APC Smart-UPS RT 10kVA On-Line Power Backup], [01], [₹ 3,25,000], [₹ 3,25,000],
  [*TOTAL*], [*Grand Sub-Total (Calculated via =SUM(ABOVE))*], [*07*], [--], [*₹ 19,25,000*]
)

#v(2pt)

== 4.6 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which key updates table formula calculations in Word?", ans: "F9 key.")
    #short-qa(num: 2, q: "Which command ensures table column titles repeat across page breaks?", ans: "Table Layout > Repeat Header Rows.")
    #short-qa(num: 3, q: "How are table columns and rows addressed in Word formulas?", ans: "Columns use letters (A, B, C...); rows use numbers (1, 2, 3...).")
    #short-qa(num: 4, q: "Which tool automatically sizes table columns to match text width?", ans: "Table Layout > AutoFit > AutoFit Contents.")
  ],
  [
    #mcq(num: 1, q: "What happens when pressing the Tab key while in the very last cell of a table?", a: "Deletes the table", b: "Automatically inserts a new row at the bottom", c: "Closes Word", d: "Indents the text", ans: "B", expl: "Pressing Tab in the bottom-right cell dynamically spawns an identical new row.")
    #mcq(num: 2, q: "Which formula syntax sums all numbers directly above the active cell?", a: "=ADD(UP)", b: "=SUM(ABOVE)", c: "=TOTAL(TOP)", d: "=PLUS(ALL)", ans: "B", expl: "=SUM(ABOVE) is the native positional formula in Word tables.")
    #mcq(num: 3, q: "Which setting prevents a table row from being sliced in half across a page boundary?", a: "AutoFit Window", b: "Uncheck 'Allow row to break across pages'", c: "Repeat Header Rows", d: "Distribute Rows", ans: "B", expl: "Unchecking this in Table Properties > Row forces the entire row to remain intact on one page.")
  ]
)

#v(2pt)

#spotlight-box("2027 COPILOT TABLE EXTRACTION & ENRICHMENT", [
  Word 365 Copilot AI can convert raw unstructured meeting notes into fully formatted, branded tables with a single prompt: "Convert the equipment discussion above into a 4-column procurement table with Unit Prices and Total calculations". Copilot automatically parses quantities and inserts mathematical `=PRODUCT` and `=SUM` formula codes.
])
"""

    ch04_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"))[भाग 1: माइक्रोसॉफ्ट वर्ड 365 एंटरप्राइज मास्टरक्लास · अध्याय 04]
= इन्सर्ट टैब: टेबल्स, मैट्रिक्स डेटा मैनिपुलेशन एवं टेबल फॉर्मूले

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  टेबल्स कॉर्पोरेट प्रस्तावों, इनवॉइस, वित्तीय बैलेंस शीट्स और प्रोजेक्ट मैट्रिक्स में संरचित डेटा प्रस्तुति का प्रमुख साधन हैं। टेबल ज्यामिति, बहु-पेज हेडर पंक्तियाँ दोहराना, सेल विभाजन और फॉर्मूला गणना में महारत हासिल करना डेटा की प्रामाणिकता हेतु अनिवार्य है।
]

#v(2pt)

== 4.1 टेबल निर्माण की विधियां एवं संरचना

वर्ड 365 में `Insert > Tables > Table` के अंतर्गत संरचित डेटा मैट्रिक्स बनाने के 5 तरीके उपलब्ध हैं:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*निर्माण विधि*], [*कार्यात्मक विशेषताएं एवं लचीलापन*], [*कॉर्पोरेट उपयोग*]),
  [Interactive Grid], [ड्रॉपडाउन पैलेट पर 10 कॉलम x 8 पंक्तियों तक माउस ड्रैग करके बनाना।], [छोटी सारांश टेबल्स का त्वरित निर्माण।],
  [Insert Table Dialog], [कॉलम व रो की सटीक संख्या तथा AutoFit व्यवहार पहले से तय करना।], [निश्चित ढांचे वाले बड़े संरचित फॉर्म्स।],
  [Draw Table Pencil], [कस्टम पेंसिल टूल द्वारा विभिन्न सेल सीमाओं को मैन्युअल रूप से खींचना।], [जटिल इनवॉइस फॉर्म्स जहां विभिन्न रो की ऊंचाई अलग हो।],
  [Convert Text to Table], [कॉमा, टैब अथवा सेमीकोलन से अलग किए गए टेक्स्ट को टेबल में बदलना।], [CSV फाइल अथवा डेटाबेस डेटा को वर्ड में आयात करना।],
  [Excel Spreadsheet], [वर्ड के भीतर लाइव एक्सेल स्प्रेडशीट एम्बेड करना।], [वित्तीय मॉडल जहां जटिल एक्सेल चार्ट्स जुड़े हों।]
)

#v(2pt)
#ribbon-specimen(path: "Insert > Table > Convert Text to Table", command: "टेक्स्ट को टेबल मैट्रिक्स में बदलना", shortcut: "Alt + N + T + V")
#v(2pt)

== 4.2 टेबल टूल्स: डिजाइन एवं लेआउट रिबन का विश्लेषण

जब कर्सर किसी टेबल सेल के भीतर होता है, तो वर्ड दो विशेष प्रासंगिक रिबन सक्रिय करता है:

1. *Table Design Tab*:
   - *Table Style Options*: Header Row, Total Row, Banded Rows (एकांतर रंगीन पट्टियां), First Column, Last Column।
   - *Table Styles*: 100+ पूर्व-डिज़ाइन किए गए कॉर्पोरेट कलर पैलेट्स।
   - *Borders & Shading*: कस्टम लाइन मोटाई (0.25 pt से 6 pt), बॉर्डर कलर, और बॉर्डर पेंटर टूल।
2. *Table Layout Tab*:
   - *Rows & Columns*: Insert Above, Insert Below, Insert Left, Insert Right, रो अथवा कॉलम हटाना।
   - *Merge & Split*: सेलों को जोड़ना (Merge), सेलों को विभाजित करना (Split Cells), टेबल को दो भागों में तोड़ना (Split Table)।
   - *Cell Size & AutoFit*: *AutoFit Contents* (टेक्स्ट की चौड़ाई अनुसार समेटना), *AutoFit Window* (मार्जिन तक 100% फैलाना), रो/कॉलम को समान रूप से वितरित करना।
   - *Alignment Matrix*: 9-दिशात्मक अलाइनमेंट ग्रिड तथा टेक्स्ट की दिशा 90 अथवा 270 अंश घुमाना (Text Direction)।

#pagebreak()

== 4.3 बहु-पेज टेबल्स एवं हेडर पंक्तियाँ दोहराना (Repeat Header Rows)

जब कॉर्पोरेट डेटा टेबल्स कई पेजों पर फैलती हैं (जैसे 400-पंक्तियों का ऑडिट इन्वेंटरी), तो दो गंभीर त्रुटियां होती हैं:
1. पंक्तियां पेज ब्रेक पर बीच से कट जाती हैं जिससे टेक्स्ट आधा-आधा दिखता है।
2. अगले पेजों पर कॉलम के नाम गायब हो जाते हैं जिससे डेटा समझ नहीं आता।

*कॉर्पोरेट बहु-पेज टेबल समाधान*:
- *Repeat Header Rows*: शीर्ष हेडर पंक्ति को चुनें, फिर `Table Layout > Data > Repeat Header Rows` पर क्लिक करें। वर्ड प्रत्येक अगले पेज के शीर्ष पर स्वतः सटीक हेडर प्रदर्शित करेगा।
- *Prevent Row Split Across Pages*: सभी डेटा पंक्तियों को चुनें, `Table Properties > Row tab` में जाएं और *Allow row to break across pages* को अनचेक करें। इससे यदि पेज पर स्थान कम होगा, तो पूरी रो अगले पेज पर स्थानांतरित होगी, बीच से नहीं कटेगी।
- *CantSplit फ़्लैग*: कानूनी अनुबंधों की शर्तों को सुरक्षित रखता है।

#v(2pt)
#ribbon-specimen(path: "Table Layout > Data > Repeat Header Rows", command: "प्रत्येक पेज पर कॉलम शीर्ष दोहराना", shortcut: "Alt + J + L + H")
#v(2pt)

== 4.4 टेबल के भीतर फॉर्मूला गणनाएं (`=SUM`, `=AVERAGE`)

वर्ड टेबल्स में एक्सेल की भांति आंतरिक गणना इंजन उपलब्ध है जिसे `Table Layout > Data > Formula` (`Alt + J + L + O`) द्वारा एक्सेस किया जाता है। सेलों का पता कॉलम अक्षरों (A, B, C...) तथा रो संख्याओं (1, 2, 3...) से निर्धारित होता है:

#table(
  columns: (1.2fr, 1.8fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*फॉर्मूला सिंटैक्स*], [*दिशात्मक तर्क (Argument)*], [*गणना परिणाम एवं कॉर्पोरेट उपयोग*]),
  [`=SUM(ABOVE)`], [Positional (`ABOVE`)], [कॉलम में वर्तमान सेल के ठीक ऊपर के सभी numeric मानों को जोड़ना।],
  [`=AVERAGE(LEFT)`], [Positional (`LEFT`)], [वर्तमान सेल के ठीक बाईं ओर के सभी मानों का औसत निकालना।],
  [`=PRODUCT(B2, C2)`], [Coordinate (`B2, C2`)], [मात्रा (B2) और दर (C2) का गुणा करके कुल राशि निकालना।],
  [`=COUNT(ABOVE)`], [Positional (`ABOVE`)], [कॉलम में प्रविष्टियों की कुल संख्या गिनना।],
  [`=MIN(D2:D20)`], [Range (`D2:D20`)], [निर्दिष्ट सेल रेंज में से न्यूनतम मान ज्ञात करना।]
)

#concept-box(title: "महत्वपूर्ण पुनः-गणना प्रोटोकॉल: F9 कुंजी", [
  एक्सेल के विपरीत, वर्ड टेबल्स में संख्या बदलने पर *फॉर्मूले स्वतः अपडेट नहीं होते*! गणना को अपडेट करने हेतु परिकलित सेल (अथवा `Ctrl + A` द्वारा पूरी टेबल) को चुनकर कीबोर्ड पर `F9` की दबाएं।
])

#pagebreak()

== 4.5 प्रोडक्शन मैट्रिक्स: कॉर्पोरेट कोटेशन इनवॉइस स्पेसिमेन

नीचे वर्ड के फॉर्मूला इंजन और अलाइनमेंट टूल्स द्वारा तैयार किए गए वास्तविक व्यावसायिक कोटेशन का उदाहरण दिया गया है:

#table(
  columns: (0.8fr, 2.5fr, 0.9fr, 1.1fr, 1.2fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if y == 4 { rgb("#FEF3C7") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*क्र.*], [*हार्डवेयर उपकरण विवरण*], [*मात्रा*], [*इकाई दर*], [*कुल राशि*]),
  [01], [Dell PowerEdge R760 रैक सर्वर (2U, ड्यूल Xeon)], [02], [₹ 4,50,000], [₹ 9,00,000],
  [02], [Cisco Catalyst 9300 48-पोर्ट गीगाबिट स्विच], [04], [₹ 1,75,000], [₹ 7,00,000],
  [03], [APC Smart-UPS RT 10kVA ऑनलाइन पावर बैकअप], [01], [₹ 3,25,000], [₹ 3,25,000],
  [*कुल*], [*कुल योग (फॉर्मूला =SUM(ABOVE) द्वारा गणना)*], [*07*], [--], [*₹ 19,25,000*]
)

#v(2pt)

== 4.6 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "वर्ड टेबल में फॉर्मूला गणना को पुनः अपडेट करने वाली की कौन सी है?", ans: "F9 कुंजी।")
    #short-qa(num: 2, q: "प्रत्येक पेज के शीर्ष पर टेबल हेडर दोहराने वाला कमांड कौन सा है?", ans: "Table Layout > Repeat Header Rows.")
    #short-qa(num: 3, q: "वर्ड टेबल फॉर्मूलों में कॉलम व रो का पता कैसे लिखा जाता है?", ans: "कॉलम के लिए अक्षर (A, B, C...) और रो के लिए संख्या (1, 2, 3...)।")
    #short-qa(num: 4, q: "टेक्स्ट की चौड़ाई अनुसार कॉलम को स्वतः सिकोड़ने वाला टूल कौन सा है?", ans: "Table Layout > AutoFit > AutoFit Contents.")
  ],
  [
    #mcq(num: 1, q: "टेबल के अंतिम सेल (निचले दाएं कोने) में Tab की दबाने पर क्या होता है?", a: "टेबल डिलीट हो जाती है", b: "नीचे स्वतः एक नई रो जुड़ जाती है", c: "वर्ड बंद हो जाता है", d: "टेक्स्ट इंडेंट होता है", ans: "B", expl: "अंतिम सेल में Tab दबाने पर बिल्कुल समान नई रो तैयार हो जाती है।")
    #mcq(num: 2, q: "वर्तमान सेल के ऊपर की सभी संख्याओं को जोड़ने वाला वर्ड फॉर्मूला कौन सा है?", a: "=ADD(UP)", b: "=SUM(ABOVE)", c: "=TOTAL(TOP)", d: "=PLUS(ALL)", ans: "B", expl: "=SUM(ABOVE) वर्ड टेबल का मानक दिशात्मक फॉर्मूला है।")
    #mcq(num: 3, q: "पेज ब्रेक पर टेबल रो को बीच से फटने से रोकने वाली सेटिंग कौन सी है?", a: "AutoFit Window", b: "Uncheck 'Allow row to break across pages'", c: "Repeat Header Rows", d: "Distribute Rows", ans: "B", expl: "Row Properties में इस विकल्प को बंद करने से पूरी रो एक साथ अगले पेज पर जाती है।")
  ]
)

#v(2pt)

#spotlight-box("2027 कोपायलट AI टेबल निष्कर्षण", [
  वर्ड 365 में कोपायलट AI मीटिंग मिनट्स के असंगठित टेक्स्ट को एक प्रॉम्प्ट पर खूबसूरत टेबल में बदल देता है: "उपरोक्त हार्डवेयर चर्चा को 4-कॉलम वाली प्रोक्योरमेंट टेबल में बदलें जिसमें दर व कुल राशि फॉर्मूले जुड़े हों"।
])
"""

    with open(os.path.join(eng_dir, "chapter-04.typ"), "w", encoding="utf-8") as f:
        f.write(ch04_en)
    with open(os.path.join(hi_dir, "chapter-04.typ"), "w", encoding="utf-8") as f:
        f.write(ch04_hi)

    # =========================================================================
    # CHAPTER 05: Insert Tab: Visual Graphics, SmartArt & Shapes (3 Pages)
    # =========================================================================
    ch05_en = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 1: MICROSOFT WORD 365 ENTERPRISE MASTERCLASS · CHAPTER 05]
= Insert Tab: Visual Graphics, SmartArt Hierarchy & Text Wrapping Mechanics

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  Contemporary business documentation demands compelling infographics, high-resolution vector assets, and organizational hierarchy diagrams. Understanding text wrapping geometry, SmartArt matrix layouts, and image background removal transforms dense textual prose into high-impact corporate collateral.
]

#v(2pt)

== 5.1 Graphic Assets & Vector Icon Architecture

Word 365 natively handles both raster bitmaps (JPEG, PNG, TIFF) and infinite-resolution scalable vector graphics (SVG):

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Asset Category*], [*Native File Formats & Levers*], [*Enterprise Application & Performance*]),
  [Scalable Vectors], [SVG (`.svg`), EMF (`.emf`)], [Infinite zoom without pixelation; colors can be converted to editable shapes.],
  [Bitmap Photos], [JPEG, PNG, WebP, HEIC], [High-resolution photography; supports automated AI background removal.],
  [Microsoft Stock Icons], [Native curated cloud vector repository], [Thousands of standardized monochrome business & technical symbols.],
  [3D Models], [GLB (`.glb`), FBX, OBJ, 3MF], [Interactive 360-degree rotational product specimens with lighting tilt.],
  [Screen Clipping], [Dynamic OS desktop viewport capture], [Instant high-precision software training manual screenshot insertion.]
)

#v(2pt)
#ribbon-specimen(path: "Insert > Illustrations > Icons", command: "Cloud Vector Icon Repository", shortcut: "Alt + N + NS")
#v(2pt)

== 5.2 Text Wrapping Mechanics: The 7 Geometric Layout Modes

By default, inserted images behave as *In Line with Text*, acting like giant typographic characters that destroy sentence flow. Mastering the *Wrap Text* engine (`Picture Format > Wrap Text`) is mandatory:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Wrap Mode*], [*Geometric Behavior & Text Spatial Flow*], [*Recommended Workplace Usage*]),
  [In Line with Text], [Bound strictly to paragraph baseline; moves with preceding text.], [Small inline icons, mathematical equation symbols.],
  [Square], [Text flows cleanly around the rectangular bounding box of image.], [Standard editorial sidebar images, product snapshots.],
  [Tight], [Text contours tightly along actual outer transparent silhouette of image.], [Transparent PNG vector logos, cutout personnel portraits.],
  [Through], [Text flows into internal cavities and concavities of transparent shapes.], [Complex technical diagrams, circular infographic charts.],
  [Top and Bottom], [Stops text flow horizontally on left/right; text only above and below.], [Wide horizontal banner graphics, panoramic charts.],
  [Behind Text], [Image placed beneath document text plane; text prints directly over.], [Custom background watermarks, tinted graphic textures.],
  [In Front of Text], [Image hovers above text plane, completely obscuring underlying words.], [Decorative floating sticker seals, draft stamp banners.]
)

#pagebreak()

== 5.3 Picture Formatting, AI Background Removal & Cropping

The *Picture Format* contextual ribbon exposes studio-grade graphic editing controls directly inside Word:
- *Remove Background*: AI engine automatically identifies the subject (portrait, product) and marks background areas in purple for instantaneous transparency stripping.
- *Corrections*: Fine-tunes *Sharpen/Soften* (up to +50%) and adjusts *Brightness/Contrast* matrices.
- *Color*: Recolor images to monochrome brand themes (e.g., Grayscale, Cyan Accent, Washout for subtle backgrounds).
- *Crop to Shape*: Instead of basic rectangular photos, crop executive headshots into perfect circles, rounded rectangles, or hexagons via `Picture Format > Crop > Crop to Shape`.
- *Aspect Ratio Locking*: Lock 1:1 (Square), 16:9 (Widescreen), or 4:3 to prevent distortion.

#concept-box(title: "CRITICAL FILE SIZE LEVER: COMPRESS PICTURES", [
  Embedding twenty 20MB smartphone photos will bloat a Word document to 400MB, crashing email servers. Always click `Picture Format > Compress Pictures`, choose *E-mail (96 ppi)* or *Print (220 ppi)*, and check *Delete cropped areas of pictures*.
])

#v(2pt)
#ribbon-specimen(path: "Picture Format > Adjust > Compress Pictures", command: "Optimize Document Storage & Delete Crops", shortcut: "Alt + J + P + C")
#v(2pt)

== 5.4 SmartArt Architecture & Corporate Hierarchy Charts

SmartArt transforms boring bulleted lists into visual communication frameworks. Word 365 categorizes SmartArt into 7 functional layouts under `Insert > Illustrations > SmartArt`:

#table(
  columns: (1fr, 2.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*Category*], [*Visual Communication Purpose*], [*Standard Enterprise Use Case*]),
  [List], [Displays non-sequential groups of related information.], [Service offerings, core company values, feature matrices.],
  [Process], [Shows directional, chronological progression or workflow steps.], [Procurement pipelines, software release lifecycles, SOPs.],
  [Cycle], [Represents a continuous circular repeating loop.], [Continuous Improvement (PDCA cycle), budget fiscal years.],
  [Hierarchy], [Demonstrates organizational reporting trees and taxonomy trees.], [Company organizational charts, software class structures.],
  [Relationship], [Illustrates connections between distinct entities.], [Venn diagrams, balance scales, radial clusters.],
  [Matrix], [Shows how parts relate to a whole across 2 dimensions.], [SWOT analysis, 2x2 Risk Assessment quadrants.],
  [Pyramid], [Displays foundation-based proportional hierarchies.], [Maslow hierarchy, enterprise cybersecurity defense layers.]
)

#pagebreak()

== 5.5 Production Workflow: Converting Bullet Lists to SmartArt in 2 Seconds

Never waste hours manually drawing boxes and arrows. Convert existing text dynamically:
1. Type a standard indented bullet list representing organizational hierarchy or steps.
2. Highlight the list, right-click, and select *Convert to SmartArt*.
3. Choose *Hierarchy* or *Continuous Process*.
4. Word automatically builds the diagram, maintaining text in the expandable *Text Pane* (`Ctrl + Shift + T`).
5. In the Text Pane, press `Tab` to demote an employee beneath a manager, or `Shift + Tab` to promote upward!

#v(2pt)

== 5.6 Evaluation Dashboard: Review & Technical MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "Which text wrapping mode contours text tightly around transparent PNG borders?", ans: "Tight wrapping.")
    #short-qa(num: 2, q: "What tool permanently discards hidden pixels outside a cropped image boundary?", ans: "Picture Format > Compress Pictures > 'Delete cropped areas'.")
    #short-qa(num: 3, q: "Which SmartArt category is standard for corporate organizational reporting charts?", ans: "Hierarchy.")
    #short-qa(num: 4, q: "How do you open the collapsible Text Pane inside an active SmartArt graphic?", ans: "Click the arrow tab on the left border or press Ctrl + Shift + T.")
  ],
  [
    #mcq(num: 1, q: "What is the default text wrap setting when a new picture is inserted into Word?", a: "Square", b: "In Line with Text", c: "Tight", d: "Behind Text", ans: "B", expl: "In Line with Text is default, locking the graphic to the text baseline.")
    #mcq(num: 2, q: "Which vector file format allows infinite scaling in Word without pixelation?", a: ".jpg", b: ".bmp", c: ".svg", d: ".gif", ans: "C", expl: "Scalable Vector Graphics (.svg) render mathematically at any resolution.")
    #mcq(num: 3, q: "In the SmartArt Text Pane, what does pressing the Tab key achieve?", a: "Deletes the shape", b: "Demotes the active item down one hierarchy level", c: "Changes color", d: "Closes the diagram", ans: "B", expl: "Tab indents and demotes the item beneath the preceding parent shape.")
  ]
)

#v(2pt)

#spotlight-box("2027 3D INTERACTIVE DIGITAL ASSETS IN WORD 365", [
  Word 365 supports native glTF/GLB 3D models with embedded rotational animations. In digital proposals, readers can click and rotate an interactive 3D engineering prototype directly on the page, experiencing dynamic lighting reflections without third-party CAD viewers.
])
"""

    ch05_hi = r"""#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"))[भाग 1: माइक्रोसॉफ्ट वर्ड 365 एंटरप्राइज मास्टरक्लास · अध्याय 05]
= इन्सर्ट टैब: विजुअल ग्राफिक्स, स्मार्टआर्ट हायरार्की एवं टेक्स्ट रैपिंग मैकेनिक्स

#text(size: 7.5pt, fill: rgb("#1E293B").lighten(20%))[
  आधुनिक व्यावसायिक दस्तावेज़ों में प्रभावशाली इन्फोग्राफिक्स, उच्च-रिज़ॉल्यूशन वेक्टर एसेट्स और संगठनात्मक हायरार्की आरेखों की आवश्यकता होती है। टेक्स्ट रैपिंग ज्यामिति, स्मार्टआर्ट लेआउट्स और इमेज बैकग्राउंड रिमूवल में दक्षता जटिल गद्य को प्रभावशाली कॉर्पोरेट दस्तावेज़ों में बदल देती है।
]

#v(2pt)

== 5.1 ग्राफिक एसेट्स एवं वेक्टर आइकन संरचना

वर्ड 365 में रैस्टर बिटमैप्स (JPEG, PNG) तथा असीमित रिज़ॉल्यूशन वाले स्केलेबल वेक्टर ग्राफिक्स (SVG) दोनों का समर्थन उपलब्ध है:

#table(
  columns: (1.2fr, 2.3fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*ग्राफिक श्रेणी*], [*फाइल फॉर्मेट्स एवं टूल्स*], [*कॉर्पोरेट उपयोग एवं क्षमताएं*]),
  [Scalable Vectors], [SVG (`.svg`), EMF (`.emf`)], [ज़ूम करने पर कभी नहीं फटते; रंगों को बदलकर एडिटेबल शेप्स बनाया जा सकता है।],
  [Bitmap Photos], [JPEG, PNG, WebP, HEIC], [उच्च-रिज़ॉल्यूशन फोटोग्राफी; AI आधारित बैकग्राउंड रिमूवल का समर्थन।],
  [Microsoft Stock Icons], [क्लाउड आधारित वेक्टर रिपॉजिटरी], [हजारों मानकीकृत तकनीकी व व्यावसायिक मोनोक्रोम आइकन्स।],
  [3D Models], [GLB (`.glb`), FBX, OBJ], [360-डिग्री घूमने वाले इंटरएक्टिव 3D उत्पाद स्पेसिमेन।],
  [Screen Clipping], [स्क्रीनशॉट कैप्चर टूल], [सॉफ्टवेयर ट्रेनिंग मैनुअल हेतु त्वरित सटीक स्क्रीनशॉट जोड़ना।]
)

#v(2pt)
#ribbon-specimen(path: "Insert > Illustrations > Icons", command: "क्लाउड वेक्टर आइकन लाइब्रेरी", shortcut: "Alt + N + NS")
#v(2pt)

== 5.2 टेक्स्ट रैपिंग मैकेनिक्स: 7 प्रमुख ज्यामितीय मोड्स

डिफ़ॉल्ट रूप से वर्ड में इमेज *In Line with Text* के रूप में जुड़ती है, जो एक बड़े अक्षर की तरह व्यवहार कर पैराग्राफ को तोड़ देती है। *Wrap Text* (`Picture Format > Wrap Text`) का सही चयन अनिवार्य है:

#table(
  columns: (1.2fr, 2.5fr, 2.3fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*रैपिंग मोड*], [*ज्यामितीय व्यवहार एवं टेक्स्ट का प्रवाह*], [*अनुशंसित कॉर्पोरेट उपयोग*]),
  [In Line with Text], [टेक्स्ट बेसलाइन से बंधा रहता है; टेक्स्ट के साथ आगे बढ़ता है।], [छोटे इनलाइन आइकन्स, गणितीय प्रतीक।],
  [Square], [टेक्स्ट चित्र के चारों ओर आयताकार बॉक्स में बहता है।], [मानक संपादकीय लेख, उत्पाद तस्वीरें।],
  [Tight], [टेक्स्ट पारदर्शी PNG चित्र के वास्तविक बाहरी किनारों को छूता है।], [कंपनी के लोगो, पारदर्शी बैकग्राउंड वाली तस्वीरें।],
  [Through], [टेक्स्ट चित्र के आंतरिक रिक्त स्थानों में भी प्रवेश करता है।], [जटिल तकनीकी आरेख, गोलाकार इन्फोग्राफिक्स।],
  [Top and Bottom], [चित्र के दाएं-बाएं टेक्स्ट बंद रहता है; केवल ऊपर व नीचे बहता है।], [चौड़े हॉरिजॉन्टल बैनर्स, पैनोरमिक चार्ट्स।],
  [Behind Text], [चित्र टेक्स्ट के पीछे चला जाता है; टेक्स्ट उसके ऊपर छपता है।], [कस्टम वॉटरमार्क, हल्के बैकग्राउंड टेक्सचर्स।],
  [In Front of Text], [चित्र टेक्स्ट के ऊपर तैरता है और नीचे के शब्दों को छुपा देता है।], [सील स्टैम्प्स, ड्राफ्ट बैनर्स, फ्लोटिंग स्टिकर्स।]
)

#pagebreak()

== 5.3 पिक्चर फॉर्मेटिंग, AI बैकग्राउंड रिमूवल एवं क्रॉपिंग

*Picture Format* रिबन में उन्नत फोटो एडिटिंग टूल्स उपलब्ध हैं:
- *Remove Background*: AI इंजन फोटो में मुख्य विषय (व्यक्ति, उत्पाद) की पहचान करके बैकग्राउंड को बैंगनी रंग से चिह्नित करता है, जिसे एक क्लिक में पारदर्शी बनाया जा सकता है।
- *Corrections*: चित्र के तीखेपन (Sharpen/Soften) तथा ब्राइटनेस/कंट्रास्ट को समायोजित करना।
- *Color*: चित्रों को कंपनी के ब्रांड कलर्स (ग्रेस्केल, सेपिया, वॉशआउट) में बदलना।
- *Crop to Shape*: फोटो को सामान्य चौकोर काटने के बजाय वृत्त (Circle), हेक्सागोन अथवा राउंडेड रेक्टेंगल आकार में काटना (`Picture Format > Crop > Crop to Shape`)।
- *Aspect Ratio*: 1:1, 16:9 अथवा 4:3 अनुपात लॉक करना ताकि फोटो विकृत न हो।

#concept-box(title: "महत्वपूर्ण फाइल साइज नियंत्रण: COMPRESS PICTURES", [
  बीस 20MB वाली स्मार्टफोन तस्वीरों को जोड़ने से वर्ड फाइल 400MB की हो जाएगी और ईमेल नहीं होगी। सदैव `Picture Format > Compress Pictures` पर क्लिक करें, *E-mail (96 ppi)* अथवा *Print (220 ppi)* चुनें और *Delete cropped areas of pictures* चेक करें।
])

#v(2pt)
#ribbon-specimen(path: "Picture Format > Adjust > Compress Pictures", command: "फाइल साइज अनुकूलन व क्रॉप किए हिस्से हटाना", shortcut: "Alt + J + P + C")
#v(2pt)

== 5.4 स्मार्टआर्ट आर्किटेक्चर एवं कॉर्पोरेट हायरार्की चार्ट्स

स्मार्टआर्ट साधारण बुलेट लिस्ट्स को दृश्य आरेखों में बदलता है। वर्ड 365 में `Insert > Illustrations > SmartArt` के तहत 7 श्रेणियां उपलब्ध हैं:

#table(
  columns: (1fr, 2.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3pt, y: 2pt),
  table.header([*श्रेणी*], [*दृश्य संचार उद्देश्य*], [*मानक कॉर्पोरेट उपयोग*]),
  [List], [अक्रमिक संबंधित सूचना समूहों को दर्शाना।], [कंपनी के मूल मूल्य, सेवाओं की सूची।],
  [Process], [कालानुक्रमिक चरणबद्ध प्रक्रिया अथवा वर्कफ्लो।], [प्रोक्योरमेंट प्रक्रिया, सॉफ्टवेयर रिलीज पाइपलाइन, SOPs।],
  [Cycle], [निरंतर घूमने वाला चक्रीय चक्र।], [गुणवत्ता सुधार (PDCA चक्र), वित्तीय बजट वर्ष।],
  [Hierarchy], [संगठनात्मक रिपोर्टिंग संरचना व वर्गीकरण।], [कंपनी ऑर्ग चार्ट, पद पदानुक्रम।],
  [Relationship], [विभिन्न तत्वों के बीच आपसी संबंध दर्शाना।], [वेन आरेख (Venn), बैलेंस स्केल।],
  [Matrix], [2-आयामी चतुर्थांशों में भागों का संबंध।], [SWOT विश्लेषण, 2x2 रिस्क असेसमेंट।],
  [Pyramid], [नींव आधारित आनुपातिक पदानुक्रम।], [मास्लो की आवश्यकता हायरार्की, सुरक्षा स्तर।]
)

#pagebreak()

== 5.5 प्रोडक्शन वर्कफ्लो: बुलेट लिस्ट को 2 सेकंड में स्मार्टआर्ट में बदलना

घंटों तक मैन्युअल बॉक्स और तीर बनाने के बजाय टेक्स्ट को सीधे रूपांतरित करें:
1. पदानुक्रम दर्शाने वाली सामान्य बुलेटेड लिस्ट टाइप करें।
2. लिस्ट को चुनें, राइट-क्लिक करें और *Convert to SmartArt* चुनें।
3. *Hierarchy* अथवा *Continuous Process* चुनें।
4. वर्ड स्वतः आरेख का निर्माण कर देगा। बायीं ओर *Text Pane* (`Ctrl + Shift + T`) खुलता है।
5. टेक्स्ट पेन में किसी कर्मचारी को मैनेजर के अधीन करने हेतु `Tab` दबाएं, और स्तर ऊपर करने हेतु `Shift + Tab` दबाएं!

#v(2pt)

== 5.6 मूल्यांकन डैशबोर्ड: समीक्षा प्रश्न एवं MCQs

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  [
    #short-qa(num: 1, q: "पारदर्शी PNG फोटो के किनारों से सटकर टेक्स्ट बहाने वाला रैपिंग मोड कौन सा है?", ans: "Tight wrapping.")
    #short-qa(num: 2, q: "फोटो के क्रॉप किए गए छिपे हुए हिस्सों को हमेशा के लिए हटाने वाला टूल कौन सा है?", ans: "Compress Pictures > 'Delete cropped areas'.")
    #short-qa(num: 3, q: "कंपनी के संगठनात्मक चार्ट (Org Chart) हेतु कौन सी स्मार्टआर्ट श्रेणी मानक है?", ans: "Hierarchy.")
    #short-qa(num: 4, q: "स्मार्टआर्ट के भीतर टेक्स्ट पेन खोलने का शॉर्टकट क्या है?", ans: "Ctrl + Shift + T.")
  ],
  [
    #mcq(num: 1, q: "वर्ड में नई तस्वीर इन्सर्ट करने पर डिफ़ॉल्ट टेक्स्ट रैपिंग क्या होती है?", a: "Square", b: "In Line with Text", c: "Tight", d: "Behind Text", ans: "B", expl: "In Line with Text डिफ़ॉल्ट होती है, जो चित्र को टेक्स्ट बेसलाइन से बांधती है।")
    #mcq(num: 2, q: "कौन सा वेक्टर फॉर्मेट वर्ड में बिना फटे असीमित ज़ूम का समर्थन करता है?", a: ".jpg", b: ".bmp", c: ".svg", d: ".gif", ans: "C", expl: "SVG (Scalable Vector Graphics) किसी भी रिज़ॉल्यूशन पर गणितीय रूप से रेंडर होता है।")
    #mcq(num: 3, q: "स्मार्टआर्ट टेक्स्ट पेन में Tab की दबाने से क्या होता है?", a: "शेप डिलीट होता है", b: "सक्रिय आइटम पदानुक्रम में एक स्तर नीचे (Demote) चला जाता है", c: "रंग बदलता है", d: "आरेख बंद होता है", ans: "B", expl: "Tab दबाने से आइटम अपने ऊपर वाले आइटम के अधीन हो जाता है।")
  ]
)

#v(2pt)

#spotlight-box("2027 3D इंटरएक्टिव डिजिटल एसेट्स", [
  वर्ड 365 glTF/GLB 3D मॉडल्स का समर्थन करता है। डिजिटल प्रपोजल में पाठक पेज पर ही इंजीनियरिंग प्रोटोटाइप को 360-डिग्री घुमाकर देख सकते हैं, जिसमें बिना किसी CAD सॉफ्टवेयर के गतिशील प्रकाश और छाया प्रदर्शित होती है।
])
"""

    with open(os.path.join(eng_dir, "chapter-05.typ"), "w", encoding="utf-8") as f:
        f.write(ch05_en)
    with open(os.path.join(hi_dir, "chapter-05.typ"), "w", encoding="utf-8") as f:
        f.write(ch05_hi)

    print("Word Chapters 01 to 05 (15 Pages total) generated successfully in English and Hindi.")

if __name__ == "__main__":
    generate_chapters("DIGITAL/OFFICE_365/07_SOURCE_FILES")


if __name__ == "__main__":
    generate_chapters("DIGITAL/OFFICE_365/07_SOURCE_FILES")
