#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5-gu.typ": rtech-cover-v5-gu

#set document(
  title: "આરટેક લેબ માઈક્રોસોફ્ટ ઓફિસ 365 એન્ટરપ્રાઇઝ માસ્ટર ગાઇડ (આવૃત્તિ 1)",
  author: "રાહુલ પટેલ"
)

// PAGE 1: COVER
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5-gu()

// PAGE 2 ONWARDS: PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "માઈક્રોસોફ્ટ ઓફિસ 365 એન્ટરપ્રાઇઝ માસ્ટર ગાઇડ",
  edition: "2027 માસ્ટર આવૃત્તિ · આવૃત્તિ 1 કોમર્શિયલ રિલીઝ (ગુજરાતી)",
  author: "રાહુલ પટેલ",
  subject-code: "RTL-2027-O365-ED1-GU"
)

#set text(font: ("Segoe UI", "Shruti", "Nirmala UI", "Arial"), lang: "gu")

// PAGE 2: BLUEPRINT
#include "../07_PUBLISHING_ENGINE/blueprint-v5-gu.typ"

// CHAPTERS 01 TO 32
#pagebreak()
#include "chapter-01.typ"
#pagebreak()
#include "chapter-02.typ"
#pagebreak()
#include "chapter-03.typ"
#pagebreak()
#include "chapter-04.typ"
#pagebreak()
#include "chapter-05.typ"
#pagebreak()
#include "chapter-06.typ"
#pagebreak()
#include "chapter-07.typ"
#pagebreak()
#include "chapter-08.typ"
#pagebreak()
#include "chapter-09.typ"
#pagebreak()
#include "chapter-10.typ"
#pagebreak()
#include "chapter-11.typ"
#pagebreak()
#include "chapter-12.typ"
#pagebreak()
#include "chapter-13.typ"
#pagebreak()
#include "chapter-14.typ"
#pagebreak()
#include "chapter-15.typ"
#pagebreak()
#include "chapter-16.typ"
#pagebreak()
#include "chapter-17.typ"
#pagebreak()
#include "chapter-18.typ"
#pagebreak()
#include "chapter-19.typ"
#pagebreak()
#include "chapter-20.typ"
#pagebreak()
#include "chapter-21.typ"
#pagebreak()
#include "chapter-22.typ"
#pagebreak()
#include "chapter-23.typ"
#pagebreak()
#include "chapter-24.typ"
#pagebreak()
#include "chapter-25.typ"
#pagebreak()
#include "chapter-26.typ"
#pagebreak()
#include "chapter-27.typ"
#pagebreak()
#include "chapter-28.typ"
#pagebreak()
#include "chapter-29.typ"
#pagebreak()
#include "chapter-30.typ"
#pagebreak()
#include "chapter-31.typ"
#pagebreak()
#include "chapter-32.typ"
