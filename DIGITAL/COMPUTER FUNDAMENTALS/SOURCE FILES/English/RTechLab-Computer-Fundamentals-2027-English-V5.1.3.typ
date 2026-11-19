#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "RTechLab Computer Fundamentals 2027 Master Edition (V5.1.3)",
  author: "Rahul Patel"
)

// PAGE 1: COVER
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5()

// PAGE 2 ONWARDS: PUBLISHING THEME APPLIED
#show: rtech-book.with(
  title: "Computer Fundamentals 2027",
  edition: "2027 Master Edition · V5.1.3 Commercial Digital Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-FUND-V5.1.3"
)

// PAGE 2: BLUEPRINT
#include "../07_PUBLISHING_ENGINE/blueprint-v5.typ"

// PAGES 3–6: CHAPTER 1
#pagebreak()
#include "chapter-01.typ"

// PAGES 7–10: CHAPTER 2
#pagebreak()
#include "chapter-02.typ"

// PAGES 11–14: CHAPTER 3
#pagebreak()
#include "chapter-03.typ"

// PAGES 15–18: CHAPTER 4
#pagebreak()
#include "chapter-04.typ"

// PAGES 19–22: CHAPTER 5
#pagebreak()
#include "chapter-05.typ"

// PAGES 23–26: CHAPTER 6
#pagebreak()
#include "chapter-06.typ"

// PAGES 27–30: CHAPTER 7
#pagebreak()
#include "chapter-07.typ"

// PAGES 31–34: CHAPTER 8
#pagebreak()
#include "chapter-08.typ"

// PAGES 35–38: CHAPTER 9
#pagebreak()
#include "chapter-09.typ"

// PAGES 39–45: CHAPTER 10
#pagebreak()
#include "chapter-10.typ"
