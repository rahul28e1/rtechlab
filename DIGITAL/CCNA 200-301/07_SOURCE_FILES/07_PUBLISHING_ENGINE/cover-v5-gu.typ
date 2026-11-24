// =============================================================================
// RTECHLAB OFFICIAL A4 COVER TEMPLATE — CISCO CCNA 200-301 (GUJARATI EDITION 1)
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#let rtech-cover-v5-gu(
  title: "સિસ્કો CCNA 200-301 માસ્ટર ગાઇડ",
  subtitle: "એન્ટરપ્રાઇઝ રૂટિંગ, સ્વિચિંગ, સબનેટિંગ, OSPF, VLAN, સુરક્ષા અને પ્લેસમેન્ટ વોલ્ટ",
  edition: "2027 માસ્ટર એડિશન · એડિશન 1 (ગુજરાતી)",
  series-pill: "આધિકારિક RTECHLAB વાણિજ્યિક પ્રકાશન · CCNA 200-301 માસ્ટર",
  author: "Rahul Patel",
  author-title: "સંસ્થાપક અને ચીફ ટેકનોલોજી આર્કિટેક્ટ, RTechLab",
  tagline-1: "Learn. Practice. Innovate.",
  tagline-2: "Enterprise Networking Made Practical.",
  subject-code: "RTL-2027-CCNA-ED1-GU",
  logo-path: "/07_SOURCE_FILES/02_BRAND_ASSETS/rtechlab-logo-transparent.png",
  hero-photo-path: "/07_SOURCE_FILES/03_VISUAL_ASSETS/authentic-hardware-photographs/server-room-datacenter.jpg"
) = {
  import "../07_PUBLISHING_ENGINE/cover-v5-hi.typ": rtech-cover-v5
  rtech-cover-v5(
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
