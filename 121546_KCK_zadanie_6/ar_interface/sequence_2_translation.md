```mermaid
sequenceDiagram
    participant User
    participant ARDevice as AR Glasses/Device
    participant SpeechAI as Speech Recognition AI
    participant TranslationEngine as Translation Engine
    participant PBX as Phone Exchange System
    participant RemoteCaller as Remote Caller

    RemoteCaller->>PBX: Initiate call
    PBX->>User: Route incoming call
    User->>ARDevice: Accept call (voice/gesture)
    
    loop Real-time Translation
        RemoteCaller->>PBX: Speak (e.g., English)
        PBX->>ARDevice: Audio stream
        ARDevice->>SpeechAI: Process audio
        SpeechAI->>TranslationEngine: Transcribed text
        TranslationEngine-->>ARDevice: Translated text (e.g., Polish)
        ARDevice->>User: Display overlay with translation
        
        Note over ARDevice,User: Shows: Original text,<br/>Translated text,<br/>Confidence level,<br/>Language detected,<br/>Audio waveform
    end
    
    User->>ARDevice: Speak response (Polish)
    ARDevice->>SpeechAI: Process audio
    SpeechAI->>TranslationEngine: Polish text
    TranslationEngine-->>ARDevice: English translation
    ARDevice->>PBX: Translated audio stream
    PBX->>RemoteCaller: Deliver translated speech
```

## Use Case 2: Real-time Translation Overlay

**Description:** During international calls, AR system provides live translation with original and translated text displayed as HUD overlay, plus audio waveform visualization.

**Actors:**
- User (university staff)
- AR Device
- Speech Recognition AI
- Translation Engine
- PBX System
- Remote Caller (international partner/student)

**Trigger:** Incoming call from non-native speaker or international contact

**Flow:**
1. User accepts incoming call through AR interface
2. Audio stream is processed by speech recognition AI
3. Transcribed text is sent to translation engine
4. Translated text appears in real-time overlay
5. System shows confidence level and detected language
6. Waveform visualization helps user track speaking rhythm
7. Bidirectional translation for user's responses
8. Both parties communicate in their native languages
