#import "../07_PUBLISHING_ENGINE/master-theme.typ": *
#import "../07_PUBLISHING_ENGINE/cover-v5.typ": rtech-cover-v5

#set document(
  title: "Top 100 Office 365 Shortcuts & 50 MIS Interview Vault",
  author: "Rahul Patel"
)

// COVER
#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 0cm, bottom: 0cm, left: 0cm, right: 0cm),
  header: none,
  footer: none
)
#rtech-cover-v5(
  title: "TOP 100 SHORTCUTS & 50 MIS INTERVIEW VAULT",
  subtitle: "Corporate Cheat Sheet · Word, Excel, PowerPoint & Cloud Ecosystem · Career Accelerator Edition",
  edition: "2027 STANDALONE SPECIAL RELEASE"
)

#show: rtech-book.with(
  title: "Top 100 Shortcuts & 50 MIS Interview Vault",
  edition: "2027 Master Edition · Commercial Release",
  author: "Rahul Patel",
  subject-code: "RTL-2027-O365-VAULT"
)

#include "chapter-31.typ"
#pagebreak()
#include "chapter-32.typ"
