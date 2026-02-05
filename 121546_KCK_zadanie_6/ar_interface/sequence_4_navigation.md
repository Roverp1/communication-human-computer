```mermaid
sequenceDiagram
    participant User
    participant ARDevice as AR Glasses/Device
    participant LocationService as Location Service
    participant PBX as Phone Exchange System
    participant BuildingMap as Building Map Database
    participant DeptDirectory as Department Directory

    User->>ARDevice: Request department location
    ARDevice->>ARDevice: Activate AR navigation mode
    ARDevice->>LocationService: Get user position
    LocationService-->>ARDevice: Current location data
    
    ARDevice->>DeptDirectory: Query department list
    DeptDirectory-->>ARDevice: All departments with extensions
    
    ARDevice->>PBX: Query department availability
    PBX-->>ARDevice: Status for each department
    
    ARDevice->>BuildingMap: Request spatial coordinates
    BuildingMap-->>ARDevice: Department locations (building, floor, room)
    
    ARDevice->>ARDevice: Calculate distances and directions
    ARDevice->>ARDevice: Render radar display
    ARDevice->>User: Show department radar overlay
    
    Note over User,ARDevice: Radar shows:<br/>- Department positions<br/>- Color-coded availability<br/>- Distance from user<br/>- Building/floor info
    
    User->>ARDevice: Select department (CS Dept)
    ARDevice->>BuildingMap: Request route
    BuildingMap-->>ARDevice: Navigation path
    ARDevice->>User: Display AR navigation arrows
    
    Note over User,ARDevice: Navigation shows:<br/>- Directional arrows<br/>- Distance to destination<br/>- Building and room number<br/>- Turn-by-turn guidance
    
    loop Walking to destination
        LocationService->>ARDevice: Update position
        ARDevice->>User: Update AR arrows
    end
    
    ARDevice->>User: Arrival notification
    User->>ARDevice: Initiate call to department
    ARDevice->>PBX: Connect to extension
```

## Use Case 4: Department Location & Navigation with Radar Display

**Description:** AR radar shows spatial positions of all university departments with availability status. When selected, provides turn-by-turn AR navigation to physical office location.

**Actors:**
- User (visitor, student, or staff)
- AR Device
- Location Service (GPS/indoor positioning)
- PBX System
- Building Map Database
- Department Directory

**Trigger:** User needs to find and contact a department (e.g., Computer Science, Admin, Library)

**Flow:**
1. User activates department finder in AR interface
2. Location service determines user's current position
3. System queries all departments and their availability
4. Building map provides spatial coordinates
5. AR radar overlay displays departments as colored dots:
   - Green: Available
   - Orange: Busy
   - Red: Offline/Closed
6. User selects target department
7. Navigation route is calculated
8. AR arrows and distance overlay guides user
9. Turn-by-turn directions update as user walks
10. Upon arrival, quick-dial option to call department extension
