import React from 'react';
import { Link } from 'react-router-dom';
import { SEOHead } from '../components/SEOHead';

// Change these two lines when the public inbox or the policy changes.
const SUPPORT_EMAIL = 'hello@rtechlab.com';
const LAST_UPDATED = '15 November 2026';

const PAGES = {
  privacy: {
    title: 'Privacy Policy | RTechLab',
    description:
      'How RTechLab handles your data: what is stored in your browser, what analytics and advertising partners collect, and the choices you have.',
    canonicalPath: '/privacy',
    heading: 'Privacy Policy',
    intro:
      'RTechLab is a free education site. You do not need an account to use it, and the interactive lessons run inside your own browser. This page explains exactly what is collected, why, and how you can control it.',
    sections: [
      {
        heading: 'What we do not collect',
        body: [
          'There is no sign-up, no login, and no student profile. Tool inputs (subnet ranges, DNS names you look up, terminal practice commands) are processed in your browser or sent only to the resolver needed to answer that request; they are not stored on our servers.',
        ],
      },
      {
        heading: 'Stored in your browser',
        body: [
          'Learning progress, language preference and similar settings are kept in your browser local storage. That data stays on your device, is never uploaded, and disappears if you clear site data.',
        ],
      },
      {
        heading: 'Analytics',
        body: [
          'We use privacy-respecting analytics to understand which lessons and tools are useful. Aggregate information such as page views, approximate country, device type and referring source may be processed by our analytics provider. We do not attempt to identify individual visitors.',
        ],
      },
      {
        heading: 'Advertising (Google AdSense)',
        body: [
          'RTechLab may display advertising through Google AdSense and its partners to keep the site free.',
          'Third-party vendors, including Google, use cookies to serve ads based on your prior visits to this and other websites.',
          "Google's use of advertising cookies enables it and its partners to serve ads to you based on your visit to this site and/or other sites on the Internet.",
          'You may opt out of personalised advertising by visiting Google Ads Settings (adssettings.google.com) or aboutads.info. Opting out does not remove ads; it makes them less relevant.',
          'Where required by law, we ask for consent before setting advertising cookies, and you can change or withdraw that consent at any time.',
        ],
      },
      {
        heading: 'Cookies',
        body: [
          'Strictly necessary storage keeps the site working. Analytics and advertising cookies are optional and are only used where consent is required and given. You can block or delete cookies in your browser settings without losing access to the lessons.',
        ],
      },
      {
        heading: 'Children',
        body: [
          'RTechLab is written for students of networking and IT, generally 16 and above. We do not knowingly collect personal information from children. If you believe a child has provided personal information, write to us and we will delete it.',
        ],
      },
      {
        heading: 'Your rights',
        body: [
          'Depending on where you live, you may have the right to access, correct, delete or restrict processing of your personal data, and to object to direct marketing. Because we do not maintain accounts, most requests concern analytics or advertising data handled by those providers; we will help you exercise those rights.',
        ],
      },
      {
        heading: 'Changes to this policy',
        body: ['If this policy changes materially, the update date at the top of the page changes as well.'],
      },
      {
        heading: 'Contact',
        body: ['Questions about privacy can be sent to ' + SUPPORT_EMAIL + '.'],
      },
    ],
  },

  terms: {
    title: 'Terms of Use | RTechLab',
    description:
      'The terms that apply when you use RTechLab lessons, interactive labs and free network tools.',
    canonicalPath: '/terms',
    heading: 'Terms of Use',
    intro:
      'By using RTechLab you agree to these terms. They exist so that a free, educational site can stay useful and safe for everyone.',
    sections: [
      {
        heading: 'Educational purpose',
        body: [
          'All lessons, diagrams, lab walkthroughs and tools are provided for learning. They are teaching material, not professional advice, and they are not a substitute for vendor documentation or a change-management process in a production network.',
        ],
      },
      {
        heading: 'Labs and commands',
        body: [
          'Commands and configurations shown here are meant for practice devices, simulators and homelabs. Running them on equipment you do not own or administer, or on a production network without approval, is your responsibility. Test in a lab first.',
        ],
      },
      {
        heading: 'Acceptable use of the tools',
        body: [
          'The free tools may be used for study, teaching and personal troubleshooting. You may not use them to attack, scan or overload systems you do not own, to bypass rate limits, to scrape the site at volume, or to resell the tools as your own service.',
        ],
      },
      {
        heading: 'No warranty',
        body: [
          'The site is provided "as is". We work to keep explanations accurate, but we do not warrant that any page is error-free, complete or current, or that a tool will produce a particular result in your environment.',
        ],
      },
      {
        heading: 'Limitation of liability',
        body: [
          'To the extent permitted by law, RTechLab is not liable for indirect or consequential loss, or for loss of data, revenue or uptime, arising from use of the site or reliance on its content.',
        ],
      },
      {
        heading: 'Intellectual property',
        body: [
          'The written lessons, diagrams and tool interfaces belong to RTechLab. You may quote short excerpts with a link back and attribution. You may not republish whole lessons, or repackage the tools, without written permission.',
          'Cisco, Microsoft, Linux, Amazon Web Services, Google and other names are trademarks of their respective owners. RTechLab is independent and is not endorsed by them.',
        ],
      },
      {
        heading: 'Third-party links and ads',
        body: [
          'Some pages link to external resources and display advertising. We are not responsible for the content or practices of third-party sites.',
        ],
      },
      {
        heading: 'Changes',
        body: [
          'We may update these terms as the site grows. Continued use after an update means you accept the revised terms. Questions: ' + SUPPORT_EMAIL + '.',
        ],
      },
    ],
  },

  disclaimer: {
    title: 'Disclaimer | RTechLab',
    description:
      'RTechLab is an independent educational resource. Read what the lessons, lab traces and vendor references do and do not represent.',
    canonicalPath: '/disclaimer',
    heading: 'Disclaimer',
    intro:
      'Short version: this is a teaching site, built independently, with illustrative traces rather than captures from your network.',
    sections: [
      {
        heading: 'Independent publication',
        body: [
          'RTechLab is not affiliated with, endorsed by, or sponsored by Cisco, Microsoft, Apple, Google, Amazon Web Services, the Linux Foundation or any other vendor mentioned on the site. Certification names are used only to describe what a lesson prepares you for.',
        ],
      },
      {
        heading: 'Illustrative packet traces',
        body: [
          'The Protocol Explorer, packet tables, timings and addresses are teaching scenarios generated in your browser. They are not packet captures, no traffic leaves your device for those lessons, and a single step may group several real wire messages for readability.',
        ],
      },
      {
        heading: 'Tools and results',
        body: [
          'Subnet, binary, port and DNS tools are provided for study. DNS lookups contact a public resolver in order to answer your query. Results can differ from what a specific operating system, firewall or registrar returns.',
        ],
      },
      {
        heading: 'No professional advice',
        body: [
          'Nothing here is legal, security, compliance or career advice. For decisions about a real network, follow your organisation’s policy and the vendor’s documentation.',
        ],
      },
      {
        heading: 'Advertising',
        body: [
          'The site is supported by advertising and, on some pages, affiliate links. Advertising does not influence which protocols we teach or how a lesson is written. Sponsored or affiliate relationships are disclosed where they appear.',
        ],
      },
      {
        heading: 'Report an error',
        body: ['If something is wrong or outdated, write to ' + SUPPORT_EMAIL + ' and we will correct it.'],
      },
    ],
  },

  'editorial-policy': {
    title: 'Editorial Policy | RTechLab',
    description:
      'How RTechLab lessons are researched, written, reviewed and corrected, and how advertising is kept separate from teaching.',
    canonicalPath: '/editorial-policy',
    heading: 'Editorial Policy',
    intro:
      'Students use these pages to prepare for exams and to troubleshoot real equipment. That is why every lesson has to be checkable, not just readable.',
    sections: [
      {
        heading: 'How a lesson is built',
        body: [
          'Each lesson starts from primary sources: RFCs, IANA registries, vendor documentation and hands-on behaviour in a lab. The explanation is then reduced to the smallest correct sequence of events, and the diagram is built around that sequence so the animation cannot teach something the text does not say.',
        ],
      },
      {
        heading: 'Review and testing',
        body: [
          'Protocol flows are checked against a real capture or a simulator run before publishing. Tool output is tested with known values — for example, a /26 split, a 192.168/16 range, and malformed input — so that edge cases fail loudly instead of quietly returning a wrong answer.',
        ],
      },
      {
        heading: 'Corrections',
        body: [
          'When a mistake is reported, we verify it, fix the page and the diagram together, and note the change date. Substantive corrections are never silently rewritten to look as if the error never existed.',
        ],
      },
      {
        heading: 'Language',
        body: [
          'Lessons are written in English and Hindi. The Hindi version explains the same technical facts; it is not a machine translation of marketing copy.',
        ],
      },
      {
        heading: 'Advertising and independence',
        body: [
          'Ads are labelled as advertising and never placed inside an interactive diagram, a code block or a quiz question. Advertisers have no input into lesson content. Affiliate links, where used, are disclosed next to the link.',
        ],
      },
      {
        heading: 'AI assistance',
        body: [
          'Drafting and diagram code may be assisted by software tools, but technical claims are checked by a human against the sources above before a lesson is published. If you find a claim that does not match the RFC or the vendor documentation, report it.',
        ],
      },
    ],
  },

  contact: {
    title: 'Contact RTechLab',
    description:
      'Reach the RTechLab team for corrections, lesson requests, partnerships or advertising enquiries.',
    canonicalPath: '/contact',
    heading: 'Contact',
    intro:
      'Corrections, lesson requests and partnership questions all go to the same inbox. A specific subject line gets a faster answer.',
    sections: [
      {
        heading: 'Email',
        body: ['Write to ' + SUPPORT_EMAIL + '. We usually reply within two to three working days.'],
      },
      {
        heading: 'Report a technical error',
        body: [
          'Include the page URL, the step or field that looks wrong, and what you expected instead. A capture or a screenshot helps. Technical corrections are prioritised over everything else.',
        ],
      },
      {
        heading: 'Request a lesson or a tool',
        body: [
          'Tell us the protocol, certification topic or calculator you need, and what you are studying for. Requests that fit an existing series are scheduled first.',
        ],
      },
      {
        heading: 'Partnerships and advertising',
        body: [
          'For sponsorships, affiliate programmes or content collaborations, write to the same address with "Partnership" in the subject. We only accept partners relevant to networking, cloud, security or IT education, and sponsored content is always labelled.',
        ],
      },
      {
        heading: 'Privacy requests',
        body: ['Data access or deletion requests: same inbox, subject "Privacy". See the Privacy Policy for what is stored where.'],
      },
    ],
  },
};

