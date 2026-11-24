#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[ભાગ 5: 2027 કરિયર રોડમૈપ, સૈલરી બ્લૂપ્રિન્ટ અને ટૉપ MNC જૉબ્સ · પ્રકરણ 33]
= ATS-ઑપ્ટિમાઇજ્ડ AI રેજ્યૂમે ઇંજીનિયરિંગ અને કીવર્ડ બ્લૂપ્રિંટ્સ

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  75% થી વધારે રેજ્યૂમે કોઈપણ ઇંસાન ની આઁખોં તક પહુઁચને થી પહલે હી Applicant Tracking System (ATS) દ્વારા ખારિજ કર દિએ જાતે છે. સહી કીવર્ડ્સ અને Google ના X-Y-Z ફૉર્મૂલે થી રેજ્યૂમે ને શૉર્ટલિસ્ટ કરાના સીખેં.
]

#v(2.5pt)

== 33.1 ઉચ્ચ-રૂપાંતરણ AI રેજ્યૂમે માટે અનિવાર્ય કીવર્ડ્સ

#table(
  columns: (1.2fr, 2.4fr, 2.4fr),
  fill: (x, y) => if y == 0 { rgb("#E2E8F0") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.5pt + rgb("#64748B"),
  inset: (x: 4pt, y: 2.2pt),
  table.header([*ડોમેન*], [*અનિવાર્ય કોર કીવર્ડ્સ (ATS ટ્રિગર્સ)*], [*રેજ્યૂમે માં વ્યાવહારિક વાક્ય ઉદાહરણ*]),
  [LLMs & GenAI], [LangChain, LlamaIndex, RAG, Hybrid Search, BM25, Cohere Rerank, Embeddings, Tokenizer], ["LangChain અને ChromaDB થી 250,000 આંતરિક ફાઇલોં પર RAG પાઇપલાઇન બનાઈ, જિસસે 99.4% ચોકસાઈ મિલી."],
  [ફાઇન-ટ્યૂનિંગ], [LoRA, QLoRA, PEFT, Unsloth, SFT, DPO, RLHF, Hugging Face, FlashAttention-2], ["QLoRA દ્વારા Llama-3-8B ને ડોમેન ડેટા પર ફાઇન-ટ્યૂન કિયા, જિસસે ક્લાઉડ API બિલ માં \$18,000/માહ ની બચત થઈ."],
  [MLOps & ડિપ્લૉયમેંટ], [vLLM, TensorRT-LLM, Triton, Docker, Kubernetes, AWS SageMaker, FastAPI, Prometheus], ["vLLM PagedAttention દ્વારા મૉડલ સર્વ કિયા, જિસસે P95 લેટેંસી 42% ઘટી અને થ્રૂપુટ 3x બઢા."],
  [મૈથ & ફંડામેંટલ્સ], [PyTorch, Vector Calculus, Gradient Descent, Softmax, Cross-Entropy, Eigenvalues], ["કસ્ટમ મલ્ટી-હેડ સેલ્ફ-અટેંશન અને RoPE ને PyTorch માં સ્ક્રૈચ થી કોડ કરકે બેંચમાર્ક કિયા."]
)

#v(2pt)
== 33.2 Google X-Y-Z ફૉર્મૂલા (Accomplished X, measured by Y, doing Z)

- *કમજોર વાક્ય*: "LangChain પર કામ કિયા અને કસ્ટમર સર્વિસ માટે બૉટ બનાયા."
- *શક્તિશાલી વાક્ય*: "LangChain, ChromaDB અને Bge-large-reranker દ્વારા એંટરપ્રાઇજ RAG પાઇપલાઇન ડિજાઇન ની, જિસને *42% લેટેંસી ઘટાઈ* અને 250,000 ફાઇલોં ને *99.4% સિટેશન ચોકસાઈ* થી ઇંડેક્સ કિયા."

#v(2pt)
#concept-box(title: "LinkedIn પર કોલ્ડ આઉટરીચ નો ગોલ્ડન નિયમ")[
  સીધે "સર નૌકરી દે બે" નો મૈસેજ ન ભેજેં. ઇંજીનિયરિંગ ડાયરેક્ટર ને લિખેં: *"નમસ્તે [નામ], મૈંને આપકી ટીમ નો RAG ઉત્પાદ દેખા. જટિલ પ્રશ્નોં પર લેટેંસી ઓછું કરવા માટે મૈંને HyDE અને રી-રૈંકિંગ થી એક પ્રોટોટાઇપ બનાયા જિસને P95 લેટેંસી 34% ઘટાઈ. યહાઁ 1-મિનટ નો ડેમો અને કોડ લિંક છે."*
]

#v(2pt)
== 33.3 Google X-Y-Z રેજ્યૂમે ફૉર્મૂલા ઉદાહરણ
- *કમજોર*: "LangChain પર કામ કિયા અને કસ્ટમર સર્વિસ બૉટ બનાયા."
- *શક્તિશાલી*: "LangChain, ChromaDB અને Bge-large-reranker દ્વારા એંટરપ્રાઇજ RAG બનાયા, જિસને **42% લેટેંસી ઘટાઈ** અને 250,000 ફાઇલોં ને **99.4% સિટેશન ચોકસાઈ** થી પ્રોસેસ કિયા."
