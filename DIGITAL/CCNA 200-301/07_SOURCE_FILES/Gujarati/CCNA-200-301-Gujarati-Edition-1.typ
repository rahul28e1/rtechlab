#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5-gu.typ": rtech-cover-v5-gu

#set document(
  title: "RTechLab Cisco CCNA 200-301 Master Guide - Gujarati (Edition 1)",
  author: "Rahul Patel"
)

// PAGE 1: COVER (GUJARATI)
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
  title: "સિસ્કો CCNA 200-301 માસ્ટર ગાઇડ",
  edition: "2027 માસ્ટર આવૃત્તિ · આવૃત્તિ 1 વાણિજ્યિક રિલીઝ (ગુજરાતી)",
  author: "રાહુલ પટેલ",
  subject-code: "RTL-2027-CCNA-ED1-GU"
)

#set text(font: ("Segoe UI", "Shruti", "Nirmala UI", "Arial"), lang: "gu")

// PAGE 2: BLUEPRINT (GUJARATI)
#include "../07_PUBLISHING_ENGINE/blueprint-v5-gu.typ"

// CHAPTER 1 (GUJARATI)
#pagebreak()
#include "chapter-01.typ"

// CHAPTER 2 (GUJARATI)
#pagebreak()
#include "chapter-02.typ"

// CHAPTER 3 (GUJARATI)
#pagebreak()
#include "chapter-03.typ"

// CHAPTER 4 (GUJARATI)
#pagebreak()
#include "chapter-04.typ"

// CHAPTER 5 (GUJARATI)
#pagebreak()
#include "chapter-05.typ"

// CHAPTER 6 (GUJARATI)
#pagebreak()
#include "chapter-06.typ"

// CHAPTER 7 (GUJARATI)
#pagebreak()
#include "chapter-07.typ"

// CHAPTER 8 (GUJARATI)
#pagebreak()
#include "chapter-08.typ"

// CHAPTER 9 (GUJARATI)
#pagebreak()
#include "chapter-09.typ"

// CHAPTER 10 (GUJARATI)
#pagebreak()
#include "chapter-10.typ"

// CHAPTER 11 (GUJARATI)
#pagebreak()
#include "chapter-11.typ"

// CHAPTER 12 (GUJARATI)
#pagebreak()
#include "chapter-12.typ"

// CHAPTER 13 (GUJARATI)
#pagebreak()
#include "chapter-13.typ"

// CHAPTER 14 (GUJARATI)
#pagebreak()
#include "chapter-14.typ"

// CHAPTER 15 (GUJARATI)
#pagebreak()
#include "chapter-15.typ"

// CHAPTER 16 (GUJARATI)
#pagebreak()
#include "chapter-16.typ"
