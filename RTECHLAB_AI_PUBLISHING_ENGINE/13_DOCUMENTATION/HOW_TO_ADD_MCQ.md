# How to Add Questions to Chapter MCQ Banks

All RTechLab questions must adhere to `06_CONTENT_SCHEMA/mcq-schema.json`.

### Schema Example:
```json
{
  "question_id": "MCQ-NET01-01",
  "chapter_id": "net-01",
  "topic_id": "tcp-handshake",
  "difficulty": "Basic",
  "language": "EN",
  "question": "What is the correct packet sequence during a standard TCP connection establishment?",
  "options": {
    "A": "SYN -> ACK -> SYN-ACK",
    "B": "SYN -> SYN-ACK -> ACK",
    "C": "ACK -> SYN -> RST",
    "D": "FIN -> ACK -> FIN-ACK"
  },
  "correct_answer": "B",
  "explanation": {
    "why_correct": "TCP 3-way handshake begins with client sending SYN, server replying with SYN-ACK, and client completing with ACK.",
    "why_distractors_fail": "Option A reverses server acknowledgment. Option C initiates with ACK. Option D describes graceful connection termination (FIN)."
  },
  "source_reference": "IETF RFC 9293: Transmission Control Protocol (TCP) Specification, Section 3.4",
  "review_status": "Verified"
}
```

### Standards:
- Minimum 25 questions per major chapter: 10 Basic, 10 Intermediate, 5 Advanced.
- Every question MUST include both `why_correct` and `why_distractors_fail`.
- No unverified answers.
