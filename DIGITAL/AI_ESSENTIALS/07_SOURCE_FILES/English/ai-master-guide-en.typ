#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "Artificial Intelligence Essentials & Career Accelerator (Edition 1)",
  author: "Rahul Patel"
)

// PAGE 1: COVER
#set page(
  paper: "a4",
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5()

// PAGE 2 ONWARDS: PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "Artificial Intelligence Essentials & Career Accelerator",
  edition: "2027 Master Edition · Commercial Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-AI-ESS"
)

// PAGE 2: BLUEPRINT
#include "../07_PUBLISHING_ENGINE/blueprint-v5.typ"

// CHAPTERS 01 TO 42 (PAGES 3 TO 44)
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
#pagebreak()
#include "chapter-33.typ"
#pagebreak()
#include "chapter-34.typ"
#pagebreak()
#include "chapter-35.typ"
#pagebreak()
#include "chapter-36.typ"
#pagebreak()
#include "chapter-37.typ"
#pagebreak()
#include "chapter-38.typ"
#pagebreak()
#include "chapter-39.typ"
#pagebreak()
#include "chapter-40.typ"
#pagebreak()
#include "chapter-41.typ"
#pagebreak()
#include "chapter-42.typ"
