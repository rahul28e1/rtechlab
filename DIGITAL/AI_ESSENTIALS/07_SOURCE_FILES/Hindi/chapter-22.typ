#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[भाग 3: ट्रांसफॉर्मर आर्किटेक्चर, LLMs एवं जनरेटिव AI · अध्याय 22]
= प्रोडक्शन लैब: पायथन में एंटरप्राइज RAG पाइपलाइन का निर्माण

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  इस प्रोडक्शन लैब में हम LangChain, ChromaDB वेक्टर स्टोरेज और ओपन-सोर्स एम्बेडिंग्स का उपयोग करके एंड-टू-एंड एंटरप्राइज RAG सिस्टम कोड करेंगे।
]

#v(2pt)

== 22.1 संपूर्ण प्रोडक्शन कोड आर्किटेक्चर (Python Production Implementation)

#v(2pt)
#code-box(title: "LANGCHAIN & CHROMADB ENTERPRISE RAG PIPELINE")[
```python
import os
from langchain_community.document_loaders import TextLoader
from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import Chroma
from langchain_core.prompts import ChatPromptTemplate

# 1. डेटा अंतर्ग्रहण: कॉर्पोरेट पॉलिसी डॉक्यूमेंट बनाना
with open("policy.txt", "w", encoding="utf-8") as f:
    f.write("RTechLab 2027 Policy: Remote employees receive ₹40,000 annual home office allowance. "
            "Reimbursement claims must be submitted via the ERP portal within 30 days of purchase.")

loader = TextLoader("policy.txt")
docs = loader.load()

# 2. चंकिंग: ओवरलैप के साथ सिमेंटिक विभाजन
text_splitter = RecursiveCharacterTextSplitter(chunk_size=200, chunk_overlap=30)
chunks = text_splitter.split_documents(docs)

# 3. वेक्टर एम्बेडिंग्स एवं ChromaDB स्टोरेज
embeddings = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")
vector_db = Chroma.from_documents(chunks, embeddings, collection_name="enterprise_policies")
retriever = vector_db.as_retriever(search_type="similarity", search_kwargs={"k": 2})

# 4. एंटी-हॉलुसिनेशन प्रॉम्प्ट टेम्पलेट
template = """आप एक ऑडिटेड एंटरप्राइज सहायक हैं। नीचे दिए गए CONTEXT का उपयोग करके ही उत्तर दें।
यदि उत्तर संदर्भ में नहीं है, तो कहें: "पॉलिसी में यह जानकारी उपलब्ध नहीं है।"

CONTEXT:
{context}

प्रश्न: {question}
सत्यापित उत्तर (सटीक उद्धरण सहित):"""
prompt = ChatPromptTemplate.from_template(template)

# 5. RAG पाइपलाइन निष्पादन
query = "वार्षिक होम ऑफिस अलाउंस कितना है और क्लेम की अंतिम तिथि क्या है?"
retrieved_docs = retriever.invoke(query)
context_text = "\n\n".join(f"[स्त्रोत: {d.metadata.get('source', 'doc')}] {d.page_content}" for d in retrieved_docs)
print(f"सफलतापूर्वक खोजा गया संदर्भ:\n{context_text}")
```
]

#v(2pt)

== 22.2 उत्पादन सत्यापन एवं परिनियोजन मानक

- *हॉलुसिनेशन रोकथाम*: सिस्टम प्रॉम्प्ट मॉडल को `{context}` के बाहर अनुमान लगाने से पूरी तरह रोकता है।
- *लेटेंसी प्रोफाइल*: ChromaDB वेक्टर सर्च मानक CPU पर $< 15$ मिलीसेकंड में पूरी हो जाती है।
- *मल्टीलिंगुअल कवरेज*: `all-MiniLM-L6-v2` को हटाकर Bhashini या Sarvam इंडिक एम्बेडिंग्स जोड़कर भारतीय भाषाओं में तुरंत लाइव करें।
