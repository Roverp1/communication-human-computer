```mermaid
sequenceDiagram
    participant User
    participant ARDevice as AR Glasses/Device
    participant QoSMonitor as Quality of Service Monitor
    participant PBX as Phone Exchange System
    participant Analytics as Analytics Engine
    participant NetworkProbe as Network Probe

    User->>PBX: Active call in progress
    PBX->>ARDevice: Establish call audio stream
    
    activate QoSMonitor
    
    loop During call
        PBX->>QoSMonitor: Stream quality metrics
        NetworkProbe->>QoSMonitor: Network measurements
        
        QoSMonitor->>QoSMonitor: Analyze quality parameters
        Note over QoSMonitor: Measures:<br/>- Latency<br/>- Jitter<br/>- Packet loss<br/>- Bandwidth usage<br/>- Codec performance
        
        QoSMonitor->>Analytics: Send metrics data
        Analytics->>Analytics: Calculate quality score
        Analytics-->>ARDevice: Quality assessment
        
        ARDevice->>ARDevice: Update AR analytics panel
        ARDevice->>User: Display real-time metrics
        
        Note over User,ARDevice: Shows:<br/>- Call duration<br/>- Quality percentage<br/>- Latency<br/>- Packet loss<br/>- Bandwidth<br/>- Codec info<br/>- Audio enhancements<br/>- Security status
        
        alt Quality degraded
            QoSMonitor->>QoSMonitor: Detect quality drop
            QoSMonitor->>ARDevice: Quality alert
            ARDevice->>User: Warning overlay (amber/red)
            
            opt Auto-optimization
                QoSMonitor->>PBX: Adjust codec/bitrate
                PBX->>PBX: Optimize connection
                QoSMonitor->>ARDevice: Recovery status
            end
        end
        
        Analytics->>Analytics: Store call statistics
    end
    
    deactivate QoSMonitor
    
    User->>PBX: End call
    Analytics->>Analytics: Generate call report
    Analytics-->>ARDevice: Final call summary
    ARDevice->>User: Display call analytics summary
    
    Note over User,ARDevice: Summary includes:<br/>- Total duration<br/>- Average quality<br/>- Issues encountered<br/>- Network statistics<br/>- Recommendations
```

## Use Case 5: Call Analytics & Quality Monitoring

**Description:** Real-time overlay displaying comprehensive call quality metrics, network statistics, and audio processing status in aviation HUD style with connection visualization.

**Actors:**
- User (caller)
- AR Device
- Quality of Service Monitor
- PBX System
- Analytics Engine
- Network Probe

**Trigger:** Active call in progress

**Flow:**
1. User is on active call through university PBX
2. QoS Monitor begins collecting quality metrics
3. Network probe measures latency, jitter, packet loss
4. Analytics engine calculates overall quality score
5. AR panel displays real-time metrics:
   - Call duration (00:03:47)
   - Quality percentage (98% - Excellent)
   - Network latency (23ms)
   - Packet loss (0.1%)
   - Bandwidth usage (64 kbps)
   - Active codec (Opus 48kHz)
   - Audio enhancements (noise reduction, echo cancellation)
   - Encryption status (AES-256)
6. Connection line visualizes data flow
7. If quality degrades, warning indicators appear
8. System may auto-adjust codec or suggest actions
9. After call ends, summary report is displayed
10. Historical analytics available for troubleshooting
