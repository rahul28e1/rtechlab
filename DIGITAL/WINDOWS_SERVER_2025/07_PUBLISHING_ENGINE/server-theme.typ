// =============================================================================
// RTECHLAB MASTER TYPST THEME — MICROSOFT WINDOWS SERVER 2025 MASTER SUITE
// Unified Light Design System · Strict 100% Light Academic Theme
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-navy = rgb("#0F172A")        // Slate 900 (Main text)
#let rtech-blue = rgb("#0284C7")        // Sky 600 (Windows / Microsoft Blue)
#let rtech-azure = rgb("#0078D4")       // Microsoft Azure Blue
#let rtech-teal = rgb("#0E7490")        // Cyan / Teal 700
#let rtech-emerald = rgb("#059669")     // Emerald 600 (Verified / Success)
#let rtech-amber = rgb("#D97706")       // Amber 600 (Caution / Enterprise Rules)
#let rtech-rose = rgb("#DC2626")        // Rose 600 (Alerts / Security)
#let rtech-paper = white                // Pure Clean Crisp White
#let rtech-text = rgb("#1E293B")        // Slate 800
#let rtech-muted = rgb("#475569")       // Slate 600
#let rtech-border = rgb("#E2E8F0")      // Clean subtle border

// Master Book Wrapper Function
#let rtech-server-book(
  title: "Windows Server 2025 & Active Directory Master Handbook",
  subtitle: "Client-Server Architecture · AD DS · GPO · DNS · DHCP · Storage Spaces · Hybrid Azure Arc · Top 50 MNC Placement Vault",
  author: "Rahul Patel",
  edition: "2027 Comprehensive Master Edition · RTechLab Publication",
  subject-code: "RTL-2027-WINSRV-ED1",
  lang: "hi",
  body
) = {
  set page(
    paper: "a4",
    margin: (x: 12mm, top: 15mm, bottom: 13mm),
    fill: rtech-paper,
    
    // Light Watermark on Content Pages
    background: context {
      let page-num = counter(page).get().first()
      if page-num > 1 {
        place(
          center + horizon,
          rotate(
            -30deg,
            block(
              align(center)[
                #text(size: 32pt, weight: "black", fill: rgb(2, 132, 199, 4%), tracking: 3pt)[
                  RTECHLAB
                ]
                #v(4pt)
                #text(size: 13pt, weight: "bold", fill: rgb(15, 23, 42, 3%), tracking: 4pt)[
                  WINDOWS SERVER 2025 MASTER SUITE
                ]
              ]
            )
          )
        )
      }
    },
    
    // Universal Light Header with Breadcrumb & Direct Index Link
    header: context {
      let page-num = counter(page).get().first()
      if page-num > 2 {
        block(
          width: 100%,
          stroke: (bottom: 0.5pt + rgb("#CBD5E1")),
          inset: (bottom: 2mm),
          [
            #grid(
              columns: (1fr, auto),
              align: (left, right),
              [
                #text(size: 8pt, weight: "black", fill: rtech-navy)[RTECHLAB]
                #text(size: 8pt, fill: rtech-blue, weight: "bold")[ | Windows Server 2025 Master Suite]
              ],
              [
                #link(<table-of-contents>)[
                  #text(size: 7.5pt, font: ("Segoe UI", "Nirmala UI", "Arial"), fill: rtech-blue, weight: "bold")[
                    ⮌ Index (विषय सूची)
                  ]
                ]
                #text(size: 7.5pt, fill: rgb("#94A3B8"))[ · ]
                #text(size: 7.5pt, font: ("Segoe UI", "Nirmala UI", "Arial"), fill: rtech-muted)[
                  #author
                ]
              ]
            )
          ]
        )
      }
    },
    
    // Universal Light Footer
    footer: context {
      let page-num = counter(page).get().first()
      if page-num > 1 {
        block(
          width: 100%,
          stroke: (top: 0.5pt + rgb("#CBD5E1")),
          inset: (top: 2mm),
          [
            #grid(
              columns: (1fr, auto),
              align: (left, right),
              [
                #text(size: 7pt, font: ("Segoe UI", "Nirmala UI", "Arial"), fill: rtech-muted)[
                  #text(fill: rtech-blue)[●] Windows Server 2025 Enterprise Administration · Zero-Fluff Placement Engine · RTechLab
                ]
              ],
              [
                #text(size: 8pt, font: ("JetBrains Mono", "Consolas"), weight: "bold", fill: rtech-navy)[
                  Page #page-num
                ]
              ]
            )
          ]
        )
      }
    }
  )

  // Document Styling
  set text(
    font: ("Segoe UI", "Nirmala UI", "Arial"),
    size: 9.5pt,
    fill: rtech-text,
    spacing: 110%,
    lang: "hi"
  )

  set par(
    justify: true,
    leading: 0.65em,
    first-line-indent: 0pt
  )

  body
}

