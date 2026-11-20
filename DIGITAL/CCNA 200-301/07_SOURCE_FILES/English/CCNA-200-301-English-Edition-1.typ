#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "RTechLab Cisco CCNA 200-301 Master Guide (Edition 1)",
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
  title: "Cisco CCNA 200-301 Master Guide",
  edition: "2027 Master Edition · Edition 1 Commercial Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-CCNA-ED1"
)

// PAGE 2: BLUEPRINT
#include "../07_PUBLISHING_ENGINE/blueprint-v5.typ"

// CHAPTER 1
#pagebreak()
#include "chapter-01.typ"

// CHAPTER 2
#pagebreak()
#include "chapter-02.typ"

// CHAPTER 3
#pagebreak()
#include "chapter-03.typ"

// CHAPTER 4
#pagebreak()
#include "chapter-04.typ"

// CHAPTER 5
#pagebreak()
#include "chapter-05.typ"

// CHAPTER 6
#pagebreak()
#include "chapter-06.typ"

// CHAPTER 7
#pagebreak()
#include "chapter-07.typ"

// CHAPTER 8
#pagebreak()
#include "chapter-08.typ"

// CHAPTER 9
#pagebreak()
#include "chapter-09.typ"

// CHAPTER 10
#pagebreak()
#include "chapter-10.typ"

// CHAPTER 11
#pagebreak()
#include "chapter-11.typ"

// CHAPTER 12
#pagebreak()
#include "chapter-12.typ"

// CHAPTER 13
#pagebreak()
#include "chapter-13.typ"

// CHAPTER 14
#pagebreak()
#include "chapter-14.typ"

// CHAPTER 15
#pagebreak()
#include "chapter-15.typ"

// CHAPTER 16
#pagebreak()
#include "chapter-16.typ"
