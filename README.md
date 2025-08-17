<p align="center">
  <h1 align="center">VoiceLab Sales Trainer</h1>
</p>
<p align="center">AI-powered voice training for sales professionals, built on Azure.</p>
<p align="center">
  <a href="https://github.com/aymenfurter/voicelab-sales-trainer"><img alt="GitHub" src="https://img.shields.io/github/stars/aymenfurter/voicelab-sales-trainer?style=flat-square" /></a>
  <a href="https://github.com/aymenfurter/voicelab-sales-trainer/blob/main/LICENSE"><img alt="License" src="https://img.shields.io/github/license/aymenfurter/voicelab-sales-trainer?style=flat-square" /></a>
  <a href="https://azure.microsoft.com"><img alt="Azure" src="https://img.shields.io/badge/Azure-AI%20Foundry-0078D4?style=flat-square" /></a>
</p>

![VoiceLab Sales Trainer in Action](assets/preview.png)

---

## Overview

VoiceLab Sales Trainer is a demo application showcasing how AI-based training could be used in sales education using Azure AI services. Practice real-world sales scenarios with AI-powered virtual customers, receive instant feedback on your performance, and improve your sales skills through immersive voice conversations.

### Features

- **Real-time Voice Conversations** - Practice sales calls with AI agents that respond naturally using Azure Voice Live API
- **Performance Analysis** - Get detailed feedback on your conversation skills
- **Pronunciation Assessment** - Improve your speaking clarity and confidence with Azure Speech Services
- **Scoring System** - Track your progress with metrics

![Performance Analysis Dashboard](assets/analysis.png)

### Tech Stack

- **Azure AI Foundry** - Agent orchestration and management
- **Azure OpenAI** - GPT-4o for LLM responses and performance analysis 
- **Azure Voice Live API** - Real-time speech-to-speech conversations with AI agents
- **Azure Speech Services** - Post-conversation fluency and pronunciation analysis
- **React + Fluent UI** - Modern, accessible user interface
- **Python Flask** - Backend API and WebSocket handling

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/aymenfurter/voicelab-sales-trainer.git
   cd voicelab-sales-trainer
   ```

2. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your Azure credentials
   ```

3. **Install dependencies**
   ```bash
   # Python dependencies
   pip install -r requirements.txt
   
   # Frontend dependencies
   npm install --legacy-peer-deps
   ```

4. **Build the frontend**
   ```bash
   npm run build
   ```

5. **Start the application**
   ```bash
   python app.py
   ```

Visit `http://localhost:8000` to start training!

## How It Works

1. **Choose a Scenario** - Select from various sales situations (cold calling, objection handling, etc.)
2. **Start the Conversation** - Click the microphone and begin your sales pitch
3. **Engage with AI** - The virtual customer responds realistically based on the scenario
4. **Receive Feedback** - Get instant analysis on your performance including:
   - Speaking tone and style
   - Content quality
   - Needs assessment
   - Value proposition delivery
   - Objection handling skills
  
## 🤝 Contributing

This is a demo application showcasing Azure AI capabilities. Feel free to fork and experiment!

## 📄 License

MIT License - See [LICENSE](LICENSE) file for details
