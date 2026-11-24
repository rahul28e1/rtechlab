#import "master-theme.typ": *

// =============================================================================
// RTECHLAB MASTER CURRICULUM BLUEPRINT — ARTIFICIAL INTELLIGENCE (HINDI EDITION 1)
// Page 2: Modern 6-Part Modular Engineering Curriculum Matrix
// Author: Rahul Patel (Founder & Chief Technology Architect, RTechLab)
// =============================================================================

#text(size: 8pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0284C7"))[ઑફિશિયલ 2027 કરિકુલમ બ્લૂપ્રિન્ટ · 42 પ્રોડક્શન મૉડ્યૂલ્સ અને હૈંડ્સ-ઑન લૈબ્સ]
#v(-2pt)
= આર્ટિફિશિયલ ઇંટેલિજેંસ: માસ્ટર એંટરપ્રાઇજ કરિકુલમ

#v(-3pt)
#text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), fill: rgb("#1E293B").lighten(15%))[
  1950 ની પાયો થી 2027 એજેંટિક AI, સ્વદેશી ઇંડિક LLMs, GPU ક્લસ્ટર્સ અને ₹38 LPA કરિયર બ્લૂપ્રિન્ટ તક 42 મૉડ્યૂલ્સ નો સંપૂર્ણ રોડમૈપ. RTechLab 2027 ડીપટેક અકાદમિક અને કૉર્પોરેટ ફ્રેમવર્ક ના તહત માનકીકૃત.
]

