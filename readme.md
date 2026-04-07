# Enterprise Private AI Hub (Self-Hosted RAG Architecture)

> **A 100% Air-Gapped, Zero-Trust AI solution for businesses that cannot compromise on data privacy.**

## 📌 The Problem
Modern enterprises want to leverage the power of LLMs (like ChatGPT or Claude) for internal document analysis, coding assistance, and automation. However, uploading proprietary code, financial records, or customer data (GDPR/HIPAA) to public APIs is a massive security risk.

## The Solution
This repository contains the deployment architecture for a **Fully Self-Hosted Private AI Hub**. By utilizing this stack, all data processing, vector embeddings, and LLM inference happen strictly within your own infrastructure (On-Premise or Private Cloud). **Your data never leaves your server.**

### Key Features
* **100% Data Sovereignty:** Zero API calls to external providers (No OpenAI/Anthropic dependency).
* **Local RAG (Retrieval-Augmented Generation):** Chat securely with your internal PDFs, Word documents, and logs using the embedded ChromaDB vector database.
* **Role-Based Access Control (RBAC):** Beautiful, ChatGPT-like Web UI with multi-user support and admin controls.
* **Enterprise Security:** Hardened Nginx Reverse Proxy configuration with optimized timeouts for heavy CPU/GPU LLM workloads and WebSocket streaming.
* **Resource Efficient:** Architecture optimized to run on both NVIDIA GPU clusters and ARM CPU instances (e.g., Oracle Ampere).

## The Tech Stack
This architecture orchestrates the following open-source enterprise tools via Docker:
1. **Ollama:** The backend AI engine (Supporting Llama 3.1, Phi-3, Gemma, etc.).
2. **Open WebUI:** The secure frontend and local Vector DB manager.
3. **Nginx Proxy Manager:** The edge gateway handling SSL termination and proxy tuning for AI streaming (Server-Sent Events).

## Deployment

1. Clone this repository to your target server.
2. Execute the included `install.sh` to provision directories and permissions.
3. Run `docker compose up -d`.
4. Apply the custom Nginx tuning parameters found in `nginx-proxy-tuning.md` to prevent 504 Gateway Timeouts during heavy RAG context processing.

---

### Looking for a Deployment Expert?
I am a Senior Infrastructure & SysAdmin specializing in secure, scalable deployments for enterprise environments. 
**Check out my Upwork profile for hire.**
