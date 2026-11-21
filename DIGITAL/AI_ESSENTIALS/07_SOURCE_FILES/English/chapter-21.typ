#import "../07_PUBLISHING_ENGINE/master-theme.typ": *

#text(size: 7.5pt, font: "Segoe UI", weight: "bold", fill: rgb("#0284C7"))[PART 3: TRANSFORMERS & GENERATIVE AI · CHAPTER 21]
= Autonomous Agentic AI & Tool-Calling Systems

#text(size: 7.3pt, fill: rgb("#1E293B").lighten(20%))[
  The frontier of AI is transitioning from passive question-answering chat interfaces to proactive *Autonomous Agents*. Equipped with reasoning loops, tool calling, memory, and environment feedback, agents execute multi-step commercial workflows without human supervision.
]

#v(1.5pt)

#align(center)[
  #image("../03_VISUAL_ASSETS/diagrams/agentic-ai-react-loop.png", width: 88%)
]

#v(1.5pt)

== 21.1 The ReAct Loop Framework (Reason + Act + Observe)

Pioneered by Yao et al. (Princeton & Google, 2022), the ReAct framework interleaves reasoning traces with action execution:

#table(
  columns: (1fr, 2.5fr, 2.5fr),
  fill: (x, y) => if y == 0 { rgb("#0F172A") } else if calc.even(y) { rgb("#F8FAFC") } else { white },
  stroke: 0.3pt + rgb(15, 23, 42, 12%),
  inset: (x: 3.5pt, y: 2pt),
  table.header([*Loop Stage*], [*Operational Action*], [*System Execution State*]),
  [Thought], [Model generates internal chain-of-thought planning next step.], [`"Thought: I need to query the SQL database for Q3 revenue."`],
  [Action], [Model emits structured function call with JSON parameters.], [`"Action: execute_sql_query(query='SELECT sum(rev) FROM q3')"`],
  [Observation], [External environment executes tool and returns real output.], [`"Observation: $4,280,000 returned from Postgres cluster."`],
  [Repeat / Finish], [Model reflects on observation and continues or emits final answer.], [`"Thought: Now I calculate year-over-year growth..."`]
)

#v(1.5pt)

== 21.2 The Four Pillars of Production Agentic Architecture

1. *Planning*: Goal decomposition (breaking complex objectives into subtasks) and self-reflection (critiquing past errors).
2. *Memory*: Short-term memory (in-context working window) and Long-term memory (external vector DB holding episodic past experiences).
3. *Tool Calling*: Standardized JSON Schema function calling (REST APIs, Python interpreters, SQL databases, bash shells).
4. *Multi-Agent Orchestration*: Specializing agents into dedicated roles (e.g. Architect, Coder, Verifier) communicating across message buses.

#v(2.5pt)
== 21.4 The Tri-Tier Agent Memory Architecture

Frontier production agents rely on three distinct persistent memory tiers:
1. *Short-Term Working Memory*: The active LLM context window holding current execution scratchpad and tool responses.
2. *Episodic Vector Memory*: ChromaDB / Qdrant storing past task outcomes, user interactions, and successful problem-solving trajectories.
3. *Semantic Knowledge Graph*: Neo4j entity graphs mapping deterministic relationships between organizations, APIs, and credentials.
