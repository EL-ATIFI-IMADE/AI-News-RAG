#!/usr/bin/env bash
# setup.sh — One-shot setup for AI News RAG
# Run once: bash setup.sh

set -e

echo "=============================================="
echo "  AI News RAG — Setup Script"
echo "=============================================="

# 1. Python virtual environment
echo ""
echo "[1/4] Creating Python virtual environment…"
python3 -m venv venv
source venv/bin/activate

# 2. Install dependencies
echo ""
echo "[2/4] Installing Python dependencies…"
pip install --upgrade pip -q
pip install -r requirements.txt -q
echo "  ✓ Dependencies installed."

# 3. Pull Ollama models
echo ""
echo "[3/4] Pulling Ollama models (requires Ollama to be running)…"
echo "  Pulling llama3.2 (LLM)…"
ollama pull llama3.2 || echo "  ⚠ Could not pull llama3.2 — is Ollama running?"
echo "  Pulling nomic-embed-text (embeddings)…"
ollama pull nomic-embed-text || echo "  ⚠ Could not pull nomic-embed-text"

# 4. First ingestion
echo ""
echo "[4/4] Running first news ingestion…"
python ingest.py

echo ""
echo "=============================================="
echo "  ✓ Setup complete!"
echo ""
echo "  To start the CLI:"
echo "    source venv/bin/activate && python main.py"
echo ""
echo "  To start the Streamlit UI:"
echo "    source venv/bin/activate && streamlit run app.py"
echo "=============================================="