export const LegalPage = ({ kind }) => {
  const page = PAGES[kind] || PAGES.privacy;

  return (
    <div className="pt-28 pb-24">
      <SEOHead
        title={page.title}
        description={page.description}
        canonicalPath={page.canonicalPath}
        ogImage="/brand/rtechlab-master.png"
      />

      <div className="max-w-3xl mx-auto px-6">
        <p className="text-[11px] uppercase tracking-[0.2em] text-[#6e6e73] mb-4">RTechLab · Legal</p>
        <h1 className="text-4xl sm:text-5xl font-semibold tracking-tight text-white">{page.heading}</h1>
        <p className="mt-5 text-[17px] leading-relaxed text-[#a1a1a6]">{page.intro}</p>
        <p className="mt-4 text-[12px] text-[#6e6e73]">Last updated: {LAST_UPDATED}</p>

        <div className="mt-14 space-y-12">
          {page.sections.map((section) => (
            <section key={section.heading}>
              <h2 className="text-[19px] font-semibold text-white tracking-tight">{section.heading}</h2>
              <div className="mt-3 space-y-3">
                {section.body.map((paragraph) => (
                  <p key={paragraph} className="text-[15px] leading-relaxed text-[#a1a1a6]">
                    {paragraph}
                  </p>
                ))}
              </div>
            </section>
          ))}
        </div>

        <div className="mt-16 pt-8 border-t border-white/[0.08] flex flex-wrap gap-x-6 gap-y-3 text-[13px] text-[#6e6e73]">
          <Link to="/privacy" className="hover:text-white transition-colors">
            Privacy
          </Link>
          <Link to="/terms" className="hover:text-white transition-colors">
            Terms
          </Link>
          <Link to="/disclaimer" className="hover:text-white transition-colors">
            Disclaimer
          </Link>
          <Link to="/editorial-policy" className="hover:text-white transition-colors">
            Editorial Policy
          </Link>
          <Link to="/contact" className="hover:text-white transition-colors">
            Contact
          </Link>
          <Link to="/" className="hover:text-white transition-colors">
            Home
          </Link>
        </div>
      </div>
    </div>
  );
};