#v(4pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 7pt,
  [
    // MODULE 1
    #block(
      width: 100%,
      stroke: 0.5pt + rgb("#64748B"),
      radius: 4pt,
      fill: white,
      inset: (x: 6pt, y: 5pt),
      [
        #text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#box(fill: rgb("#0284C7"), inset: (x: 4pt, y: 1.5pt), radius: 2pt, text(fill: white, size: 5.8pt)[ભાગ 1]) AI નો ઇતિહાસ, પાયો અને મૂળભૂત સિદ્ધાંત]
        #v(3pt)
        #table(
          columns: (auto, 1fr),
          stroke: none,
          inset: (x: 2pt, y: 1.8pt),
          [*Ch 01*], [બુદ્ધિમાન મશીનોં ની શુરુઆત: 1950 ટ્યૂરિંગ ટેસ્ટ થી ડાર્ટમાઉથ તક],
          [*Ch 02*], [સ્વર્ણ યુગ, પર્સેપ્ટ્રૉન અને પ્રથમ AI વિન્ટર (1957–1980)],
          [*Ch 03*], [એક્સપર્ટ સિસ્ટમ્સ, નૉલેજ ઇંજીનિયરિંગ અને દ્વિતીય AI વિન્ટર],
          [*Ch 04*], [સાંખ્યિકીય AI નો પુનર્જાગરણ: ડીપ બ્લૂ થી AlexNet ક્રાંતિ (2012)],
          [*Ch 05*], [AI ની સમ્પૂર્ણ યાત્રા (1950–2027): 75 વર્ષો ની ટાઇમલાઇન],
          [*Ch 06*], [AI વર્ગીકરણ: નૈરો AI બનામ જનરલ AI (AGI) બનામ સુપરઇંટેલીજેંસ]
        )
      ]
    )

    #v(4pt)

    // MODULE 2
    #block(
      width: 100%,
      stroke: 0.5pt + rgb("#64748B"),
      radius: 4pt,
      fill: white,
      inset: (x: 6pt, y: 5pt),
      [
        #text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#box(fill: rgb("#4F46E5"), inset: (x: 4pt, y: 1.5pt), radius: 2pt, text(fill: white, size: 5.8pt)[ભાગ 2]) મશીન લર્નિંગ અને ડીપ ન્યૂરલ નેટવર્ક્સ ની કોર ગણિત]
        #v(3pt)
        #table(
          columns: (auto, 1fr),
          stroke: none,
          inset: (x: 2pt, y: 1.6pt),
          [*Ch 07*], [AI બનામ ML બનામ DL બનામ GenAI: પદાનુક્રમ અને કોર ગણિત],
          [*Ch 08*], [સુપરવાઇજ્ડ લર્નિંગ: રિગ્રેશન, ક્લાસિફિકેશન અને લૉસ ફંક્શન્સ],
          [*Ch 09*], [અનસુપરવાઇજ્ડ લર્નિંગ: ક્લસ્ટરિંગ, ડાયમેંશનૈલિટી રિડક્શન અને PCA],
          [*Ch 10*], [જૈવિક ન્યૂરૉન થી કૃત્રિમ ન્યૂરૉન તક: એક્ટિવેશન ફંક્શન્સ],
          [*Ch 11*], [ડીપ ન્યૂરલ નેટવર્ક્સ (DNN): પરતોં નો આર્કિટેક્ચર અને ગ્રેડિએંટ ડિસેંટ],
          [*Ch 12*], [કન્વોલ્યૂશનલ ન્યૂરલ નેટવર્ક્સ (CNN): કર્નલ, પૂલિંગ અને ResNet],
          [*Ch 13*], [સીક્વેંશિયલ મૉડલ્સ: RNN, વૈનિશિંગ ગ્રેડિએંટ, LSTM અને GRU],
          [*Ch 14*], [પ્રૈક્ટિકલ લૈબ: શુદ્ધ NumPy માં સ્ક્રૈચ થી ન્યૂરલ નેટવર્ક કોડ કરના]
        )
      ]
    )

    #v(4pt)

    // MODULE 3
    #block(
      width: 100%,
      stroke: 0.5pt + rgb("#64748B"),
      radius: 4pt,
      fill: white,
      inset: (x: 6pt, y: 5pt),
      [
        #text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#box(fill: rgb("#059669"), inset: (x: 4pt, y: 1.5pt), radius: 2pt, text(fill: white, size: 5.8pt)[ભાગ 3]) ટ્રાંસફૉર્મર આર્કિટેક્ચર, LLMs અને જનરેટિવ AI]
        #v(3pt)
        #table(
          columns: (auto, 1fr),
          stroke: none,
          inset: (x: 2pt, y: 1.6pt),
          [*Ch 15*], [2017 ટ્રાંસફૉર્મર ક્રાંતિ: "Attention Is All You Need" વાસ્તુકલા],
          [*Ch 16*], [લાર્જ લૈંગ્વેજ મૉડલ્સ (LLMs) ની આંતરિક સંરચના: BPE થી સૈંપલિંગ],
          [*Ch 17*], [LLM પ્રશિક્ષણ જીવનચક્ર: પ્રી-ટ્રેનિંગ, SFT, RLHF અને DPO અલાઇનમેંટ],
          [*Ch 18*], [એફિશિએંટ ફાઇન-ટ્યૂનિંગ: LoRA, QLoRA, PEFT અને ક્વાંટાઇજેશન],
          [*Ch 19*], [રિટ્રીવલ-ઑગમેંટેડ જનરેશન (RAG): વેક્ટર્સ, ચંકિંગ અને હાઇબ્રિડ સર્ચ],
          [*Ch 20*], [એંટરપ્રાઇજ પ્રૉમ્પ્ટ ઇંજીનિયરિંગ: CoT, ReAct અને DSPy ફ્રેમવર્ક],
          [*Ch 21*], [સ્વાયત્ત AI એજેંટ્સ: ટૂલ કૉલિંગ, LangGraph અને ReAct લૂપ],
          [*Ch 22*], [પ્રોડક્શન લૈબ: પાયથન માં એંટરપ્રાઇજ RAG પાઇપલાઇન નો નિર્માણ]
        )
      ]
    )
  ],
  [
    // MODULE 4
    #block(
      width: 100%,
      stroke: 0.5pt + rgb("#64748B"),
      radius: 4pt,
      fill: white,
      inset: (x: 6pt, y: 5pt),
      [
        #text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#box(fill: rgb("#D97706"), inset: (x: 4pt, y: 1.5pt), radius: 2pt, text(fill: white, size: 5.8pt)[ભાગ 4]) ગ્લોબલ AI જિઓપૉલિટિક્સ, ચિપ વૉર અને ભારતીય સૉવરેન AI]
        #v(3pt)
        #table(
          columns: (auto, 1fr),
          stroke: none,
          inset: (x: 2pt, y: 1.8pt),
          [*Ch 23*], [એંટરપ્રાઇજ AI હાર્ડવેર: NVIDIA H100, Blackwell B200 સુપરક્લસ્ટર્સ],
          [*Ch 24*], [વૈશ્વિક AI ભૂ-રાજનીતિ, સિલિકૉન સંપ્રભુતા અને ચિપ વૉર],
          [*Ch 25*], [ભારતAI મિશન: ₹10,372 કરોડ નો રાષ્ટ્રીય સંપ્રભુ AI પારિતંત્ર],
          [*Ch 26*], [સ્વદેશી ઇંડિક LLMs અને ડિજિટલ પબ્લિક ઇંફ્રાસ્ટ્રક્ચર (DPI)],
          [*Ch 27*], [ઔદ્યોગિક કેસ સ્ટડીજ: ઉચ્ચ-પ્રભાવ વાલે વ્યાવસાયિક પરિનિયોજન],
          [*Ch 28*], [પ્રોડક્શન પરિનિયોજન: vLLM, TensorRT-LLM, Triton અને FastAPI]
        )
      ]
    )

    #v(4pt)

    // MODULE 5
    #block(
      width: 100%,
      stroke: 0.5pt + rgb("#64748B"),
      radius: 4pt,
      fill: white,
      inset: (x: 6pt, y: 5pt),
      [
        #text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#box(fill: rgb("#DC2626"), inset: (x: 4pt, y: 1.5pt), radius: 2pt, text(fill: white, size: 5.8pt)[ભાગ 5]) 2027 કરિયર રોડમૈપ, સૈલરી બ્લૂપ્રિન્ટ અને જૉબ રોલ્સ]
        #v(3pt)
        #table(
          columns: (auto, 1fr),
          stroke: none,
          inset: (x: 2pt, y: 1.6pt),
          [*Ch 29*], [2027 AI જૉબ માર્કેટ પરિદૃશ્ય અને ₹38 LPA સૈલરી સીઢી (Salary Ladder)],
          [*Ch 30*], [છહ ઉચ્ચ-ભુગતાન વાલી AI કરિયર વિશેષજ્ઞતાએં અને ટેક સ્ટૈક],
          [*Ch 31*], [0-થી-6 મહીને નો સંપૂર્ણ AI લર્નિંગ અને એક્જીક્યૂશન રોડમૈપ],
          [*Ch 32*], [મિલિયન ડૉલર AI પ્રોજેક્ટ પોર્ટફોલિયો: 5 એંટરપ્રાઇજ સિસ્ટમ્સ],
          [*Ch 33*], [ATS-ઑપ્ટિમાઇજ્ડ AI રેજ્યૂમે ઇંજીનિયરિંગ અને 25 STAR બુલેટ્સ],
          [*Ch 34*], [વૈશ્વિક અને ભારતીય AI સર્ટિફિકેશન પ્લેબુક અને ROI વિશ્લેષણ],
          [*Ch 35*], [ફ્રીલાંસ AI કંસલ્ટિંગ અને એંટરપ્રાઇજ એજેંસી મુદ્રીકરણ],
          [*Ch 36*], [કરિયર પરિવર્તન પ્લેબુક: નૉન-ટેક અને ડેવલપર્સ થી AI માં કદમ]
        )
      ]
    )

    #v(4pt)

    // MODULE 6
    #block(
      width: 100%,
      stroke: 0.5pt + rgb("#64748B"),
      radius: 4pt,
      fill: white,
      inset: (x: 6pt, y: 5pt),
      [
        #text(size: 7.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[#box(fill: rgb("#7C3AED"), inset: (x: 4pt, y: 1.5pt), radius: 2pt, text(fill: white, size: 5.8pt)[ભાગ 6]) ટૉપ 50 MNC AI ઇંટરવ્યૂ વૉલ્ટ, નૈતિકતા અને મેંટરશિપ]
        #v(3pt)
        #table(
          columns: (auto, 1fr),
          stroke: none,
          inset: (x: 2pt, y: 1.8pt),
          [*Ch 37*], [ટૉપ 50 MNC AI ઇંટરવ્યૂ વૉલ્ટ: કોર ગણિત, સાંખ્યિકી અને ML થ્યોરી],
          [*Ch 38*], [ટૉપ 50 MNC AI ઇંટરવ્યૂ વૉલ્ટ: ટ્રાંસફૉર્મર્સ અને ડીપ લર્નિંગ],
          [*Ch 39*], [ટૉપ 50 MNC AI ઇંટરવ્યૂ વૉલ્ટ: LLMs, RAG અને વેક્ટર સિસ્ટમ્સ],
          [*Ch 40*], [ટૉપ 50 MNC AI ઇંટરવ્યૂ વૉલ્ટ: સિસ્ટમ ડિજાઇન અને 10M સ્કેલિંગ],
          [*Ch 41*], [AI સુરક્ષા, નૈતિકતા અને વૈશ્વિક શાસન: EU AI Act અને ભારતીય DPDP],
          [*Ch 42*], [રાહુલ સર નો વ્યક્તિગત સંદેશ: ભારતીય છાત્રોં માટે વિજન અને મેંટરશિપ]
        )
      ]
    )
  ]
)

#v(4pt)
#align(center)[
  #block(
    fill: rgb("#F1F5F9"),
    stroke: 0.5pt + rgb("#64748B"),
    inset: (x: 8pt, y: 3.5pt),
    radius: 3pt,
    [
      #text(size: 6.2pt, font: ("Nirmala UI", "Segoe UI"), weight: "bold", fill: rgb("#0F172A"))[RTECHLAB ડીપટેક અકાદમિક ફ્રેમવર્ક · 42 પ્રોડક્શન મૉડ્યૂલ્સ · 100% ઉદ્યોગ-માનકીકૃત કોડ]
    ]
  )
]
