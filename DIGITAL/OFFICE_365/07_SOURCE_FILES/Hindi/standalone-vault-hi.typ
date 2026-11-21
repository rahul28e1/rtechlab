#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-cover-v5-hi

#set document(
  title: "शीर्ष 100 ऑफिस 365 शॉर्टकट्स एवं 50 MIS इंटरव्यू वॉल्ट",
  author: "राहुल पटेल"
)

// COVER
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5-hi(
  title: "शीर्ष 100 शॉर्टकट्स एवं 50 MIS इंटरव्यू वॉल्ट",
  subtitle: "कॉर्पोरेट चीट शीट · वर्ड, एक्सेल, पावरपॉइंट एवं क्लाउड इकोसिस्टम · करियर एक्सेलरेटर संस्करण",
  edition: "2027 विशेष स्टैंडअलोन संस्करण"
)

#show: rtech-book.with(
  title: "शीर्ष 100 शॉर्टकट्स एवं 50 MIS इंटरव्यू वॉल्ट",
  edition: "2027 मास्टर संस्करण · कमर्शियल रिलीज",
  author: "राहुल पटेल",
  subject-code: "RTL-2027-O365-VAULT"
)

#include "chapter-31.typ"
#pagebreak()
#include "chapter-32.typ"
