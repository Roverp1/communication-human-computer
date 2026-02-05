```mermaid
sequenceDiagram
    participant User
    participant ARDevice as AR Glasses/Device
    participant PBX as Phone Exchange System
    participant QueueManager as Queue Manager
    participant Department as Department Extension

    User->>ARDevice: Initiate call to department
    ARDevice->>PBX: Dial department number
    PBX->>QueueManager: Check availability
    
    alt All agents busy
        QueueManager->>QueueManager: Add to queue
        QueueManager-->>PBX: Queue position assigned
        PBX-->>ARDevice: Queue status data
        
        ARDevice->>User: Display queue overlay
        Note over User,ARDevice: Shows: Position in queue,<br/>Estimated wait time,<br/>Department name,<br/>Priority level,<br/>Progress bar
        
        loop While waiting
            QueueManager->>QueueManager: Update queue positions
            QueueManager-->>ARDevice: Send status updates
            ARDevice->>User: Update AR display
            
            alt User wants to leave callback
                User->>ARDevice: Request callback
                ARDevice->>QueueManager: Leave callback number
                QueueManager-->>User: Confirm callback scheduled
            end
        end
        
        QueueManager->>QueueManager: Agent available
        QueueManager->>Department: Route call
        Department-->>User: Call connected
        ARDevice->>User: Remove queue overlay
    else Agent available
        PBX->>Department: Direct connection
        Department-->>User: Call connected immediately
    end
```

## Use Case 3: Call Queue Status & Wait Time Visualization

**Description:** When calling busy department, AR overlay displays real-time queue position, estimated wait time with progress bar, and option to schedule callback.

**Actors:**
- User (caller)
- AR Device
- PBX System
- Queue Manager
- Department Extension

**Trigger:** User dials department extension that is busy/all agents occupied

**Flow:**
1. User initiates call to department (e.g., IT Support)
2. PBX checks agent availability
3. If busy, Queue Manager assigns position
4. AR overlay displays queue information panel
5. Progress bar shows relative wait time
6. System continuously updates position and estimate
7. User can opt for callback instead of waiting
8. When agent available, call is connected
9. Queue overlay automatically dismissed
