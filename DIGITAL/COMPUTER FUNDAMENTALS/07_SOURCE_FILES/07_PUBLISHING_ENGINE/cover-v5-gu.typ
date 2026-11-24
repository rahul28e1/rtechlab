// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — GUJARATI V5.1.4 (COMMERCIAL MASTER RELEASE)
// Premium International Academic Textbook Edition (Gujarati)
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-cover-gujarati-v5(
  title: "કમ્પ્યુટર ફંડામેન્ટલ્સ અને આર્કિટેક્ચર",
  subtitle: "સંપૂર્ણ શિક્ષણ અને તકનીકી સાક્ષાત્કાર માર્ગદર્શિકા",
  edition: "2027 માસ્ટર એડિશન · ગુજરાતી આવૃત્તિ (V5.1.4)",
  series-pill: "આધિકારિક વાણિજ્યિક પ્રકાશન · V5.1.4 પ્રોડક્શન માસ્ટર",
  author: "Rahul Patel",
  author-title: "સંસ્થાપક અને ચીફ ટેકનોલોજી આર્કિટેક્ટ, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Technology Made Practical.",
  subject-code: "RTL-2027-FUND-V5.1.4-GU",
  logo-path: "../02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "../03_VISUAL_ASSETS/authentic-hardware-photographs/motherboard-atx-overview.jpg"
) = {
  import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-cover-hindi-v5
  rtech-cover-hindi-v5(
    title: title,
    subtitle: subtitle,
    edition: edition,
    series-pill: series-pill,
    author: author,
    author-title: author-title,
    tagline-1: tagline-1,
    tagline-2: tagline-2,
    subject-code: subject-code,
    logo-path: logo-path,
    hero-photo-path: hero-photo-path
  )
}
