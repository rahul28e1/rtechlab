# -*- coding: utf-8 -*-
import os
import subprocess

out_dir = "DIGITAL/AI_ESSENTIALS/07_SOURCE_FILES/03_VISUAL_ASSETS/diagrams"
os.makedirs(out_dir, exist_ok=True)
chrome_path = r"C:\Program Files\Google\Chrome\Application\chrome.exe"

diagrams = [
    {
        "filename": "ai-hierarchy-concentric.png",
        "html": """<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; }
    body { background: #FFFFFF; padding: 25px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
    .container { width: 1200px; height: 660px; background: #F8FAFC; border-radius: 12px; border: 1.5px solid #CBD5E1; padding: 25px 30px; display: grid; grid-template-columns: 1.15fr 1fr; gap: 30px; align-items: center; box-shadow: 0 10px 30px rgba(0,0,0,0.06); }
    .svg-box { width: 560px; height: 560px; display: flex; justify-content: center; align-items: center; }
    .info-panel { display: flex; flex-direction: column; gap: 14px; }
    .card { background: #FFFFFF; border-radius: 8px; padding: 14px 18px; border: 1px solid #E2E8F0; border-left: 4px solid #3B82F6; box-shadow: 0 2px 6px rgba(0,0,0,0.03); }
    .card h3 { font-size: 14px; color: #0F172A; margin-bottom: 4px; display: flex; justify-content: space-between; align-items: center; }
    .card p { font-size: 11px; color: #475569; line-height: 1.45; }
    .badge { font-size: 10px; padding: 2px 8px; border-radius: 12px; font-weight: bold; }
  </style>
</head>
<body>
  <div class='container'>
    <div class='svg-box'>
      <svg width='560' height='560' viewBox='0 0 560 560'>
        <defs>
          <linearGradient id='genGrad' x1='0%' y1='0%' x2='100%' y2='100%'>
            <stop offset='0%' stop-color='#F43F5E'/>
            <stop offset='100%' stop-color='#F59E0B'/>
          </linearGradient>
          <filter id='shadow' x='-20%' y='-20%' width='140%' height='140%'>
            <feDropShadow dx='0' dy='4' stdDeviation='8' flood-color='#F43F5E' flood-opacity='0.35'/>
          </filter>
        </defs>

        <!-- 1. AI Circle (cx=280, cy=280, R=260) -> Peak: 20 -->
        <circle cx='280' cy='280' r='260' fill='rgba(59, 130, 246, 0.08)' stroke='#3B82F6' stroke-width='2.5'/>
        <text x='280' y='76' text-anchor='middle' font-size='12' font-weight='800' fill='#1D4ED8' letter-spacing='0.6'>1. ARTIFICIAL INTELLIGENCE (1950s)</text>
        <text x='280' y='94' text-anchor='middle' font-size='9.5' fill='#475569'>Any technique enabling computers to mimic human intelligence</text>

        <!-- 2. ML Circle (cx=280, cy=330, R=200) -> Peak: 130 -->
        <circle cx='280' cy='330' r='200' fill='rgba(13, 148, 136, 0.12)' stroke='#0D9488' stroke-width='2.5'/>
        <text x='280' y='180' text-anchor='middle' font-size='11.5' font-weight='800' fill='#0F766E' letter-spacing='0.5'>2. MACHINE LEARNING (1980s)</text>
        <text x='280' y='196' text-anchor='middle' font-size='9' fill='#475569'>Statistical algorithms learning from data without explicit rules</text>

        <!-- 3. DL Circle (cx=280, cy=375, R=140) -> Peak: 235 -->
        <circle cx='280' cy='375' r='140' fill='rgba(147, 51, 234, 0.12)' stroke='#9333EA' stroke-width='2.5'/>
        <text x='280' y='278' text-anchor='middle' font-size='11' font-weight='800' fill='#7E22CE' letter-spacing='0.5'>3. DEEP LEARNING (2010s)</text>
        <text x='280' y='293' text-anchor='middle' font-size='8.5' fill='#475569'>Multi-layer neural networks mimicking human neocortex</text>

        <!-- 4. GenAI Core Circle (cx=280, cy=420, R=80) -> Peak: 340 -->
        <circle cx='280' cy='420' r='80' fill='url(#genGrad)' stroke='#BE123C' stroke-width='2' filter='url(#shadow)'/>
        <text x='280' y='402' text-anchor='middle' font-size='13' font-weight='800' fill='#FFFFFF'>4. Generative AI</text>
        <text x='280' y='419' text-anchor='middle' font-size='10' font-weight='normal' fill='#FFF1F2'>(2022–2027)</text>
        <rect x='225' y='430' width='110' height='18' rx='4' fill='rgba(0,0,0,0.25)'/>
        <text x='280' y='443' text-anchor='middle' font-size='9' font-weight='bold' fill='#FFFFFF'>LLMs &amp; Diffusion</text>
      </svg>
    </div>

    <div class='info-panel'>
      <div style='margin-bottom:6px;'>
        <h2 style='color:#0F172A; font-size:20px; font-weight:800;'>The AI Taxonomy Hierarchy</h2>
        <p style='color:#64748B; font-size:12px;'>RTechLab Official 2027 Machine Intelligence Classification Architecture</p>
      </div>
      <div class='card' style='border-left-color:#3B82F6;'>
        <h3>Artificial Intelligence (AI) <span class='badge' style='background:#EFF6FF; color:#1D4ED8; border:1px solid #BFDBFE;'>Foundational Field</span></h3>
        <p>Encompasses expert systems, symbolic logic, search algorithms, robotics, and knowledge bases designed to automate rational decision-making.</p>
      </div>
      <div class='card' style='border-left-color:#0D9488;'>
        <h3>Machine Learning (ML) <span class='badge' style='background:#F0FDFA; color:#0F766E; border:1px solid #99F6E4;'>Statistical Engines</span></h3>
        <p>Supervised learning (linear regression, random forests), unsupervised learning (k-means, PCA), and reinforcement learning (Q-learning).</p>
      </div>
      <div class='card' style='border-left-color:#9333EA;'>
        <h3>Deep Learning (DL) <span class='badge' style='background:#FAF5FF; color:#7E22CE; border:1px solid #E9D5FF;'>Artificial Neural Nets</span></h3>
        <p>CNNs for computer vision, RNNs/LSTMs for sequence modeling, leveraging matrix multiplication on specialized GPU clusters.</p>
      </div>
      <div class='card' style='border-left-color:#F43F5E;'>
        <h3>Generative AI &amp; Foundation Models <span class='badge' style='background:#FFF1F2; color:#BE123C; border:1px solid #FECDD3;'>Current Frontier</span></h3>
        <p>Transformer-based autoregressive models (GPT-4, Gemini, Claude, Llama 3) generating novel code, language, images, and agentic actions.</p>
      </div>
    </div>
  </div>
</body>
</html>"""
    },
    {
        "filename": "transformer-attention-architecture.png",
        "html": """<!DOCTYPE html>
<html>
<head>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
    body { background: #FFFFFF; padding: 25px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
    .window { width: 1200px; height: 660px; background: #F8FAFC; border-radius: 12px; border: 1.5px solid #CBD5E1; padding: 25px; box-shadow: 0 10px 30px rgba(0,0,0,0.06); display: flex; flex-direction: column; }
    .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1.5px solid #E2E8F0; padding-bottom: 15px; margin-bottom: 20px; }
    .header h1 { font-size: 18px; color: #0F172A; font-weight: 800; }
    .header span { font-size: 12px; color: #0284C7; font-family: monospace; font-weight: bold; }
    .grid { display: grid; grid-template-columns: 1fr 1.3fr 1fr; gap: 20px; flex: 1; align-items: center; }
    .col { background: #FFFFFF; border: 1px solid #E2E8F0; border-radius: 8px; padding: 18px; height: 100%; display: flex; flex-direction: column; justify-content: space-between; box-shadow: 0 2px 6px rgba(0,0,0,0.02); }
    .col-title { font-size: 13px; font-weight: 700; color: #334155; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 12px; border-bottom: 1px solid #E2E8F0; padding-bottom: 6px; }
    .box { background: #F8FAFC; border: 1px solid #CBD5E1; border-radius: 6px; padding: 10px; margin-bottom: 8px; text-align: center; }
    .box-blue { background: #EFF6FF; border-color: #93C5FD; color: #1E40AF; }
    .box-amber { background: #FFFBEB; border-color: #FDE68A; color: #92400E; }
    .box-purple { background: #FAF5FF; border-color: #E9D5FF; color: #6B21A8; }
    .box-green { background: #F0FDF4; border-color: #A7F3D0; color: #065F46; }
    .formula-card { background: #F0F9FF; border: 1.5px dashed #0284C7; border-radius: 8px; padding: 12px; text-align: center; margin-top: 10px; font-family: Consolas, monospace; color: #0369A1; font-size: 13px; font-weight: bold; }
    .arrow { text-align: center; color: #64748B; font-size: 13px; margin: 4px 0; font-weight: 600; }
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
            <div style="font-size:10px; color:#1D4ED8; margin-top:2px;">"Artificial Intelligence in 2027"</div>
          </div>
          <div class="arrow">↓ Tokenizer (BPE)</div>
          <div class="box">
            <strong>Byte-Pair Tokens</strong>
            <div style="font-size:10px; color:#475569; margin-top:2px;">[3452, 9812, 287, 4921]</div>
          </div>
          <div class="arrow">↓ Vector Lookup</div>
          <div class="box box-purple">
            <strong>Token Embeddings</strong>
            <div style="font-size:10px; color:#7E22CE; margin-top:2px;">Dense Vector: 4096 Dimensions</div>
          </div>
          <div class="arrow">+ Positional Encoding</div>
          <div class="box">
            <strong>Positional Vector (RoPE)</strong>
            <div style="font-size:10px; color:#475569; margin-top:2px;">Encodes sequence token ordering</div>
          </div>
        </div>
        <div style="font-size:10px; color:#64748B; line-height:1.3;">
          Every word becomes a high-dimensional vector capturing semantic geometry.
        </div>
      </div>

      <div class="col" style="background:#F8FAFC; border-color:#93C5FD;">
        <div>
          <div class="col-title" style="color:#0284C7;">2. Multi-Head Self-Attention Core</div>
          <div style="display:grid; grid-template-columns:1fr 1fr 1fr; gap:6px; margin-bottom:12px;">
            <div class="box" style="background:#EFF6FF; border-color:#93C5FD; color:#1E40AF; font-size:11px;">
              <strong>Queries (Q)</strong><br><span style="font-size:9px;">What am I looking for?</span>
            </div>
            <div class="box" style="background:#F0FDF4; border-color:#A7F3D0; color:#065F46; font-size:11px;">
              <strong>Keys (K)</strong><br><span style="font-size:9px;">What do I contain?</span>
            </div>
            <div class="box" style="background:#FAF5FF; border-color:#E9D5FF; color:#6B21A8; font-size:11px;">
              <strong>Values (V)</strong><br><span style="font-size:9px;">What info do I pass?</span>
            </div>
          </div>
          <div class="formula-card">
            Attention(Q, K, V) = softmax(Q·Kᵀ / √dₖ) · V
          </div>
          <div style="margin-top:12px;" class="box box-amber">
            <strong>Scaled Dot-Product Matrix</strong>
            <div style="font-size:10px; color:#92400E; margin-top:2px;">Computes pairwise attention weights between every token pair</div>
          </div>
          <div class="arrow">↓ Parallel Multi-Head Concatenation</div>
          <div class="box box-blue">
            <strong>32 to 128 Parallel Attention Heads</strong>
            <div style="font-size:10px; color:#1E40AF; margin-top:2px;">Each head attends to grammar, facts, tone, or long-range logic</div>
          </div>
        </div>
        <div style="font-size:10px; color:#0369A1; line-height:1.3; background:#EFF6FF; padding:8px; border-radius:4px; border:1px solid #BFDBFE;">
          Parallel matrix multiplication replaces slow sequential RNNs, enabling training on billions of tokens.
        </div>
      </div>

      <div class="col">
        <div>
          <div class="col-title">3. Feed-Forward & Output</div>
          <div class="box">
            <strong>LayerNorm & Residual Add</strong>
            <div style="font-size:10px; color:#475569; margin-top:2px;">Prevents vanishing gradients in deep nets</div>
          </div>
          <div class="arrow">↓</div>
          <div class="box box-purple">
            <strong>Feed-Forward Network (MLP)</strong>
            <div style="font-size:10px; color:#7E22CE; margin-top:2px;">SwiGLU activation & factual memory store</div>
          </div>
          <div class="arrow">↓ N Stacked Transformer Blocks</div>
          <div class="box">
            <strong>Linear Head & Softmax</strong>
            <div style="font-size:10px; color:#475569; margin-top:2px;">Probabilities over 128k vocabulary</div>
          </div>
          <div class="arrow">↓ Sampling (Temp, Top-p)</div>
          <div class="box box-green">
            <strong>Next Generated Token</strong>
            <div style="font-size:10px; color:#065F46; margin-top:2px;">Streamed to user at 60+ tokens/sec</div>
          </div>
        </div>
        <div style="font-size:10px; color:#64748B; line-height:1.3;">
          Autoregressive loop: each new token is appended to input to predict the subsequent token.
        </div>
      </div>
    </div>
  </div>
</body>
</html>"""
    },
    {
        "filename": "rag-vector-pipeline.png",
        "html": """<!DOCTYPE html>
<html>
<head>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
    body { background: #FFFFFF; padding: 25px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
    .window { width: 1200px; height: 660px; background: #F8FAFC; border-radius: 12px; border: 1.5px solid #CBD5E1; padding: 25px; box-shadow: 0 10px 30px rgba(0,0,0,0.06); display: flex; flex-direction: column; }
    .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1.5px solid #E2E8F0; padding-bottom: 14px; margin-bottom: 20px; }
    .header h1 { font-size: 18px; color: #0F172A; font-weight: 800; }
    .header span { font-size: 12px; color: #059669; font-family: monospace; font-weight: bold; }
    .flow { display: grid; grid-template-columns: repeat(4, 1fr); gap: 18px; flex: 1; align-items: stretch; }
    .step-card { background: #FFFFFF; border: 1.5px solid #E2E8F0; border-radius: 8px; padding: 18px; display: flex; flex-direction: column; justify-content: space-between; box-shadow: 0 2px 6px rgba(0,0,0,0.02); }
    .step-num { font-size: 11px; font-weight: 800; color: #059669; text-transform: uppercase; letter-spacing: 1px; }
    .step-title { font-size: 15px; font-weight: 700; color: #0F172A; margin: 6px 0 12px 0; }
    .mini-box { background: #F8FAFC; border: 1px solid #E2E8F0; border-radius: 6px; padding: 10px; margin-bottom: 10px; font-size: 11px; color: #334155; }
    .callout { background: #F0FDF4; border-left: 3px solid #059669; padding: 8px 10px; font-size: 10px; color: #065F46; margin-top: 10px; }
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
            <strong style="color:#0F172A;">Enterprise Sources</strong><br>
            PDFs, Notion Docs, SQL Dumps, Jira tickets, Code repositories.
          </div>
          <div class="mini-box">
            <strong style="color:#0F172A;">Smart Chunking</strong><br>
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
            <strong style="color:#0F172A;">Embedding Model</strong><br>
            text-embedding-3-large transforms text chunks into 1,536-dim coordinates.
          </div>
          <div class="mini-box">
            <strong style="color:#0F172A;">Vector Indexing</strong><br>
            Pinecone, ChromaDB, Weaviate, pgvector with HNSW index for sub-ms search.
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
            <strong style="color:#0F172A;">User Query</strong><br>
            "What is our Q3 refund policy for enterprise cloud licenses?"
          </div>
          <div class="mini-box">
            <strong style="color:#0F172A;">Cosine Similarity Matching</strong><br>
            Top-K retrieved using cosine distance + BM25 keyword reranking.
          </div>
        </div>
        <div class="callout">
          Extracts exact clause from 500-page policy in 12ms without fine-tuning!
        </div>
      </div>

      <div class="step-card" style="border-color:#059669; background:#F0FDF4;">
        <div>
          <div class="step-num" style="color:#047857;">Stage 04</div>
          <div class="step-title" style="color:#065F46;">Context Injection & LLM</div>
          <div class="mini-box" style="background:#FFFFFF; border-color:#A7F3D0;">
            <strong style="color:#065F46;">Augmented Prompt</strong><br>
            [System: Answer ONLY from context] + [Retrieved Top Chunks] + [User Query]
          </div>
          <div class="mini-box" style="background:#FFFFFF; border-color:#A7F3D0;">
            <strong style="color:#065F46;">Guaranteed Fact Output</strong><br>
            "Per Section 4.2 of Enterprise Agreement, Q3 refunds are eligible within 30 days."
          </div>
        </div>
        <div class="callout" style="border-left-color:#047857; background:#DCFCE7;">
          100% citation linked, audit defensible, and zero LLM hallucination.
        </div>
      </div>
    </div>
  </div>
</body>
</html>"""
    },
    {
        "filename": "agentic-ai-react-loop.png",
        "html": """<!DOCTYPE html>
<html>
<head>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
    body { background: #FFFFFF; padding: 25px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
    .window { width: 1200px; height: 660px; background: #F8FAFC; border-radius: 12px; border: 1.5px solid #CBD5E1; padding: 25px; box-shadow: 0 10px 30px rgba(0,0,0,0.06); display: flex; flex-direction: column; }
    .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1.5px solid #E2E8F0; padding-bottom: 14px; margin-bottom: 20px; }
    .header h1 { font-size: 18px; color: #0F172A; font-weight: 800; }
    .header span { font-size: 12px; color: #4F46E5; font-family: monospace; font-weight: bold; }
    .grid { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; flex: 1; align-items: center; }
    .loop-box { background: #FFFFFF; border: 1.5px solid #E2E8F0; border-radius: 8px; padding: 20px; position: relative; box-shadow: 0 2px 6px rgba(0,0,0,0.02); }
    .step { background: #F8FAFC; border-radius: 6px; padding: 12px 16px; margin-bottom: 12px; border: 1px solid #E2E8F0; border-left: 4px solid #6366F1; font-size: 12px; }
    .step strong { color: #0F172A; display: block; font-size: 13px; margin-bottom: 2px; }
    .step span { color: #475569; }
    .tools-pane { background: #FFFFFF; border: 1.5px solid #E2E8F0; border-radius: 8px; padding: 20px; display: flex; flex-direction: column; justify-content: space-between; height: 100%; box-shadow: 0 2px 6px rgba(0,0,0,0.02); }
    .tool-item { background: #F8FAFC; border: 1px solid #E2E8F0; padding: 10px 14px; border-radius: 6px; margin-bottom: 8px; font-size: 12px; display: flex; justify-content: space-between; align-items: center; }
    .badge-tool { background: #EEF2FF; color: #4F46E5; border: 1px solid #C7D2FE; font-size: 10px; padding: 2px 8px; border-radius: 10px; font-weight: bold; }
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
        <div style="font-size:12px; font-weight:700; color:#4F46E5; text-transform:uppercase; margin-bottom:12px;">Autonomous Agent Execution Cycle</div>
        <div class="step" style="border-left-color:#0284C7;">
          <strong>1. GOAL & CONTEXT INGESTION</strong>
          <span>User Request: "Audit our Q2 cloud bill, find 3 runaway instances, and generate an executive PDF summary."</span>
        </div>
        <div class="step" style="border-left-color:#D97706;">
          <strong>2. THOUGHT (Reasoning & Decomposition)</strong>
          <span>Agent thinks: "I need to query AWS CloudWatch API, identify idle instances with CPU < 5%, compute cost savings, and format report."</span>
        </div>
        <div class="step" style="border-left-color:#059669;">
          <strong>3. ACTION (Tool Calling via MCP)</strong>
          <span>Agent executes: <code>call_tool("aws_cost_explorer", {month: "Q2", filter: "idle"})</code></span>
        </div>
        <div class="step" style="border-left-color:#DB2777;">
          <strong>4. OBSERVATION (Reflection & Evaluation)</strong>
          <span>Agent evaluates return payload: "Found 4 idle m5.4xlarge instances costing ₹3,40,000/month. Proceeding to PDF compile."</span>
        </div>
        <div class="step" style="border-left-color:#7C3AED;">
          <strong>5. FINAL OUTPUT & USER PRESENTATION</strong>
          <span>Autonomous task delivered with verified evidence, graphs, and audit log.</span>
        </div>
      </div>

      <div class="tools-pane">
        <div>
          <div style="font-size:12px; font-weight:700; color:#4F46E5; text-transform:uppercase; margin-bottom:12px;">Connected Tool Ecosystem (MCP Architecture)</div>
          <div class="tool-item">
            <span style="color:#0F172A; font-weight:600;">🌐 Web Search & Documentation Scraper</span>
            <span class="badge-tool">search_web</span>
          </div>
          <div class="tool-item">
            <span style="color:#0F172A; font-weight:600;">💻 Shell & Python Sandbox Execution</span>
            <span class="badge-tool">run_command</span>
          </div>
          <div class="tool-item">
            <span style="color:#0F172A; font-weight:600;">📁 File Read, Edit & Vector Search</span>
            <span class="badge-tool">read / write_file</span>
          </div>
          <div class="tool-item">
            <span style="color:#0F172A; font-weight:600;">🗄️ SQL Database & Enterprise CRM Feeds</span>
            <span class="badge-tool">call_mcp_tool</span>
          </div>
          <div class="tool-item">
            <span style="color:#0F172A; font-weight:600;">🤝 Swarm Multi-Agent Delegation</span>
            <span class="badge-tool">invoke_subagent</span>
          </div>
        </div>
        <div style="background:#F5F3FF; border:1px solid #DDD6FE; padding:12px; border-radius:6px; font-size:11px; color:#4C1D95;">
          <strong>Key Takeaway:</strong> Unlike static chatbots that only output text, 2027 Agentic AI actively executes real code, calls APIs, browses websites, and accomplishes multi-hour workflows autonomously.
        </div>
      </div>
    </div>
  </div>
</body>
</html>"""
    },
    {
        "filename": "nvidia-gpu-cluster-infra.png",
        "html": """<!DOCTYPE html>
<html>
<head>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
    body { background: #FFFFFF; padding: 25px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
    .window { width: 1200px; height: 660px; background: #F8FAFC; border-radius: 12px; border: 1.5px solid #CBD5E1; padding: 25px; box-shadow: 0 10px 30px rgba(0,0,0,0.06); display: flex; flex-direction: column; }
    .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1.5px solid #E2E8F0; padding-bottom: 14px; margin-bottom: 20px; }
    .header h1 { font-size: 18px; color: #0F172A; font-weight: 800; }
    .header span { font-size: 12px; color: #16A34A; font-family: monospace; font-weight: bold; }
    .grid { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; flex: 1; align-items: center; }
    .gpu-card { background: #FFFFFF; border: 1.5px solid #E2E8F0; border-radius: 8px; padding: 20px; box-shadow: 0 2px 6px rgba(0,0,0,0.02); }
    .spec-row { display: flex; justify-content: space-between; padding: 10px 0; border-bottom: 1px solid #F1F5F9; font-size: 12px; }
    .spec-label { color: #475569; }
    .spec-val { color: #0F172A; font-weight: 700; font-family: monospace; }
    .stack-pane { background: #FFFFFF; border: 1.5px solid #E2E8F0; border-radius: 8px; padding: 20px; display: flex; flex-direction: column; justify-content: space-between; height: 100%; box-shadow: 0 2px 6px rgba(0,0,0,0.02); }
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
        <div style="font-size:14px; font-weight:800; color:#16A34A; text-transform:uppercase; margin-bottom:12px;">NVIDIA H100 SXM5 Enterprise Accelerator</div>
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
          <div style="font-size:14px; font-weight:800; color:#16A34A; text-transform:uppercase; margin-bottom:12px;">The Full AI Compute Hierarchy Stack</div>
          <div style="background:#F0FDF4; border:1px solid #BBF7D0; padding:12px; border-radius:6px; margin-bottom:8px; border-left:4px solid #16A34A;">
            <strong style="color:#065F46; font-size:12px;">Level 4: Application Layer (PyTorch, TensorFlow, vLLM, HuggingFace)</strong>
            <div style="font-size:10px; color:#166534; margin-top:2px;">Python high-level APIs used by AI engineers & researchers</div>
          </div>
          <div style="background:#F0FDF4; border:1px solid #BBF7D0; padding:12px; border-radius:6px; margin-bottom:8px; border-left:4px solid #059669;">
            <strong style="color:#065F46; font-size:12px;">Level 3: CUDA & cuDNN Acceleration Libraries</strong>
            <div style="font-size:10px; color:#166534; margin-top:2px;">Optimized GPU kernel routines for matrix multiplications & convolutions</div>
          </div>
          <div style="background:#F0FDF4; border:1px solid #BBF7D0; padding:12px; border-radius:6px; margin-bottom:8px; border-left:4px solid #0D9488;">
            <strong style="color:#065F46; font-size:12px;">Level 2: NVLink & InfiniBand Quantum Networking (400 Gbps)</strong>
            <div style="font-size:10px; color:#166534; margin-top:2px;">Interconnects 16,000+ GPUs into a single unified supercomputer cluster</div>
          </div>
          <div style="background:#F0FDF4; border:1px solid #BBF7D0; padding:12px; border-radius:6px; border-left:4px solid #0284C7;">
            <strong style="color:#065F46; font-size:12px;">Level 1: Silicon & Power Grid (TSMC 3nm/4nm + Liquid Cooling)</strong>
            <div style="font-size:10px; color:#166534; margin-top:2px;">Dedicated nuclear & renewable power grids fueling mega data centers</div>
          </div>
        </div>
        <div style="font-size:11px; color:#065F46; margin-top:10px; background:#DCFCE7; padding:8px 10px; border-radius:4px;">
          <strong>Why NVIDIA Dominates:</strong> CUDA software ecosystem built over 18 years makes switching away from NVIDIA GPUs almost impossible for enterprise AI teams.
        </div>
      </div>
    </div>
  </div>
</body>
</html>"""
    },
    {
        "filename": "india-ai-mission-ecosystem.png",
        "html": """<!DOCTYPE html>
<html>
<head>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
    body { background: #FFFFFF; padding: 25px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
    .window { width: 1200px; height: 660px; background: #F8FAFC; border-radius: 12px; border: 1.5px solid #CBD5E1; padding: 25px; box-shadow: 0 10px 30px rgba(0,0,0,0.06); display: flex; flex-direction: column; }
    .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1.5px solid #E2E8F0; padding-bottom: 14px; margin-bottom: 20px; }
    .header h1 { font-size: 18px; color: #0F172A; font-weight: 800; }
    .header span { font-size: 12px; color: #D97706; font-family: monospace; font-weight: bold; }
    .grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 18px; flex: 1; align-items: stretch; }
    .pillar { background: #FFFFFF; border: 1.5px solid #E2E8F0; border-radius: 8px; padding: 18px; display: flex; flex-direction: column; justify-content: space-between; box-shadow: 0 2px 6px rgba(0,0,0,0.02); }
    .p-num { font-size: 10px; font-weight: 800; color: #D97706; text-transform: uppercase; letter-spacing: 1px; }
    .p-title { font-size: 14px; font-weight: 700; color: #0F172A; margin: 6px 0 10px 0; }
    .p-box { background: #F8FAFC; border: 1px solid #E2E8F0; border-radius: 6px; padding: 10px; margin-bottom: 8px; font-size: 11px; color: #334155; line-height: 1.4; }
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
            <strong style="color:#0F172A;">National Compute Grid</strong><br>
            Subsidized GPU access provided to Indian startups, researchers, and universities to train frontier models.
          </div>
          <div class="p-box">
            <strong style="color:#0F172A;">Public-Private Partnership (PPP)</strong><br>
            Partnering with Indian data center providers (Yotta, Tata, Jio) to house H100/B200 clusters domestically.
          </div>
        </div>
        <div style="font-size:10px; color:#B45309; background:#FEF3C7; padding:4px 8px; border-radius:4px; font-weight:600;">Reduces startup compute costs by up to 80%</div>
      </div>

      <div class="pillar">
        <div>
          <div class="p-num">Pillar 02</div>
          <div class="p-title">Indic Foundation LLMs & Datasets</div>
          <div class="p-box">
            <strong style="color:#0F172A;">Bhashini & 22 Official Languages</strong><br>
            High-quality native speech, translation, and text datasets across Hindi, Tamil, Telugu, Bengali, Marathi, etc.
          </div>
          <div class="p-box">
            <strong style="color:#0F172A;">Sovereign LLMs</strong><br>
            Sarvam AI (OpenHathi), Krutrim, BharatGPT building culturally grounded Indian intelligence models.
          </div>
        </div>
        <div style="font-size:10px; color:#B45309; background:#FEF3C7; padding:4px 8px; border-radius:4px; font-weight:600;">Empowering non-English Indian citizens with voice AI</div>
      </div>

      <div class="pillar">
        <div>
          <div class="p-num">Pillar 03</div>
          <div class="p-title">AI in Digital Public Infrastructure (DPI)</div>
          <div class="p-box">
            <strong style="color:#0F172A;">Citizen Services Integration</strong><br>
            AI voice bots integrated with Aadhaar, DigiLocker, PM-Kisan, and Ayushman Bharat healthcare schemes.
          </div>
          <div class="p-box">
            <strong style="color:#0F172A;">IndiaAI FutureSkills & Governance</strong><br>
            Upskilling 10 Lakh Indian students in applied AI, prompt engineering, and ethical AI auditing.
          </div>
        </div>
        <div style="font-size:10px; color:#B45309; background:#FEF3C7; padding:4px 8px; border-radius:4px; font-weight:600;">Scaling governance benefits to 1.4 Billion citizens</div>
      </div>
    </div>
  </div>
</body>
</html>"""
    },
    {
        "filename": "ai-career-salary-ladder.png",
        "html": """<!DOCTYPE html>
<html>
<head>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
    body { background: #FFFFFF; padding: 25px; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
    .window { width: 1200px; height: 660px; background: #F8FAFC; border-radius: 12px; border: 1.5px solid #CBD5E1; padding: 25px; box-shadow: 0 10px 30px rgba(0,0,0,0.06); display: flex; flex-direction: column; }
    .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 1.5px solid #E2E8F0; padding-bottom: 14px; margin-bottom: 20px; }
    .header h1 { font-size: 18px; color: #0F172A; font-weight: 800; }
    .header span { font-size: 12px; color: #4F46E5; font-family: monospace; font-weight: bold; }
    .table-wrap { flex: 1; display: flex; flex-direction: column; justify-content: space-between; }
    table { width: 100%; border-collapse: collapse; font-size: 12px; }
    th { background: #E2E8F0; color: #0F172A; text-align: left; padding: 10px 14px; border: 1px solid #CBD5E1; font-size: 11px; text-transform: uppercase; font-weight: 800; }
    td { padding: 10px 14px; border: 1px solid #CBD5E1; color: #334155; }
    tr:nth-child(even) { background: #FFFFFF; }
    tr:nth-child(odd) { background: #F8FAFC; }
    .role-badge { font-weight: 700; color: #0F172A; }
    .sal-in { color: #059669; font-weight: 800; font-family: monospace; }
    .sal-us { color: #0284C7; font-weight: 800; font-family: monospace; }
    .skill-pill { background: #EEF2FF; color: #4F46E5; border: 1px solid #C7D2FE; padding: 2px 6px; border-radius: 4px; font-size: 10px; margin-right: 4px; display: inline-block; font-weight: 600; }
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
            <td><strong class="role-badge">AI Solutions & Prompt Engineer</strong><br><span style="font-size:10px; color:#64748B;">Non-coder to Applied AI entry</span></td>
            <td>0 – 2 Years (Fresher)</td>
            <td><span class="skill-pill">Few-Shot</span><span class="skill-pill">CoT</span><span class="skill-pill">LangChain</span><span class="skill-pill">OpenAI API</span></td>
            <td class="sal-in">₹4.5 LPA – ₹9.5 LPA</td>
            <td class="sal-us">$75,000 – $115,000</td>
          </tr>
          <tr>
            <td><strong class="role-badge">Generative AI / LLM Developer</strong><br><span style="font-size:10px; color:#64748B;">Builds RAG pipelines & autonomous apps</span></td>
            <td>2 – 5 Years (Mid-Level)</td>
            <td><span class="skill-pill">Python</span><span class="skill-pill">LlamaIndex</span><span class="skill-pill">ChromaDB</span><span class="skill-pill">FastAPI</span></td>
            <td class="sal-in">₹10.0 LPA – ₹22.0 LPA</td>
            <td class="sal-us">$120,000 – $175,000</td>
          </tr>
          <tr>
            <td><strong class="role-badge">MLOps & AI Infrastructure Engineer</strong><br><span style="font-size:10px; color:#64748B;">Model deployment, scaling & GPU orchestration</span></td>
            <td>3 – 7 Years (Senior)</td>
            <td><span class="skill-pill">Docker</span><span class="skill-pill">Kubernetes</span><span class="skill-pill">vLLM</span><span class="skill-pill">Triton</span><span class="skill-pill">CUDA</span></td>
            <td class="sal-in">₹16.0 LPA – ₹34.0 LPA</td>
            <td class="sal-us">$145,000 – $230,000</td>
          </tr>
          <tr>
            <td><strong class="role-badge">AI Safety, Red Teaming & Ethics Auditor</strong><br><span style="font-size:10px; color:#64748B;">Prevents jailbreaks & ensures EU AI compliance</span></td>
            <td>3 – 6 Years (Specialist)</td>
            <td><span class="skill-pill">Adversarial Testing</span><span class="skill-pill">Garak</span><span class="skill-pill">EU AI Act</span></td>
            <td class="sal-in">₹12.0 LPA – ₹26.0 LPA</td>
            <td class="sal-us">$130,000 – $210,000</td>
          </tr>
          <tr>
            <td><strong class="role-badge">Lead AI Architect / Head of GenAI</strong><br><span style="font-size:10px; color:#64748B;">Enterprise strategy & custom model fine-tuning</span></td>
            <td>8+ Years (Executive)</td>
            <td><span class="skill-pill">LoRA</span><span class="skill-pill">Distributed Training</span><span class="skill-pill">Cost Optimization</span></td>
            <td class="sal-in">₹28.0 LPA – ₹48.0+ LPA</td>
            <td class="sal-us">$200,000 – $360,000</td>
          </tr>
        </tbody>
      </table>
      <div style="background:#EFF6FF; border:1px solid #BFDBFE; padding:10px 14px; border-radius:6px; font-size:11px; color:#1E40AF; display:flex; justify-content:space-between; align-items:center;">
        <span><strong>Key Market Fact:</strong> Over 72% of Indian IT service companies (TCS, Infosys, Wipro, Accenture) have instituted mandatory AI skills bonuses.</span>
        <span style="color:#059669; font-weight:bold;">Source: NASSCOM & RTechLab 2027 Compensation Survey</span>
      </div>
    </div>
  </div>
</body>
</html>"""
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
    print(f"Generated clean light diagram: {diag['filename']} ({round(os.path.getsize(dest_png)/1024, 1)} KB)")

print("All 7 core AI architecture diagrams generated in 100% clean light academic theme!")
