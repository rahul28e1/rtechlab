#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[ભાગ 3: ટ્રાંસફૉર્મર આર્કિટેક્ચર, LLMs અને જનરેટિવ AI · પ્રકરણ 22]
= પ્રોડક્શન લૈબ: પાયથન માં એંટરપ્રાઇજ RAG પાઇપલાઇન નો નિર્માણ

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  આ પ્રોડક્શન લૈબ માં હમ LangChain, ChromaDB વેક્ટર સ્ટોરેજ અને ઓપન-સોર્સ એમ્બેડિંગ્સ નો ઉપયોગ કરકે એંડ-ટૂ-એંડ એંટરપ્રાઇજ RAG સિસ્ટમ કોડ કરેંગે.
]

#v(2pt)

== 22.1 સંપૂર્ણ પ્રોડક્શન કોડ આર્કિટેક્ચર (Python Production Implementation)

#v(2pt)
#code-box(title: "LANGCHAIN & CHROMADB ENTERPRISE RAG PIPELINE")[
```python
import os
from langchain_community.document_loaders import TextLoader
from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import Chroma
from langchain_core.prompts import ChatPromptTemplate

# 1. ડેટા ઇન્જેશન: કૉર્પોરેટ પૉલિસી દસ્તાવેજ બનાવવો
with open("policy.txt", "w", encoding="utf-8") as f:
    f.write("RTechLab 2027 Policy: Remote employees receive ₹40,000 annual home office allowance. "
            "Reimbursement claims must be submitted via the ERP portal within 30 days of purchase.")

loader = TextLoader("policy.txt")
docs = loader.load()

# 2. ચંકિંગ: ઓવરલૅપ સાથે સિમેન્ટિક વિભાજન
text_splitter = RecursiveCharacterTextSplitter(chunk_size=200, chunk_overlap=30)
chunks = text_splitter.split_documents(docs)

# 3. વેક્ટર એમ્બેડિંગ્સ અને ChromaDB સ્ટોરેજ
embeddings = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")
vector_db = Chroma.from_documents(chunks, embeddings, collection_name="enterprise_policies")
retriever = vector_db.as_retriever(search_type="similarity", search_kwargs={"k": 2})

# 4. એન્ટી-હેલ્યુસિનેશન પ્રોમ્પ્ટ ટેમ્પલેટ
template = """આપ એક ઑડિટેડ એંટરપ્રાઇજ સહાયક હૈં. નીચે દિએ ગએ CONTEXT કા ઉપયોગ કરકે હી ઉત્તર દેં.
જો ઉત્તર સંદર્ભ મેં નહીં હૈ, તો કહેં: "પૉલિસી મેં યહ જાનકારી ઉપલબ્ધ નહીં હૈ."

CONTEXT:
{context}

પ્રશ્ન: {question}
સત્યાપિત ઉત્તર (સટીક ઉદ્ધરણ સહિત):"""
prompt = ChatPromptTemplate.from_template(template)

# 5. RAG પાઇપલાઇન નિષ્પાદન
query = "વાર્ષિક હોમ ઑફિસ અલાઉંસ કિતના હૈ ઔર ક્લેમ કી અંતિમ તિથિ ક્યા હૈ?"
retrieved_docs = retriever.invoke(query)
context_text = "\n\n".join(f"[સ્ત્રોત: {d.metadata.get('source', 'doc')}] {d.page_content}" for d in retrieved_docs)
print(f"સફલતાપૂર્વક ખોજા ગયા સંદર્ભ:\n{context_text}")
```
]

#v(2pt)

== 22.2 ઉત્પાદન સત્યાપન અને પરિનિયોજન માનક

- *હૉલુસિનેશન રોકથામ*: સિસ્ટમ પ્રૉમ્પ્ટ મૉડલ ને `{context}` ના બાહર અનુમાન લગાને થી સંપૂર્ણપણે રોકતા છે.
- *લેટેંસી પ્રોફાઇલ*: ChromaDB વેક્ટર સર્ચ માનક CPU પર $< 15$ મિલીસેકંડ માં પૂરી હો જાય છે.
- *મલ્ટીલિંગુઅલ કવરેજ*: `all-MiniLM-L6-v2` ને હટાકર Bhashini અથવા Sarvam ઇંડિક એમ્બેડિંગ્સ જોડીને ભારતીય ભાષાઓં માં તુરંત લાઇવ કરેં.