// -----------------------------------------------------------------------------
// STUDENT STUDY HIGHLIGHTER & UNDERLINE ENGINE (Yellow, Light Orange, Light Green)
// -----------------------------------------------------------------------------

// Highlighter Markers (Background Tint)
#let hl-yellow(body) = highlight(fill: rgb("#FEF08A"), radius: 2.5pt)[#body]
#let hl-orange(body) = highlight(fill: rgb("#FFEDD5"), radius: 2.5pt)[#body]
#let hl-green(body) = highlight(fill: rgb("#DCFCE7"), radius: 2.5pt)[#body]

// Textbook Study Marker Underline
#let ul-yellow(body) = underline(stroke: 2.2pt + rgb("#EAB308"), offset: 2.2pt)[#body]
#let ul-orange(body) = underline(stroke: 2.2pt + rgb("#F97316"), offset: 2.2pt)[#body]
#let ul-green(body) = underline(stroke: 2.2pt + rgb("#22C55E"), offset: 2.2pt)[#body]

// Combined Marker Underline (Highlight fill + crisp stroke underline)
#let mark-yellow(body) = highlight(fill: rgb("#FEF9C3"), radius: 2.5pt)[#underline(stroke: 1.8pt + rgb("#FACC15"), offset: 1.8pt)[#body]]
#let mark-orange(body) = highlight(fill: rgb("#FFF7ED"), radius: 2.5pt)[#underline(stroke: 1.8pt + rgb("#FB923C"), offset: 1.8pt)[#body]]
#let mark-green(body) = highlight(fill: rgb("#F0FDF4"), radius: 2.5pt)[#underline(stroke: 1.8pt + rgb("#4ADE80"), offset: 1.8pt)[#body]]

// Short Aliases
#let hl-y = hl-yellow
#let hl-o = hl-orange
#let hl-g = hl-green

// -----------------------------------------------------------------------------
// CALLOUT BOXES & CARDS
// -----------------------------------------------------------------------------

#let info-box(title: "महत्वपूर्ण संकल्पना (Core Concept)", body) = {
  block(
    width: 100%,
    fill: rgb("#F0F9FF"),
    stroke: (left: 3.5pt + rtech-blue, rest: 0.5pt + rgb("#BAE6FD")),
    radius: (right: 4pt),
    inset: (x: 10pt, y: 8pt),
    outset: 0pt,
    [
      #text(size: 9.5pt, weight: "bold", fill: rtech-blue)[#title]
      #v(2pt)
      #text(size: 9pt, fill: rtech-navy)[#body]
    ]
  )
}

#let warning-box(title: "चेतावनी एवं सुरक्षा नियम (Critical Warning)", body) = {
  block(
    width: 100%,
    fill: rgb("#FFFBEB"),
    stroke: (left: 3.5pt + rtech-amber, rest: 0.5pt + rgb("#FDE68A")),
    radius: (right: 4pt),
    inset: (x: 10pt, y: 8pt),
    outset: 0pt,
    [
      #text(size: 9.5pt, weight: "bold", fill: rtech-amber)[⚠️ #title]
      #v(2pt)
      #text(size: 9pt, fill: rtech-navy)[#body]
    ]
  )
}

