#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[ભાગ 5: 2027 કરિયર રોડમૈપ, સૈલરી બ્લૂપ્રિન્ટ અને ટૉપ MNC જૉબ્સ · પ્રકરણ 36]
= કરિયર પરિવર્તન પ્લેબુક: નૉન-ટેક અને સોફ્ટવેર ડેવલપર્સ થી AI

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  ચાહે આપ 5 સાલ થી Java/Spring Boot બના રહે હોં, મૈન્યુઅલ ટેસ્ટિંગ કર રહે હોં, અથવા નૉન-ટેક બૈકગ્રાઉંડ થી હોં—આપકી પુરાની પૃષ્ઠભૂમિ કોઈ કમજોરી નથી, પરંતુ AI માં આપકી સૌથી બડી મહાશક્તિ છે.
]

#v(2.5pt)

== 36.1 ડેવલપર બૈકગ્રાઉંડ થી AI માં માઇગ્રેશન મૈટ્રિક્સ

#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*વર્તમાન પૃષ્ઠભૂમિ*], [*આપકો પહલે થી ક્યા આતા છે*], [*CTC દોગુની કરવા માટે ક્યા નયા સીખેં*]),
  [Java / Spring Boot], [માઇક્રોસર્વિસેજ, હાઇબરનેટ, મલ્ટી-થ્રેડિંગ, ડેટાબેસ ટ્રાંજૈક્શન્સ.], [Python, LangChain, Spring AI, Vector DBs, vLLM માઇક્રોસર્વિસેજ.],
  [JavaScript / React / Node], [ફ્રંટએંડ UX, WebSockets, async ઇવેંટ લૂપ, REST APIs.], [Vercel AI SDK, Generative UI સ્ટ્રીમિંગ, Llama-3 API રૈપર્સ.],
  [DevOps / SRE], [Docker, Kubernetes, Linux, CI/CD, Prometheus, Terraform.], [GPU ઑર્કેસ્ટ્રેશન, Triton, Ray ડિસ્ટ્રીબ્યૂટેડ, Helm AI ચાર્ટ્સ.],
  [QA / મૈન્યુઅલ ટેસ્ટિંગ], [ટેસ્ટ કેસેજ, એજ કેસેજ, બગ રિપોર્ટ્સ, રિગ્રેશન વેરિફિકેશન.], [LLM ઇવૈલ્યૂએશન બેંચમાર્ક, Ragas ફ્રેમવર્ક, પ્રૉમ્પ્ટ ઇંજેક્શન રેડ-ટીમિંગ.]
)

#v(2pt)
== 36.2 અંતિમ માઇંડસેટ શિફ્ટ: ડિટર્મિનિસ્ટિક થી પ્રોબેબિલિસ્ટિક

પારંપરિક પ્રોગ્રામિંગ માં $2 + 2$ હમેશા $4$ થાય છે, અને `if` કંડીશન અથવા તો ચલતી છે અથવા નથી. AI માં એક હી ઇનપુટ અલગ-અલગ ઉત્તર દે શકે છે.
- સીનિયર AI ઇંજીનિયર નો કામ લૉજિક લિખના નથી, પરંતુ એમ્બેડિંગ્સ, ક્રૉસ-એન્કોડર્સ અને ગાર્ડરેલ્સ દ્વારા *સંભાવ્યતા ને નિયંત્રિત કરવું (Constraining Probability)* છે.

#v(2pt)
#concept-box(title: "ઇંટરવ્યૂ માં 'નો ફૉર્મલ AI એક્સપીરિયંસ' આપત્તિ નો મુકાબલા")[
  ઇંટરવ્યૂ માં કહેં: *"જહાઁ અન્ય ફ્રેશર્સ કેવલ નોટબુક માં API કૉલ કરવું જાનતે છે, વહીં મેરે 4 સાલ ના જાવા બૈકએંડ અનુભવ નો મતલબ છે કિ મૈં LLMs ના ચારોં ઓર હાઈ-અવેલેબિલિટી, સ્કેલેબલ માઇક્રોસર્વિસેજ અને બૈંક-ગ્રેડ સિક્યોરિટી બનાના જાનતા હૂઁ."*
]

#v(2pt)
== 36.4 ડેવલપર ટેક સ્ટૈક માઇગ્રેશન મૈટ્રિક્સ
#table(
  columns: (1.2fr, 2.2fr, 2.6fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*વર્તમાન બૈકગ્રાઉંડ*], [*આપકો ક્યા આતા છે*], [*CTC દોગુની કરવા માટે ક્યા સીખેં*]),
  [Java / Spring Boot], [માઇક્રોસર્વિસેજ, મલ્ટી-થ્રેડિંગ.], [Python, LangChain, Spring AI, Vector DBs, vLLM.],
  [JavaScript / React], [ફ્રંટએંડ UX, WebSockets, REST.], [Vercel AI SDK, Generative UI સ્ટ્રીમિંગ, Llama-3 wrappers.],
  [DevOps / SRE], [Docker, Kubernetes, Linux, CI/CD.], [GPU ઑર્કેસ્ટ્રેશન, Triton, Ray, vLLM, Helm charts.],
  [QA / ટેસ્ટિંગ], [ટેસ્ટ કેસેજ, બગ રિપોર્ટ્સ.], [LLM ઇવૈલ્યૂએશન, Ragas, પ્રૉમ્પ્ટ ઇંજેક્શન રેડ-ટીમિંગ.]
)
