#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-cover-v5

#set document(
  title: "RTechLab Cisco CCNA 200-301 Master Guide - Hindi (Edition 1)",
  author: "Rahul Patel"
)

// PAGE 1: COVER (HINDI)
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
  title: "सिस्को CCNA 200-301 मास्टर गाइड",
  edition: "2027 मास्टर संस्करण · संस्करण 1 वाणिज्यिक रिलीज",
  author: "राहुल पटेल",
  subject-code: "RTL-2027-CCNA-ED1-HI"
)

// PAGE 2: BLUEPRINT (HINDI)
#include "../07_PUBLISHING_ENGINE/blueprint-v5-hi.typ"

// CHAPTER 1 (HINDI)
#pagebreak()
#include "chapter-01.typ"

// CHAPTER 2 (HINDI)
#pagebreak()
#include "chapter-02.typ"

// CHAPTER 3 (HINDI)
#pagebreak()
#include "chapter-03.typ"

// CHAPTER 4 (HINDI)
#pagebreak()
#include "chapter-04.typ"

// CHAPTER 5 (HINDI)
#pagebreak()
#include "chapter-05.typ"

// CHAPTER 6 (HINDI)
#pagebreak()
#include "chapter-06.typ"

// CHAPTER 7 (HINDI)
#pagebreak()
#include "chapter-07.typ"

// CHAPTER 8 (HINDI)
#pagebreak()
#include "chapter-08.typ"

// CHAPTER 9 (HINDI)
#pagebreak()
#include "chapter-09.typ"

// CHAPTER 10 (HINDI)
#pagebreak()
#include "chapter-10.typ"

// CHAPTER 11 (HINDI)
#pagebreak()
#include "chapter-11.typ"

// CHAPTER 12 (HINDI)
#pagebreak()
#include "chapter-12.typ"

// CHAPTER 13 (HINDI)
#pagebreak()
#include "chapter-13.typ"

// CHAPTER 14 (HINDI)
#pagebreak()
#include "chapter-14.typ"

// CHAPTER 15 (HINDI)
#pagebreak()
#include "chapter-15.typ"

// CHAPTER 16 (HINDI)
#pagebreak()
#include "chapter-16.typ"
