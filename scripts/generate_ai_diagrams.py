import os
import subprocess

out_dir = "DIGITAL/AI_ESSENTIALS/07_SOURCE_FILES/03_VISUAL_ASSETS/diagrams"
os.makedirs(out_dir, exist_ok=True)
chrome_path = r"C:\Program Files\Google\Chrome\Application\chrome.exe"

diagrams = [
    {
        "filename": "ai-hierarchy-concentric.png",
        "html": """
        <!DOCTYPE html>
        <html>
        <head>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
            body { background: #0b0f19; padding: 30px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
            .container { width: 1200px; height: 660px; background: #0f172a; border-radius: 12px; border: 1px solid #1e293b; padding: 25px; display: grid; grid-template-columns: 1.3fr 1fr; gap: 30px; align-items: center; box-shadow: 0 25px 60px rgba(0,0,0,0.5); }
            .circle-container { position: relative; width: 560px; height: 560px; margin: 0 auto; display: flex; justify-content: center; align-items: center; }
            .c-ai { position: absolute; width: 540px; height: 540px; border-radius: 50%; background: rgba(30, 58, 138, 0.2); border: 2px solid #3b82f6; display: flex; flex-direction: column; align-items: center; padding-top: 20px; }
            .c-ml { position: absolute; width: 410px; height: 410px; border-radius: 50%; background: rgba(13, 148, 136, 0.25); border: 2px solid #14b8a6; display: flex; flex-direction: column; align-items: center; padding-top: 20px; }
            .c-dl { position: absolute; width: 280px; height: 280px; border-radius: 50%; background: rgba(147, 51, 234, 0.25); border: 2px solid #a855f7; display: flex; flex-direction: column; align-items: center; padding-top: 18px; }
            .c-gen { position: absolute; width: 160px; height: 160px; border-radius: 50%; background: linear-gradient(135deg, #f43f5e, #fbbf24); border: 2px solid #fff; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; color: white; font-weight: bold; font-size: 13px; box-shadow: 0 0 25px rgba(244, 63, 94, 0.6); }
            .tag { font-weight: 800; font-size: 14px; letter-spacing: 1px; text-transform: uppercase; }
            .t-ai { color: #60a5fa; }
            .t-ml { color: #2dd4bf; }
            .t-dl { color: #c084fc; }
            .desc { font-size: 11px; color: #94a3b8; max-width: 320px; text-align: center; margin-top: 2px; }
            .info-panel { display: flex; flex-direction: column; gap: 14px; }
            .card { background: #1e293b; border-radius: 8px; padding: 14px 18px; border-left: 4px solid #3b82f6; }
            .card h3 { font-size: 14px; color: white; margin-bottom: 4px; display: flex; justify-content: space-between; }
            .card p { font-size: 11px; color: #94a3b8; line-height: 1.4; }
            .badge { font-size: 10px; padding: 2px 8px; border-radius: 12px; font-weight: bold; }
          </style>
        </head>
        <body>
          <div class="container">
            <div class="circle-container">
              <div class="c-ai">
                <span class="tag t-ai">1. Artificial Intelligence (1950s)</span>
                <span class="desc">Any technique enabling computers to mimic human intelligence</span>
                <div class="c-ml">
                  <span class="tag t-ml">2. Machine Learning (1980s)</span>
                  <span class="desc">Statistical algorithms that learn from data without explicit rules</span>
                  <div class="c-dl">
                    <span class="tag t-dl">3. Deep Learning (2010s)</span>
                    <span class="desc" style="max-width: 220px;">Multi-layer neural networks mimicking human neocortex</span>
                    <div class="c-gen">
                      <span>4. Generative AI</span>
                      <span style="font-size:10px; font-weight:normal; margin-top:2px;">(2022–2027)</span>
                      <span style="font-size:9px; background:rgba(0,0,0,0.3); padding:1px 6px; border-radius:4px; margin-top:4px;">LLMs & Diffusion</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="info-panel">
              <div style="margin-bottom:6px;">
                <h2 style="color:white; font-size:20px; font-weight:800;">The AI Taxonomy Hierarchy</h2>
                <p style="color:#64748b; font-size:12px;">RTechLab Official 2027 Machine Intelligence Classification Architecture</p>
              </div>
              <div class="card" style="border-left-color:#3b82f6;">
                <h3>Artificial Intelligence (AI) <span class="badge" style="background:#1e3a8a; color:#93c5fd;">Foundational Field</span></h3>
                <p>Encompasses expert systems, symbolic logic, search algorithms, robotics, and knowledge bases designed to automate rational decision-making.</p>
              </div>
              <div class="card" style="border-left-color:#14b8a6;">
                <h3>Machine Learning (ML) <span class="badge" style="background:#134e4a; color:#5eead4;">Statistical Engines</span></h3>
                <p>Supervised learning (linear regression, random forests), unsupervised learning (k-means, PCA), and reinforcement learning (Q-learning).</p>
              </div>
              <div class="card" style="border-left-color:#a855f7;">
                <h3>Deep Learning (DL) <span class="badge" style="background:#581c87; color:#d8b4fe;">Artificial Neural Nets</span></h3>
                <p>CNNs for computer vision, RNNs/LSTMs for sequence modeling, leveraging matrix multiplication on specialized GPU clusters.</p>
              </div>
              <div class="card" style="border-left-color:#f43f5e;">
                <h3>Generative AI & Foundation Models <span class="badge" style="background:#881337; color:#fda4af;">Current Frontier</span></h3>
                <p>Transformer-based autoregressive models (GPT-4, Gemini, Claude, Llama 3) generating novel code, language, images, and agentic actions.</p>
              </div>
            </div>
          </div>
        </body>
        </html>
        """
    },
    {
        "filename": "transformer-attention-architecture.png",
        "html": """
        <!DOCTYPE html>
        <html>
        <head>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
            body { background: #030712; padding: 25px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
            .window { width: 1200px; height: 660px; background: #0f172a; border-radius: 12px; border: 1px solid #1f2937; padding: 25px; box-shadow: 0 25px 60px rgba(0,0,0,0.6); display: flex; flex-direction: column; }
            .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #1e293b; padding-bottom: 15px; margin-bottom: 20px; }
            .header h1 { font-size: 18px; color: white; font-weight: 800; }
            .header span { font-size: 12px; color: #38bdf8; font-family: monospace; }
            .grid { display: grid; grid-template-columns: 1fr 1.3fr 1fr; gap: 20px; flex: 1; align-items: center; }
            .col { background: #111827; border: 1px solid #1e293b; border-radius: 8px; padding: 18px; height: 100%; display: flex; flex-direction: column; justify-content: space-between; }
            .col-title { font-size: 13px; font-weight: 700; color: #94a3b8; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 12px; border-bottom: 1px solid #1f2937; padding-bottom: 6px; }
            .box { background: #1e293b; border: 1px solid #334155; border-radius: 6px; padding: 10px; margin-bottom: 8px; text-align: center; }
            .box-blue { background: #1e3a8a; border-color: #3b82f6; color: white; }
            .box-amber { background: #78350f; border-color: #f59e0b; color: white; }
            .box-purple { background: #581c87; border-color: #a855f7; color: white; }
            .box-green { background: #064e3b; border-color: #10b981; color: white; }
            .formula-card { background: #030712; border: 1px dashed #38bdf8; border-radius: 8px; padding: 12px; text-align: center; margin-top: 10px; font-family: Consolas, monospace; color: #38bdf8; font-size: 13px; font-weight: bold; }
            .arrow { text-align: center; color: #64748b; font-size: 14px; margin: 4px 0; }
          </style>
        </head>
        <body>
          <div class="window">
            <div class="header">
              <h1>Transformer Architecture & Multi-Head Self-Attention Engine</h1>
              <span>Vaswani et al. (2017) · Google Research & 2027 LLM Backbone</span>
            </div>
            <div class="grid">
              <div class="col">
                <div>
                  <div class="col-title">1. Input Pipeline</div>
                  <div class="box box-blue">
                    <strong>Input Text Prompt</strong>
                    <div style="font-size:10px; color:#93c5fd; margin-top:2px;">"Artificial Intelligence in 2027"</div>
                  </div>
                  <div class="arrow">↓ Tokenizer (BPE)</div>
                  <div class="box">
                    <strong>Byte-Pair Tokens</strong>
                    <div style="font-size:10px; color:#94a3b8; margin-top:2px;">[3452, 9812, 287, 4921]</div>
                  </div>
                  <div class="arrow">↓ Vector Lookup</div>
                  <div class="box box-purple">
                    <strong>Token Embeddings</strong>
                    <div style="font-size:10px; color:#d8b4fe; margin-top:2px;">Dense Vector: 4096 Dimensions</div>
                  </div>
                  <div class="arrow">+ Positional Encoding</div>
                  <div class="box">
                    <strong>Positional Vector (RoPE)</strong>
                    <div style="font-size:10px; color:#94a3b8; margin-top:2px;">Encodes sequence token ordering</div>
                  </div>
                </div>
                <div style="font-size:10px; color:#64748b; line-height:1.3;">
                  Every word becomes a high-dimensional vector capturing semantic geometry.
                </div>
              </div>

              <div class="col" style="background:#0b1120; border-color:#2563eb;">
                <div>
                  <div class="col-title" style="color:#60a5fa;">2. Multi-Head Self-Attention Core</div>
                  <div style="display:grid; grid-template-columns:1fr 1fr 1fr; gap:6px; margin-bottom:12px;">
                    <div class="box" style="background:#172554; border-color:#1d4ed8; color:#93c5fd; font-size:11px;">
                      <strong>Queries (Q)</strong><br><span style="font-size:9px;">What am I looking for?</span>
                    </div>
                    <div class="box" style="background:#14532d; border-color:#15803d; color:#86efac; font-size:11px;">
                      <strong>Keys (K)</strong><br><span style="font-size:9px;">What do I contain?</span>
                    </div>
                    <div class="box" style="background:#701a75; border-color:#a21caf; color:#f0abfc; font-size:11px;">
                      <strong>Values (V)</strong><br><span style="font-size:9px;">What information do I pass?</span>
                    </div>
                  </div>
                  <div class="formula-card">
                    Attention(Q, K, V) = softmax(Q·Kᵀ / √dₖ) · V
                  </div>
                  <div style="margin-top:12px;" class="box box-amber">
                    <strong>Scaled Dot-Product Matrix</strong>
                    <div style="font-size:10px; color:#fde68a; margin-top:2px;">Computes pairwise attention weights between every token pair</div>
                  </div>
                  <div class="arrow">↓ Parallel Multi-Head Concatenation</div>
                  <div class="box box-blue">
                    <strong>32 to 128 Parallel Attention Heads</strong>
                    <div style="font-size:10px; color:#bfdbfe; margin-top:2px;">Each head attends to grammar, facts, tone, or long-range logic</div>
                  </div>
                </div>
                <div style="font-size:10px; color:#93c5fd; line-height:1.3; background:rgba(37,99,235,0.1); padding:8px; border-radius:4px;">
                  Parallel matrix multiplication replaces slow sequential RNNs, enabling training on billions of tokens.
                </div>
              </div>

              <div class="col">
                <div>
                  <div class="col-title">3. Feed-Forward & Output</div>
                  <div class="box">
                    <strong>LayerNorm & Residual Add</strong>
                    <div style="font-size:10px; color:#94a3b8; margin-top:2px;">Prevents vanishing gradients in deep nets</div>
                  </div>
                  <div class="arrow">↓</div>
                  <div class="box box-purple">
                    <strong>Feed-Forward Network (MLP)</strong>
                    <div style="font-size:10px; color:#d8b4fe; margin-top:2px;">SwiGLU activation & factual memory store</div>
                  </div>
                  <div class="arrow">↓ N Stacked Transformer Blocks</div>
                  <div class="box">
                    <strong>Linear Head & Softmax</strong>
                    <div style="font-size:10px; color:#94a3b8; margin-top:2px;">Probabilities over 128k vocabulary</div>
                  </div>
                  <div class="arrow">↓ Sampling (Temp, Top-p)</div>
                  <div class="box box-green">
                    <strong>Next Generated Token</strong>
                    <div style="font-size:10px; color:#a7f3d0; margin-top:2px;">Streamed to user at 60+ tokens/sec</div>
                  </div>
                </div>
                <div style="font-size:10px; color:#64748b; line-height:1.3;">
                  Autoregressive loop: each new token is appended to input to predict the subsequent token.
                </div>
              </div>
            </div>
          </div>
        </body>
        </html>
        """
    },
    {
        "filename": "rag-vector-pipeline.png",
        "html": """
        <!DOCTYPE html>
        <html>
        <head>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
            body { background: #064e3b; padding: 25px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
            .window { width: 1200px; height: 660px; background: #062e24; border-radius: 12px; border: 1px solid #047857; padding: 25px; box-shadow: 0 25px 60px rgba(0,0,0,0.6); display: flex; flex-direction: column; }
            .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #047857; padding-bottom: 14px; margin-bottom: 20px; }
            .header h1 { font-size: 18px; color: white; font-weight: 800; }
            .header span { font-size: 12px; color: #34d399; font-family: monospace; }
            .flow { display: grid; grid-template-columns: repeat(4, 1fr); gap: 18px; flex: 1; align-items: stretch; }
            .step-card { background: #064e3b; border: 1px solid #059669; border-radius: 8px; padding: 18px; display: flex; flex-direction: column; justify-content: space-between; }
            .step-num { font-size: 11px; font-weight: 800; color: #6ee7b7; text-transform: uppercase; letter-spacing: 1px; }
            .step-title { font-size: 15px; font-weight: 700; color: white; margin: 6px 0 12px 0; }
            .mini-box { background: rgba(0,0,0,0.25); border: 1px solid rgba(255,255,255,0.1); border-radius: 6px; padding: 10px; margin-bottom: 10px; font-size: 11px; color: #d1fae5; }
            .callout { background: #022c22; border-left: 3px solid #10b981; padding: 8px 10px; font-size: 10px; color: #a7f3d0; margin-top: 10px; }
          </style>
        </head>
        <body>
          <div class="window">
            <div class="header">
              <h1>Enterprise Retrieval-Augmented Generation (RAG) Architecture</h1>
              <span>Zero-Hallucination Private Knowledge Retrieval · 2027 Production Standard</span>
            </div>
            <div class="flow">
              <div class="step-card">
                <div>
                  <div class="step-num">Stage 01</div>
                  <div class="step-title">Ingestion & Chunking</div>
                  <div class="mini-box">
                    <strong>Enterprise Sources</strong><br>
                    PDFs, Notion Docs, SQL Dumps, Jira tickets, Code repositories.
                  </div>
                  <div class="mini-box">
                    <strong>Smart Chunking</strong><br>
                    Recursive character splitting into 512-token segments with 10% sliding overlap.
                  </div>
                </div>
                <div class="callout">
                  Prevents contextual cutoff between sentences and headings.
                </div>
              </div>

              <div class="step-card">
                <div>
                  <div class="step-num">Stage 02</div>
                  <div class="step-title">Embedding & Vector DB</div>
                  <div class="mini-box">
                    <strong>Embedding Model</strong><br>
                    text-embedding-3-large transforms text chunks into 1,536-dim mathematical coordinates.
                  </div>
                  <div class="mini-box">
                    <strong>Vector Indexing</strong><br>
                    Pinecone, ChromaDB, Weaviate, pgvector with HNSW index for sub-millisecond retrieval.
                  </div>
                </div>
                <div class="callout">
                  Semantics matching: "salary cut" matches "compensation reduction".
                </div>
              </div>

              <div class="step-card">
                <div>
                  <div class="step-num">Stage 03</div>
                  <div class="step-title">Semantic Search & Retrieval</div>
                  <div class="mini-box">
                    <strong>User Query</strong><br>
                    "What is our Q3 refund policy for enterprise cloud licenses?"
                  </div>
                  <div class="mini-box">
                    <strong>Cosine Similarity Matching</strong><br>
                    Top-K (e.g. 5 chunks) retrieved using cosine distance + BM25 keyword reranking.
                  </div>
                </div>
                <div class="callout">
                  Extracts exact clause from 500-page policy in 12ms without fine-tuning!
                </div>
              </div>

              <div class="step-card" style="background:#022c22; border-color:#10b981;">
                <div>
                  <div class="step-num" style="color:#34d399;">Stage 04</div>
                  <div class="step-title" style="color:#6ee7b7;">Context Injection & LLM</div>
                  <div class="mini-box" style="background:#064e3b; border-color:#059669;">
                    <strong>Augmented Prompt</strong><br>
                    [System: Answer ONLY from context] + [Retrieved Top Chunks] + [User Query]
                  </div>
                  <div class="mini-box" style="background:#064e3b; border-color:#059669;">
                    <strong>Guaranteed Fact Output</strong><br>
                    "Per Section 4.2 of Enterprise Agreement, Q3 refunds are eligible within 30 days."
                  </div>
                </div>
                <div class="callout" style="border-left-color:#34d399;">
                  100% citation linked, audit defensible, and zero LLM hallucination.
                </div>
              </div>
            </div>
          </div>
        </body>
        </html>
        """
    },
    {
        "filename": "agentic-ai-react-loop.png",
        "html": """
        <!DOCTYPE html>
        <html>
        <head>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
            body { background: #1e1b4b; padding: 25px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
            .window { width: 1200px; height: 660px; background: #0f0e26; border-radius: 12px; border: 1px solid #4338ca; padding: 25px; box-shadow: 0 25px 60px rgba(0,0,0,0.6); display: flex; flex-direction: column; }
            .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #312e81; padding-bottom: 14px; margin-bottom: 20px; }
            .header h1 { font-size: 18px; color: white; font-weight: 800; }
            .header span { font-size: 12px; color: #a5b4fc; font-family: monospace; }
            .grid { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; flex: 1; align-items: center; }
            .loop-box { background: #18153d; border: 1px solid #4338ca; border-radius: 8px; padding: 20px; position: relative; }
            .step { background: #231e5c; border-radius: 6px; padding: 12px 16px; margin-bottom: 12px; border-left: 4px solid #6366f1; font-size: 12px; }
            .step strong { color: white; display: block; font-size: 13px; margin-bottom: 2px; }
            .step span { color: #c7d2fe; }
            .tools-pane { background: #18153d; border: 1px solid #4338ca; border-radius: 8px; padding: 20px; display: flex; flex-direction: column; justify-content: space-between; height: 100%; }
            .tool-item { background: #231e5c; padding: 10px 14px; border-radius: 6px; margin-bottom: 8px; font-size: 12px; display: flex; justify-content: space-between; align-items: center; }
            .badge-tool { background: #4f46e5; color: white; font-size: 10px; padding: 2px 8px; border-radius: 10px; font-weight: bold; }
          </style>
        </head>
        <body>
          <div class="window">
            <div class="header">
              <h1>Agentic AI Architecture: The ReAct Reasoning & Execution Loop</h1>
              <span>Yao et al. · Model Context Protocol (MCP) & Autonomous AI Workflows</span>
            </div>
            <div class="grid">
              <div class="loop-box">
                <div style="font-size:12px; font-weight:700; color:#a5b4fc; text-transform:uppercase; margin-bottom:12px;">Autonomous Agent Execution Cycle</div>
                <div class="step" style="border-left-color:#38bdf8;">
                  <strong>1. GOAL & CONTEXT INGESTION</strong>
                  <span>User Request: "Audit our Q2 cloud bill, find 3 runaway instances, and generate an executive PDF summary."</span>
                </div>
                <div class="step" style="border-left-color:#f59e0b;">
                  <strong>2. THOUGHT (Reasoning & Decomposition)</strong>
                  <span>Agent thinks: "I need to query AWS CloudWatch API, identify idle instances with CPU < 5%, compute cost savings, and format report."</span>
                </div>
                <div class="step" style="border-left-color:#10b981;">
                  <strong>3. ACTION (Tool Calling via MCP)</strong>
                  <span>Agent executes: <code>call_tool("aws_cost_explorer", {month: "Q2", filter: "idle"})</code></span>
                </div>
                <div class="step" style="border-left-color:#ec4899;">
                  <strong>4. OBSERVATION (Reflection & Evaluation)</strong>
                  <span>Agent evaluates return payload: "Found 4 idle m5.4xlarge instances costing ₹3,40,000/month. Proceeding to PDF compile."</span>
                </div>
                <div class="step" style="border-left-color:#8b5cf6;">
                  <strong>5. FINAL OUTPUT & USER PRESENTATION</strong>
                  <span>Autonomous task delivered with verified evidence, graphs, and audit log.</span>
                </div>
              </div>

              <div class="tools-pane">
                <div>
                  <div style="font-size:12px; font-weight:700; color:#a5b4fc; text-transform:uppercase; margin-bottom:12px;">Connected Tool Ecosystem (MCP Architecture)</div>
                  <div class="tool-item">
                    <span style="color:white;">🌐 Web Search & Documentation Scraper</span>
                    <span class="badge-tool">search_web</span>
                  </div>
                  <div class="tool-item">
                    <span style="color:white;">💻 Shell & Python Sandbox Execution</span>
                    <span class="badge-tool">run_command</span>
                  </div>
                  <div class="tool-item">
                    <span style="color:white;">📁 File Read, Edit & Vector Search</span>
                    <span class="badge-tool">read / write_file</span>
                  </div>
                  <div class="tool-item">
                    <span style="color:white;">🗄️ SQL Database & Enterprise CRM Feeds</span>
                    <span class="badge-tool">call_mcp_tool</span>
                  </div>
                  <div class="tool-item">
                    <span style="color:white;">🤝 Swarm Multi-Agent Delegation</span>
                    <span class="badge-tool">invoke_subagent</span>
                  </div>
                </div>
                <div style="background:#0f0e26; border:1px solid #312e81; padding:12px; border-radius:6px; font-size:11px; color:#c7d2fe;">
                  <strong>Key Takeaway:</strong> Unlike static chatbots that only output text, 2027 Agentic AI actively executes real code, calls APIs, browses websites, and accomplishes multi-hour workflows autonomously.
                </div>
              </div>
            </div>
          </div>
        </body>
        </html>
        """
    },
    {
        "filename": "nvidia-gpu-cluster-infra.png",
        "html": """
        <!DOCTYPE html>
        <html>
        <head>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
            body { background: #064e3b; padding: 25px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
            .window { width: 1200px; height: 660px; background: #022c22; border-radius: 12px; border: 1px solid #059669; padding: 25px; box-shadow: 0 25px 60px rgba(0,0,0,0.6); display: flex; flex-direction: column; }
            .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #047857; padding-bottom: 14px; margin-bottom: 20px; }
            .header h1 { font-size: 18px; color: white; font-weight: 800; }
            .header span { font-size: 12px; color: #76b900; font-family: monospace; font-weight: bold; }
            .grid { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; flex: 1; align-items: center; }
            .gpu-card { background: #064e3b; border: 1px solid #10b981; border-radius: 8px; padding: 20px; }
            .spec-row { display: flex; justify-content: space-between; padding: 10px 0; border-bottom: 1px solid rgba(255,255,255,0.08); font-size: 12px; }
            .spec-label { color: #a7f3d0; }
            .spec-val { color: white; font-weight: 700; font-family: monospace; }
            .stack-pane { background: #043d2e; border: 1px solid #10b981; border-radius: 8px; padding: 20px; display: flex; flex-direction: column; justify-content: space-between; height: 100%; }
          </style>
        </head>
        <body>
          <div class="window">
            <div class="header">
              <h1>AI Compute Infrastructure: NVIDIA H100 / B200 Tensor Core Architecture</h1>
              <span>NVIDIA Green Team · CUDA Parallel Compute Engine · 2027 Hardware Benchmark</span>
            </div>
            <div class="grid">
              <div class="gpu-card">
                <div style="font-size:14px; font-weight:800; color:#76b900; text-transform:uppercase; margin-bottom:12px;">NVIDIA H100 SXM5 Enterprise Accelerator</div>
                <div class="spec-row">
                  <span class="spec-label">GPU Architecture:</span>
                  <span class="spec-val">Hopper (4nm TSMC Custom Process)</span>
                </div>
                <div class="spec-row">
                  <span class="spec-label">Transistor Count:</span>
                  <span class="spec-val">80 Billion Transistors</span>
                </div>
                <div class="spec-row">
                  <span class="spec-label">High Bandwidth Memory (HBM3):</span>
                  <span class="spec-val">80 GB / 3.35 TB/sec Bandwidth</span>
                </div>
                <div class="spec-row">
                  <span class="spec-label">FP8 Tensor Core Performance:</span>
                  <span class="spec-val">4,000 TFLOPS (FP8 Matrix Math)</span>
                </div>
                <div class="spec-row">
                  <span class="spec-label">NVLink Interconnect Speed:</span>
                  <span class="spec-val">900 GB/sec Bi-Directional GPU-to-GPU</span>
                </div>
                <div class="spec-row">
                  <span class="spec-label">Thermal Design Power (TDP):</span>
                  <span class="spec-val">700W Peak Power Consumption</span>
                </div>
              </div>

              <div class="stack-pane">
                <div>
                  <div style="font-size:14px; font-weight:800; color:#76b900; text-transform:uppercase; margin-bottom:12px;">The Full AI Compute Hierarchy Stack</div>
                  <div style="background:#064e3b; padding:12px; border-radius:6px; margin-bottom:8px; border-left:4px solid #76b900;">
                    <strong style="color:white; font-size:12px;">Level 4: Application Layer (PyTorch, TensorFlow, vLLM, HuggingFace)</strong>
                    <div style="font-size:10px; color:#a7f3d0; margin-top:2px;">Python high-level APIs used by AI engineers & researchers</div>
                  </div>
                  <div style="background:#064e3b; padding:12px; border-radius:6px; margin-bottom:8px; border-left:4px solid #10b981;">
                    <strong style="color:white; font-size:12px;">Level 3: CUDA & cuDNN Acceleration Libraries</strong>
                    <div style="font-size:10px; color:#a7f3d0; margin-top:2px;">Optimized GPU kernel routines for matrix multiplications & convolutions</div>
                  </div>
                  <div style="background:#064e3b; padding:12px; border-radius:6px; margin-bottom:8px; border-left:4px solid #34d399;">
                    <strong style="color:white; font-size:12px;">Level 2: NVLink & InfiniBand Quantum Networking (400 Gbps)</strong>
                    <div style="font-size:10px; color:#a7f3d0; margin-top:2px;">Interconnects 16,000+ GPUs into a single unified supercomputer cluster</div>
                  </div>
                  <div style="background:#064e3b; padding:12px; border-radius:6px; border-left:4px solid #6ee7b7;">
                    <strong style="color:white; font-size:12px;">Level 1: Silicon & Power Grid (TSMC 3nm/4nm + Liquid Cooling)</strong>
                    <div style="font-size:10px; color:#a7f3d0; margin-top:2px;">Dedicated nuclear & renewable power grids fueling mega data centers</div>
                  </div>
                </div>
                <div style="font-size:11px; color:#6ee7b7; margin-top:10px;">
                  <strong>Why NVIDIA Dominates:</strong> CUDA software ecosystem built over 18 years makes switching away from NVIDIA GPUs almost impossible for enterprise AI teams.
                </div>
              </div>
            </div>
          </div>
        </body>
        </html>
        """
    },
    {
        "filename": "india-ai-mission-ecosystem.png",
        "html": """
        <!DOCTYPE html>
        <html>
        <head>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
            body { background: #0c1a30; padding: 25px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
            .window { width: 1200px; height: 660px; background: #081120; border-radius: 12px; border: 1px solid #1e3a8a; padding: 25px; box-shadow: 0 25px 60px rgba(0,0,0,0.6); display: flex; flex-direction: column; }
            .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #1e3a8a; padding-bottom: 14px; margin-bottom: 20px; }
            .header h1 { font-size: 18px; color: white; font-weight: 800; }
            .header span { font-size: 12px; color: #fbbf24; font-family: monospace; font-weight: bold; }
            .grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 18px; flex: 1; align-items: stretch; }
            .pillar { background: #0f1f38; border: 1px solid #1d4ed8; border-radius: 8px; padding: 18px; display: flex; flex-direction: column; justify-content: space-between; }
            .p-num { font-size: 10px; font-weight: 800; color: #fbbf24; text-transform: uppercase; letter-spacing: 1px; }
            .p-title { font-size: 14px; font-weight: 700; color: white; margin: 6px 0 10px 0; }
            .p-box { background: rgba(0,0,0,0.3); border-radius: 6px; padding: 10px; margin-bottom: 8px; font-size: 11px; color: #bfdbfe; line-height: 1.4; }
          </style>
        </head>
        <body>
          <div class="window">
            <div class="header">
              <h1>The IndiaAI Mission & Sovereign Intelligence Architecture</h1>
              <span>₹10,372 Crore Union Cabinet Allocation · MeitY & Digital India 2027</span>
            </div>
            <div class="grid">
              <div class="pillar">
                <div>
                  <div class="p-num">Pillar 01</div>
                  <div class="p-title">10,000+ Sovereign GPU Compute Pool</div>
                  <div class="p-box">
                    <strong>National Compute Grid</strong><br>
                    Subsidized GPU access provided to Indian startups, researchers, and universities to train frontier models.
                  </div>
                  <div class="p-box">
                    <strong>Public-Private Partnership (PPP)</strong><br>
                    Partnering with Indian data center providers (Yotta, Tata, Jio) to house H100/B200 clusters domestically.
                  </div>
                </div>
                <div style="font-size:10px; color:#fbbf24;">Reduces startup compute costs by up to 80%</div>
              </div>

              <div class="pillar">
                <div>
                  <div class="p-num">Pillar 02</div>
                  <div class="p-title">Indic Foundation LLMs & Datasets</div>
                  <div class="p-box">
                    <strong>Bhashini & 22 Official Languages</strong><br>
                    High-quality native speech, translation, and text datasets across Hindi, Tamil, Telugu, Bengali, Marathi, etc.
                  </div>
                  <div class="p-box">
                    <strong>Sovereign LLMs</strong><br>
                    Sarvam AI (OpenHathi), Krutrim, BharatGPT building culturally grounded Indian intelligence models.
                  </div>
                </div>
                <div style="font-size:10px; color:#fbbf24;">Empowering non-English Indian citizens with voice AI</div>
              </div>

              <div class="pillar">
                <div>
                  <div class="p-num">Pillar 03</div>
                  <div class="p-title">AI in Digital Public Infrastructure (DPI)</div>
                  <div class="p-box">
                    <strong>Citizen Services Integration</strong><br>
                    AI voice bots integrated with Aadhaar, DigiLocker, PM-Kisan, and Ayushman Bharat healthcare schemes.
                  </div>
                  <div class="p-box">
                    <strong>IndiaAI FutureSkills & Governance</strong><br>
                    Upskilling 10 Lakh Indian students in applied AI, prompt engineering, and ethical AI auditing.
                  </div>
                </div>
                <div style="font-size:10px; color:#fbbf24;">Scaling governance benefits to 1.4 Billion citizens</div>
              </div>
            </div>
          </div>
        </body>
        </html>
        """
    },
    {
        "filename": "ai-career-salary-ladder.png",
        "html": """
        <!DOCTYPE html>
        <html>
        <head>
          <style>
            * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
            body { background: #1e1b4b; padding: 25px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
            .window { width: 1200px; height: 660px; background: #0f0e26; border-radius: 12px; border: 1px solid #4338ca; padding: 25px; box-shadow: 0 25px 60px rgba(0,0,0,0.6); display: flex; flex-direction: column; }
            .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #312e81; padding-bottom: 14px; margin-bottom: 20px; }
            .header h1 { font-size: 18px; color: white; font-weight: 800; }
            .header span { font-size: 12px; color: #a5b4fc; font-family: monospace; font-weight: bold; }
            .table-wrap { flex: 1; display: flex; flex-direction: column; justify-content: space-between; }
            table { width: 100%; border-collapse: collapse; font-size: 12px; }
            th { background: #1e1b4b; color: #c7d2fe; text-align: left; padding: 10px 14px; border: 1px solid #312e81; font-size: 11px; text-transform: uppercase; }
            td { padding: 10px 14px; border: 1px solid #312e81; color: #e0e7ff; }
            tr:nth-child(even) { background: rgba(255,255,255,0.02); }
            .role-badge { font-weight: 700; color: white; }
            .sal-in { color: #34d399; font-weight: 700; font-family: monospace; }
            .sal-us { color: #38bdf8; font-weight: 700; font-family: monospace; }
            .skill-pill { background: rgba(99,102,241,0.2); color: #a5b4fc; padding: 2px 6px; border-radius: 4px; font-size: 10px; margin-right: 4px; display: inline-block; }
          </style>
        </head>
        <body>
          <div class="window">
            <div class="header">
              <h1>2027 Artificial Intelligence Career Hierarchy & Global Salary Benchmarks</h1>
              <span>RTechLab Industry Compensation Study · India (INR LPA) vs USA / Global (USD)</span>
            </div>
            <div class="table-wrap">
              <table>
                <thead>
                  <tr>
                    <th>Career Specialization</th>
                    <th>Experience Level</th>
                    <th>Primary Technical Toolkit</th>
                    <th>India Salary (INR)</th>
                    <th>Global Salary (USD)</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><strong class="role-badge">AI Solutions & Prompt Engineer</strong><br><span style="font-size:10px; color:#818cf8;">Non-coder to Applied AI entry</span></td>
                    <td>0 – 2 Years (Fresher)</td>
                    <td><span class="skill-pill">Few-Shot</span><span class="skill-pill">CoT</span><span class="skill-pill">LangChain</span><span class="skill-pill">OpenAI API</span></td>
                    <td class="sal-in">₹4.5 LPA – ₹9.5 LPA</td>
                    <td class="sal-us">$75,000 – $115,000</td>
                  </tr>
                  <tr>
                    <td><strong class="role-badge">Generative AI / LLM Developer</strong><br><span style="font-size:10px; color:#818cf8;">Builds RAG pipelines & autonomous apps</span></td>
                    <td>2 – 5 Years (Mid-Level)</td>
                    <td><span class="skill-pill">Python</span><span class="skill-pill">LlamaIndex</span><span class="skill-pill">ChromaDB</span><span class="skill-pill">FastAPI</span></td>
                    <td class="sal-in">₹10.0 LPA – ₹22.0 LPA</td>
                    <td class="sal-us">$120,000 – $175,000</td>
                  </tr>
                  <tr>
                    <td><strong class="role-badge">MLOps & AI Infrastructure Engineer</strong><br><span style="font-size:10px; color:#818cf8;">Model deployment, scaling & GPU orchestration</span></td>
                    <td>3 – 7 Years (Senior)</td>
                    <td><span class="skill-pill">Docker</span><span class="skill-pill">Kubernetes</span><span class="skill-pill">vLLM</span><span class="skill-pill">Triton</span><span class="skill-pill">CUDA</span></td>
                    <td class="sal-in">₹16.0 LPA – ₹34.0 LPA</td>
                    <td class="sal-us">$145,000 – $230,000</td>
                  </tr>
                  <tr>
                    <td><strong class="role-badge">AI Safety, Red Teaming & Ethics Auditor</strong><br><span style="font-size:10px; color:#818cf8;">Prevents jailbreaks & ensures EU AI compliance</span></td>
                    <td>3 – 6 Years (Specialist)</td>
                    <td><span class="skill-pill">Adversarial Testing</span><span class="skill-pill">Garak</span><span class="skill-pill">EU AI Act</span></td>
                    <td class="sal-in">₹12.0 LPA – ₹26.0 LPA</td>
                    <td class="sal-us">$130,000 – $210,000</td>
                  </tr>
                  <tr>
                    <td><strong class="role-badge">Lead AI Architect / Head of GenAI</strong><br><span style="font-size:10px; color:#818cf8;">Enterprise strategy & custom model fine-tuning</span></td>
                    <td>8+ Years (Executive)</td>
                    <td><span class="skill-pill">LoRA</span><span class="skill-pill">Distributed Training</span><span class="skill-pill">Cost Optimization</span></td>
                    <td class="sal-in">₹28.0 LPA – ₹48.0+ LPA</td>
                    <td class="sal-us">$200,000 – $360,000</td>
                  </tr>
                </tbody>
              </table>
              <div style="background:#0f0e26; border:1px solid #312e81; padding:10px 14px; border-radius:6px; font-size:11px; color:#c7d2fe; display:flex; justify-content:space-between; align-items:center;">
                <span><strong>Key Market Fact:</strong> Over 72% of Indian IT service companies (TCS, Infosys, Wipro, Accenture) have instituted mandatory AI skills bonuses.</span>
                <span style="color:#34d399; font-weight:bold;">Source: NASSCOM & RTechLab 2027 Compensation Survey</span>
              </div>
            </div>
          </div>
        </body>
        </html>
        """
    }
]

for diag in diagrams:
    dest_png = os.path.join(out_dir, diag["filename"])
    temp_html = os.path.join(out_dir, f"temp_{diag['filename']}.html")
    with open(temp_html, "w", encoding="utf-8") as f:
        f.write(diag["html"])
    
    cmd = [
        chrome_path,
        "--headless",
        "--disable-gpu",
        f"--screenshot={os.path.abspath(dest_png)}",
        "--window-size=1280,720",
        os.path.abspath(temp_html)
    ]
    subprocess.run(cmd, check=True)
    if os.path.exists(temp_html):
        os.remove(temp_html)
    print(f"Generated diagram: {diag['filename']} ({round(os.path.getsize(dest_png)/1024, 1)} KB)")

print("All 6 core AI architecture diagrams generated successfully!")
