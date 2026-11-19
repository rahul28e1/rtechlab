#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-cover-hindi-v5

#set document(
  title: "RTechLab कम्प्यूटर फंडामेंटल्स 2027 मास्टर एडिशन (V5.1.3)",
  author: "Rahul Patel"
)

// पृष्ठ 1: कवर पृष्ठ (A4 BORDERLESS)
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-hindi-v5()

// पृष्ठ 2 से आगे: मास्टर पब्लिशिंग थीम (DEVANAGARI READY)
#show: rtech-book.with(
  title: "कम्प्यूटर फंडामेंटल्स 2027",
  edition: "2027 मास्टर एडिशन · V5.1.3 वाणिज्यिक डिजिटल रिलीज",
  author: "Rahul Patel",
  subject-code: "RTL-2027-FUND-V5.1.3"
)

// पृष्ठ 2: पाठ्यक्रम ब्लूप्रिंट इंडेक्स
#include "../07_PUBLISHING_ENGINE/blueprint-v5-hi.typ"

// पृष्ठ 3–6: अध्याय 1
#pagebreak()
#include "chapter-01.typ"

// पृष्ठ 7–10: अध्याय 2
#pagebreak()
#include "chapter-02.typ"

// पृष्ठ 11–14: अध्याय 3
#pagebreak()
#include "chapter-03.typ"

// पृष्ठ 15–18: अध्याय 4
#pagebreak()
#include "chapter-04.typ"

// पृष्ठ 19–22: अध्याय 5
#pagebreak()
#include "chapter-05.typ"

// पृष्ठ 23–26: अध्याय 6
#pagebreak()
#include "chapter-06.typ"

// पृष्ठ 27–30: अध्याय 7
#pagebreak()
#include "chapter-07.typ"

// पृष्ठ 31–34: अध्याय 8
#pagebreak()
#include "chapter-08.typ"

// पृष्ठ 35–38: अध्याय 9
#pagebreak()
#include "chapter-09.typ"

// पृष्ठ 39–45: अध्याय 10
#pagebreak()
#include "chapter-10.typ"
