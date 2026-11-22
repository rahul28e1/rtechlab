# -*- coding: utf-8 -*-
import os

BASE_DIR = r"c:\Users\Rahul\Videos\My projects\RtechLab"
SCRIPTS_DIR = os.path.join(BASE_DIR, "scripts")

def add_ch2():
    path = os.path.join(SCRIPTS_DIR, "mega_content_hi_part1.py")
    with open(path, "r", encoding="utf-8") as f:
        text = f.read()

    ch2_extra = r"""
== 2.15 कॉर्पोरेट दक्षता: कीबोर्ड बनाम माउस परिचालन गति का व्यावहारिक समय विश्लेषण
आरटेक लैब एवं आईएएनटी में छात्रों को केवल कीबोर्ड शॉर्टकट्स के माध्यम से काम करने हेतु प्रशिक्षित किया जाता है:

#table(
  columns: (1.4fr, 1.3fr, 1.3fr, 1fr),
  fill: (col, row) => if row == 0 { rgb("#0E7490") } else if calc.even(row) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#CBD5E1"),
  inset: 4.5pt,
  [#text(weight: "bold", fill: white)[दैनिक एकाउंटिंग कार्य]], [#text(weight: "bold", fill: white)[माउस द्वारा समय]], [#text(weight: "bold", fill: white)[कीबोर्ड शॉर्टकट समय]], [#text(weight: "bold", fill: white)[दक्षता वृद्धि]],
  [नया वाउचर खोलना], [8 से 10 सेकंड (क्लिक-क्लिक)], [1 सेकंड (#key-pill("F8") या #key-pill("F9"))], [800% तेज],
  [नया लेजर बीच में बनाना], [15 सेकंड (स्क्रीन बंद कर मास्टर्स)], [1.5 सेकंड (#key-pill("Alt + C"))], [1000% तेज],
  [पुराने लेजर में सुधार करना], [20 सेकंड (मास्टर्स > लेजर > अल्टर)], [2 सेकंड (#key-pill("Ctrl + Enter"))], [1000% तेज],
  [वाउचर स्क्रीन सेव करना], [4 सेकंड (Enter 8 बार दबाना)], [0.5 सेकंड (#key-pill("Ctrl + A"))], [800% तेज],
  [बैलेंस शीट चेक करना], [12 सेकंड (GOT > नीचे स्क्रॉल > क्लिक)], [1.5 सेकंड (#key-pill("Alt + G > B"))], [800% तेज]
)

#v(6pt)
"""
    if "== 2.15 कॉर्पोरेट दक्षता" not in text and "== 2.6 मुख्य सारांश" in text:
        text = text.replace("== 2.6 मुख्य सारांश", ch2_extra + "\n== 2.6 मुख्य सारांश")
        with open(path, "w", encoding="utf-8") as f:
            f.write(text)
        print("Ch 2 extra added!")

def add_ch7():
    path = os.path.join(SCRIPTS_DIR, "mega_content_hi_part2.py")
    with open(path, "r", encoding="utf-8") as f:
        text = f.read()

    ch7_extra = r"""
== 7.15 कॉर्पोरेट कंपनी विलय एवं सहायक कंपनी डेटा एकीकरण (Consolidation) प्रोटोकॉल
जब दो कंपनियां आपस में विलय (Merger) करती हैं या एक होल्डिंग कंपनी अपनी सहायक कंपनियों का डेटा एकीकृत करती है:
1. *चार्ट ऑफ अकाउंट्स मानकीकरण:* दोनों कंपनियों में लेजर्स के नाम और उनके ग्रुप्स एक समान होने चाहिए (उदा. दोनों कंपनियों में बैंक खाता `HDFC Bank` नाम से हो, न कि एक में `HDFC Bank` और दूसरी में `Bank of HDFC`)।
2. *डेटा आयात एवं निर्यात (#key-pill("Alt + O / Alt + E")):* सहायक कंपनी के सभी मास्टर्स और वाउचर्स को XML प्रारूप में निर्यात कर मुख्य होल्डिंग कंपनी में आयात किया जाता है।
3. *अंतर-कंपनी लेन-देन विलोपन (Inter-Company Elimination):* समेकित वित्तीय विवरण तैयार करते समय मूल कंपनी और सहायक कंपनी के बीच हुए आंतरिक लेन-देन और शेष राशियों को आपसी समायोजन (Contra / Elimination Entries) द्वारा हटाया जाता है ताकि टर्नओवर कृत्रिम रूप से दोगुना न दिखे।

#v(6pt)
"""
    if "== 7.15 कॉर्पोरेट कंपनी विलय" not in text and "== 7.6 मुख्य सारांश" in text:
        text = text.replace("== 7.6 मुख्य सारांश", ch7_extra + "\n== 7.6 मुख्य सारांश")
        with open(path, "w", encoding="utf-8") as f:
            f.write(text)
        print("Ch 7 extra added!")

add_ch2()
add_ch7()