#let pro-tip(title: "SysAdmin Pro-Tip & Shortcut", body) = {
  block(
    width: 100%,
    fill: rgb("#F0FDF4"),
    stroke: (left: 3.5pt + rtech-emerald, rest: 0.5pt + rgb("#BBF7D0")),
    radius: (right: 4pt),
    inset: (x: 10pt, y: 8pt),
    outset: 0pt,
    [
      #text(size: 9.5pt, weight: "bold", fill: rtech-emerald)[⚡ #title]
      #v(2pt)
      #text(size: 9pt, fill: rtech-navy)[#body]
    ]
  )
}

#let did-you-know(fact) = {
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: 0.8pt + rgb("#CBD5E1"),
    radius: 5pt,
    inset: (x: 10pt, y: 8pt),
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 8pt,
        align: (top, left),
        [
          #text(size: 16pt)[💡]
        ],
        [
          #text(size: 9.5pt, weight: "black", fill: rtech-navy)[Did You Know? (क्या आप जानते हैं?)]
          #v(1.5pt)
          #text(size: 8.8pt, fill: rtech-text)[#fact]
        ]
      )
    ]
  )
}

#let mcq-item(num: "1", q: "", optA: "", optB: "", optC: "", optD: "", ans: "", exp: "") = {
  block(
    width: 100%,
    fill: white,
    stroke: 0.5pt + rgb("#E2E8F0"),
    radius: 4pt,
    inset: (x: 8pt, y: 6pt),
    [
      #text(weight: "bold", fill: rtech-navy, size: 9pt)[Q#num. #q]
      #v(3pt)
      #grid(
        columns: (1fr, 1fr),
        gutter: 4pt,
        [#text(size: 8.5pt)[(A) #optA]],
        [#text(size: 8.5pt)[(B) #optB]],
        [#text(size: 8.5pt)[(C) #optC]],
        [#text(size: 8.5pt)[(D) #optD]]
      )
      #v(3pt)
      #block(
        fill: rgb("#F1F5F9"),
        inset: (x: 6pt, y: 3pt),
        radius: 3pt,
        width: 100%,
        [
          #text(size: 8pt, weight: "bold", fill: rtech-emerald)[उत्तर: (#ans)]
          #h(6pt)
          #text(size: 8pt, fill: rtech-muted)[#exp]
        ]
      )
    ]
  )
}

#let interview-item(num: "1", q: "", a: "", tip: "") = {
  block(
    width: 100%,
    fill: white,
    stroke: 0.5pt + rgb("#E2E8F0"),
    radius: 4pt,
    inset: (x: 8pt, y: 6pt),
    [
      #text(weight: "bold", fill: rtech-blue, size: 9pt)[Q#num. #q]
      #v(2.5pt)
      #text(size: 8.8pt, fill: rtech-navy)[#a]
      #if tip != "" [
        #v(2.5pt)
        #text(size: 8pt, weight: "bold", fill: rtech-amber)[🎯 MNC Interview Strategy: ]
        #text(size: 8pt, fill: rtech-muted)[#tip]
      ]
    ]
  )
}

#let step-screenshot(step-num: "Step 1", title: "", img-path: "", caption: "") = {
  block(
    width: 100%,
    stroke: 0.6pt + rgb("#CBD5E1"),
    radius: 5pt,
    fill: white,
    inset: 6pt,
    [
      #grid(
        columns: (auto, 1fr),
        gutter: 6pt,
        align: (horizon, horizon),
        [
          #block(
            fill: rtech-blue,
            inset: (x: 6pt, y: 2.5pt),
            radius: 3pt,
            [#text(size: 8pt, weight: "bold", fill: white)[#step-num]]
          )
        ],
        [
          #text(size: 9pt, weight: "bold", fill: rtech-navy)[#title]
        ]
      )
      #v(4pt)
      #align(center)[
        #image(img-path, width: 95%)
      ]
      #if caption != "" [
        #v(2pt)
        #align(center)[
          #text(size: 7.5pt, fill: rtech-muted, style: "italic")[#caption]
        ]
      ]
    ]
  )
}
