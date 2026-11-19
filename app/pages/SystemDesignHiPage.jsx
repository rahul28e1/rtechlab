import React from 'react';
import { Link } from 'react-router';
import { toolsByCategory } from '../../src/data/toolCatalog';
import { SystemDesignSimulatorsGrid } from '../components/SystemDesignSimulatorsGrid';

const SIMULATORS = toolsByCategory('system-design');

const COPY = {
  featured: 'यहाँ से शुरू करें',
  open: 'सिम्युलेटर खोलें',
};

// The simulator UI itself is English; only the labels and the framing are
// translated so the page is readable in Hindi without breaking the tools.
const HINDI = {
  'request-journey': {
    name: 'रिक्वेस्ट जर्नी सिमुलेटर',
    blurb: 'एक पेज लोड DNS से लेकर TLS, सर्वर प्रोसेसिंग और डाउनलोड तक हॉप-दर-हॉप देखें और मिलीसेकंड कहाँ जा रहे हैं, यह पता करें।',
  },
  'load-balancer-sim': {
    name: 'लोड बैलेंसर सिमुलेटर',
    blurb: 'राउंड रॉबिन, लीस्ट कनेक्शन और कंसिस्टेंट हैशिंग में ट्रैफिक भेजें और चार सर्वर पर उसका बँटवारा देखें।',
  },
  'autoscaling-simulator': {
    name: 'लाइव ऑटोस्केलिंग सिमुलेटर',
    blurb: 'ट्रैफिक बढ़ते देखें, रिक्वेस्ट डॉट्स के रूप में सर्वर तक जाते देखें, और औसत CPU थ्रेशोल्ड पार करते ही नया सर्वर जुड़ते देखें।',
  },
  'cache-simulator': {
    name: 'कैश हिट / मिस सिमुलेटर',
    blurb: 'TTL, कैपेसिटी और हॉट-की स्क्यू के साथ 600 रिक्वेस्ट चलाएँ और असली हिट रेट, लेटेंसी और डेटाबेस लोड देखें।',
  },
  'rate-limiter': {
    name: 'टोकन बकेट रेट लिमिटर',
    blurb: 'बकेट साइज़ और रिफिल रेट किस तरह बर्स्ट सोखते हैं और कौन-सी रिक्वेस्ट 429 पाती हैं, यह देखें।',
  },
  'capacity-estimator': {
    name: 'सिस्टम कैपेसिटी एस्टिमेटर',
    blurb: 'डेली एक्टिव यूज़र्स से QPS, सर्वर, कैश साइज़, स्टोरेज ग्रोथ और एग्रेस निकालें — इंटरव्यू का बैक-ऑफ-द-एनवेलप कैलकुलेशन एक स्क्रीन में।',
  },
  'quorum-calculator': {
    name: 'क्वोरम और कंसिस्टेंसी कैलकुलेटर',
    blurb: 'N, R और W चुनें और देखें कि रीड को नया राइट दिखेगा या नहीं, और कितने नोड फेल हो सकते हैं।',
  },
};

const getHindiCopy = (tool) => HINDI[tool.slug] || { name: tool.name, blurb: tool.blurb };

export function SystemDesignHiPage() {
  return (
    <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 sm:py-16 lg:px-8">
      <p className="mb-3 text-[11px] font-semibold uppercase tracking-[0.2em] text-electric-400">
        इंटरैक्टिव सिस्टम डिज़ाइन
      </p>
      <h1 className="max-w-3xl text-4xl font-black leading-[1.15] tracking-tight text-white sm:text-5xl">
        इंटरव्यू व्हाइटबोर्ड के लिए {SIMULATORS.length} सिमुलेटर।
      </h1>
      <p className="mt-4 max-w-2xl text-sm leading-relaxed text-slate-400 sm:text-base">
        सिस्टम डिज़ाइन के हर जवाब में जो नंबर काम आते हैं — लेटेंसी, ट्रैफिक, कैश हिट रेट, क्वोरम — वे सब
        आपके ब्राउज़र में लाइव चलते हैं। एक स्लाइडर बदलिए और देखिए सिस्टम का कौन-सा हिस्सा पहले टूटता है।
      </p>
      <p className="mt-3 max-w-2xl text-xs leading-relaxed text-slate-500 sm:text-sm">
        हर सिम्युलेटर में कैमरा एंगल और ज़ूम के साथ लेबल वाला डायग्राम, और आसान भाषा में स्टेप-दर-स्टेप गाइड है
        — पढ़ने और समझने के लिए बनाया गया, सिर्फ़ खेलने के लिए नहीं।
      </p>

      <SystemDesignSimulatorsGrid simulators={SIMULATORS} copy={COPY} getCopy={getHindiCopy} />

      <p className="mt-8 text-xs leading-relaxed text-slate-500">
        सिमुलेटर का इंटरफ़ेस अंग्रेज़ी में है। पहले कॉन्सेप्ट पढ़ने हों तो{' '}
        <Link to="/hi/notes" className="font-semibold text-electric-400 hover:text-electric-300">
          रोडमैप्स देखें
        </Link>
        , या पूरा{' '}
        <Link
          to="/tools?category=system-design"
          className="font-semibold text-electric-400 hover:text-electric-300"
        >
          सिस्टम डिज़ाइन टूलकिट
        </Link>{' '}
        खोलें।
      </p>
    </div>
  );
}

export default SystemDesignHiPage;
