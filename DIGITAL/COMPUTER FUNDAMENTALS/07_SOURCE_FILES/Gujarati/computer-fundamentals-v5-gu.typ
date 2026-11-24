#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5-gu.typ": rtech-cover-gujarati-v5

#set document(
  title: "RTechLab કમ્પ્યુટર ફંડામેન્ટલ્સ 2027 માસ્ટર એડિશન (V5.1.2)",
  author: "Rahul Patel"
)

// પૃષ્ઠ 1: કવર પૃષ્ઠ (A4 BORDERLESS)
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-gujarati-v5()

// પૃષ્ઠ 2 થી આગળ: માસ્ટર પબ્લિશિંગ થીમ (GUJARATI READY)
#show: rtech-book.with(
  title: "કમ્પ્યુટર ફંડામેન્ટલ્સ 2027",
  edition: "2027 માસ્ટર એડિશન · V5.1.2 ફાયનલ વાણિજ્યિક રિલીઝ (ગુજરાતી)",
  author: "Rahul Patel",
  subject-code: "RTL-2027-FUND-GU-V5.1.2"
)

#set text(font: ("Segoe UI", "Shruti", "Nirmala UI", "Arial"), lang: "gu")

// પૃષ્ઠ 2: અભ્યાસક્રમ બ્લૂપ્રિન્ટ ઇન્ડેક્સ
#include "../07_PUBLISHING_ENGINE/blueprint-v5-gu.typ"

// પૃષ્ઠ 3–6: પ્રકરણ 1
#pagebreak()
#include "chapter-01.typ"

// પૃષ્ઠ 7–10: પ્રકરણ 2
#pagebreak()
#include "chapter-02.typ"

// પૃષ્ઠ 11–14: પ્રકરણ 3
#pagebreak()
#include "chapter-03.typ"

// પૃષ્ઠ 15–18: પ્રકરણ 4
#pagebreak()
#include "chapter-04.typ"

// પૃષ્ઠ 19–22: પ્રકરણ 5
#pagebreak()
#include "chapter-05.typ"

// પૃષ્ઠ 23–26: પ્રકરણ 6
#pagebreak()
#include "chapter-06.typ"

// પૃષ્ઠ 27–30: પ્રકરણ 7
#pagebreak()
#include "chapter-07.typ"

// પૃષ્ઠ 31–34: પ્રકરણ 8
#pagebreak()
#include "chapter-08.typ"

// પૃષ્ઠ 35–38: પ્રકરણ 9
#pagebreak()
#include "chapter-09.typ"

// પૃષ્ઠ 39–45: પ્રકરણ 10
#pagebreak()
#include "chapter-10.typ"
