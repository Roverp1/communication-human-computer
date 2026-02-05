# Event-Driven Architecture Diagram

## Class Hierarchy

```
┌─────────────────────────────────────────────────────────────┐
│                     ColorChangerApp                         │
│  (Main orchestrator, coordinates all components)            │
│                                                             │
│  - Initializes UI components                                │
│  - Registers event callbacks                                │
│  - Runs event loop (mainloop)                               │
└───────────┬─────────────────────────────────────────────────┘
            │
            ├─────────────────┬─────────────────┬──────────────┐
            │                 │                 │              │
            ▼                 ▼                 ▼              ▼
    ┌───────────┐     ┌──────────┐     ┌──────────┐   ┌──────────┐
    │ ColorBtn  │     │ColorList │     │ColorPick │   │StatusBar │
    │           │     │Box       │     │Button    │   │          │
    │ onClick   │     │onSelect  │     │ onClick  │   │ update() │
    └─────┬─────┘     └────┬─────┘     └────┬─────┘   └──────────┘
          │                │                 │
          └────────────────┴─────────────────┘
                           │
                           ▼
                  ┌────────────────┐
                  │ ColorManager   │
                  │                │
                  │ Observer       │
                  │ Pattern        │
                  └────────┬───────┘
                           │
              ┌────────────┴────────────┐
              │                         │
              ▼                         ▼
       ┌──────────────┐         ┌─────────────┐
       │EventHandler  │         │ColorChange  │
       │              │         │Event        │
       │ callbacks[]  │         │             │
       │ trigger()    │         │ color       │
       └──────────────┘         │ source      │
                                └─────────────┘
```

## Event Flow Diagram

```
1. User Action
   ┌──────────────────────────────────────────────┐
   │ Click button / Select from list / Use picker │
   └────────────────┬─────────────────────────────┘
                    │
2. System Event     ▼
   ┌──────────────────────────────┐
   │  Tkinter Event Queue         │
   │  (mouse click, selection)    │
   └────────────┬─────────────────┘
                │
3. Event Loop   ▼
   ┌──────────────────────────────┐
   │  mainloop() processes event  │
   └────────────┬─────────────────┘
                │
4. Handler      ▼
   ┌─────────────────────────────────┐
   │  Control's event handler called │
   │  (_handle_click, etc.)          │
   └────────────┬────────────────────┘
                │
5. Manager      ▼
   ┌─────────────────────────────────┐
   │  ColorManager.change_color()    │
   │  Creates ColorChangeEvent       │
   └────────────┬────────────────────┘
                │
6. Observer     ▼
   ┌─────────────────────────────────┐
   │  EventHandler.trigger()         │
   │  Notifies all registered        │
   │  callbacks                      │
   └────────────┬────────────────────┘
                │
7. Callback     ▼
   ┌─────────────────────────────────┐
   │  _on_color_changed()            │
   │  Updates UI components          │
   └────────────┬────────────────────┘
                │
8. Repaint      ▼
   ┌──────────────────────────────────┐
   │  Tkinter repaints window         │
   │  User sees color change          │
   └──────────────────────────────────┘
```

## Event Types

```
┌─────────────────────────────────────────────────────┐
│                    Event Types                      │
├─────────────────────────────────────────────────────┤
│                                                     │
│  onClick        → Button presses                    │
│                   ColorButton._handle_click()       │
│                                                     │
│  onMouseMove    → Mouse enter/leave                 │
│                   _on_mouse_enter()                 │
│                   _on_mouse_leave()                 │
│                                                     │
│  onSelect       → Listbox selection                 │
│                   ColorListBox._handle_selection()  │
│                                                     │
│  onPaint        → Window repaint                    │
│                   _on_color_changed()               │
│                   (updates background)              │
│                                                     │
│  onResize       → Window size change                │
│                   _on_window_resize()               │
│                                                     │
└─────────────────────────────────────────────────────┘
```

## Observer Pattern Implementation

```
Registration Phase:
┌──────────────────┐         ┌──────────────────┐
│ ColorChangerApp  │────────▶│  ColorManager    │
│                  │ register│                  │
│ _on_color_changed│ callback│ on_color_change  │
└──────────────────┘         │ (EventHandler)   │
                             └──────────────────┘

Notification Phase:
┌──────────────────┐         ┌──────────────────┐
│  ColorManager    │         │  EventHandler    │
│  change_color()  │────────▶│  trigger()       │
└──────────────────┘ notify  └────────┬─────────┘
                                      │
                             ┌────────┴─────────┐
                             │                  │
                             ▼                  ▼
                    ┌────────────────┐  ┌──────────────┐
                    │ Callback #1    │  │ Callback #2  │
                    │ (color change) │  │ (logging)    │
                    └────────────────┘  └──────────────┘
```

## Loose Coupling

```
Controls don't know about App:

ColorButton ──────▶ ColorManager ◀────── ColorChangerApp
                        ▲
ColorListBox ──────────┘│
                        │
ColorPickerButton ──────┘

All controls only know:
- ColorManager.change_color() interface
- No direct dependencies on each other
- Easy to add new controls
```

## Key Design Patterns

1. **Observer Pattern**
   - ColorManager is subject
   - App components are observers
   - Decouples color logic from UI

2. **Command Pattern**
   - User actions encapsulated as commands
   - Executed through callback system

3. **Template Method**
   - EventHandler provides template for events
   - Subclasses override specific behavior

4. **Strategy Pattern**
   - Multiple ways to select color
   - Same outcome, different strategies

## Extension Points

```
Easy to add:
├── New color controls
│   └── Just call color_manager.change_color()
├── New event types
│   └── Register with EventHandler
├── Undo/Redo
│   └── Use color_history in ColorManager
├── Persistence
│   └── Save/load from ColorManager state
└── Animations
    └── Add in _on_color_changed()
```
