#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 4: INFRASTRUCTURE & GLOBAL AI ECOSYSTEM · CHAPTER 28]
= Production Lab: Serving LLMs with vLLM & PagedAttention

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  Deploying LLMs in enterprise production using naive Hugging Face pipelines results in low throughput and 70% wasted GPU memory. In this lab, we deploy a production inference gateway using *vLLM* and *PagedAttention*.
]

#v(2pt)

== 28.1 The PagedAttention Revolution (Kwon et al., UC Berkeley)

Traditional LLM serving pre-allocates contiguous memory blocks for the KV-Cache based on maximum sequence length (e.g. 2048 tokens). Because actual prompts vary, 60%–80% of memory is lost to internal/external fragmentation.
- *PagedAttention* borrows the concept of *Virtual Memory and Paging* from modern operating systems.
- It partitions the KV-Cache into non-contiguous physical memory blocks, enabling continuous batching and yielding *2x to 4x higher throughput* on identical GPU hardware.

#v(2pt)
#code-box(title: "VLLM HIGH-THROUGHPUT CLI SERVER LAUNCH")[
```bash
# 1. Install High-Throughput vLLM Serving Engine
pip install vllm ray

# 2. Launch OpenAI-Compatible High-Concurrency LLM Server on Port 8000
python -m vllm.entrypoints.openai.api_server \
    --model meta-llama/Llama-3-8B-Instruct \
    --tensor-parallel-size 1 \
    --max-model-len 8192 \
    --gpu-memory-utilization 0.90 \
    --enforce-eager \
    --port 8000
```
]
#v(2pt)

== 28.2 Calling the High-Throughput Inference Endpoint in Python

#v(2pt)
#code-box(title: "PYTHON FASTAPI / OPENAI CLIENT INFERENCE")[
```python
from openai import OpenAI

# Connect to local or cloud-hosted vLLM high-throughput server
client = OpenAI(base_url="http://localhost:8000/v1", api_key="EMPTY")

response = client.chat.completions.create(
    model="meta-llama/Llama-3-8B-Instruct",
    messages=[
        {"role": "system", "content": "You are a production enterprise AI microservice."},
        {"role": "user", "content": "Explain PagedAttention in one concise bullet point."}
    ],
    temperature=0.0,
    max_tokens=60
)

print("vLLM Production Response:")
print(response.choices[0].message.content)
```
]
#v(2pt)

== 28.3 Key Production Metrics
- *Time to First Token (TTFT)*: $< 80$ms | *Inter-Token Latency (ITL)*: $< 15$ms per token.
- *Concurrent Request Capacity*: Serves 50+ concurrent customer streams on a single 24GB RTX 4090 GPU.

#v(2.5pt)
== 28.4 The Multi-Model Routing Pattern

Enterprise production systems rarely rely on a single foundation model:
- *Intelligent LLM Router*: Analyzes incoming query complexity using lightweight semantic classifiers.
- Simple FAQ and routing requests route to fast, cheap models (Llama-3-8B at \$0.05 per million tokens). Complex mathematical reasoning or code generation routes to frontier models (Claude 3.5 Sonnet or GPT-4o), reducing overall enterprise API expenditures by over *70%*.
