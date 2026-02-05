```mermaid
sequenceDiagram
    participant User
    participant ARDevice as AR Glasses/Device
    participant RecognitionAI as Contact Recognition AI
    participant PBX as Phone Exchange System
    participant ContactDB as Contact Database

    User->>ARDevice: Point at phone device
    ARDevice->>ARDevice: Capture visual data
    ARDevice->>RecognitionAI: Analyze phone display/caller
    RecognitionAI->>PBX: Query extension/caller ID
    PBX->>ContactDB: Lookup contact details
    ContactDB-->>PBX: Return contact info
    PBX-->>RecognitionAI: Contact data + status
    RecognitionAI-->>ARDevice: Enriched contact information
    ARDevice->>ARDevice: Render AR overlay
    ARDevice->>User: Display contact info panel
    
    Note over User,ContactDB: Shows: Name, Department, Extension,<br/>Availability Status, Location, Last Call
```

## Use Case 1: Contact Recognition & Info Overlay

**Description:** When user looks at a phone or incoming call, AR system identifies the contact and displays comprehensive information overlay.

**Actors:** 
- User (faculty/staff member)
- AR Device (smart glasses or phone with AR)
- Contact Recognition AI
- PBX System
- Contact Database

**Trigger:** User directs gaze/camera toward phone device or receives call

**Flow:**
1. AR device captures visual data of phone display
2. Recognition AI analyzes caller ID or extension number
3. System queries PBX for real-time contact information
4. Database provides full contact profile
5. AR overlay renders contact card with targeting reticle
6. Display shows: name, department, extension, availability, office location, call history
