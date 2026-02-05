#!/usr/bin/env python3
"""
Event-Driven Color Changer Application
KCK Zadanie 7 - Event-Driven Programming

This application demonstrates event-driven programming with proper OOP design.
Window background color changes based on user interaction through multiple controls.
"""

import tkinter as tk
from tkinter import colorchooser
from typing import Callable, Optional


class EventHandler:
    """
    Base class for event handlers.
    Implements the Observer pattern for event-driven architecture.
    """
    
    def __init__(self):
        self._callbacks = []
    
    def register_callback(self, callback: Callable):
        """Register a callback to be called when event occurs"""
        if callback not in self._callbacks:
            self._callbacks.append(callback)
    
    def unregister_callback(self, callback: Callable):
        """Remove a callback from the event handler"""
        if callback in self._callbacks:
            self._callbacks.remove(callback)
    
    def trigger(self, *args, **kwargs):
        """Trigger all registered callbacks"""
        for callback in self._callbacks:
            callback(*args, **kwargs)


class ColorChangeEvent:
    """
    Represents a color change event.
    Encapsulates event data following event-driven design patterns.
    """
    
    def __init__(self, color: str, source: str):
        self.color = color
        self.source = source  # which control triggered the event
        self.timestamp = None  # could add timestamp if needed


class ColorManager:
    """
    Manages color state and notifies observers of changes.
    Central component of the event-driven architecture.
    """
    
    def __init__(self):
        self.current_color = "#ffffff"
        self.color_history = []
        self.on_color_change = EventHandler()
    
    def change_color(self, color: str, source: str = "unknown"):
        """Change the current color and trigger event"""
        if color and color != self.current_color:
            self.current_color = color
            self.color_history.append(color)
            
            # Create event object and trigger callbacks
            event = ColorChangeEvent(color, source)
            self.on_color_change.trigger(event)


class ColorButton(tk.Button):
    """
    Custom button control for color selection.
    Demonstrates custom control creation with event handling.
    """
    
    def __init__(self, parent, color: str, color_name: str, 
                 on_click: Optional[Callable] = None):
        self.color = color
        self.color_name = color_name
        
        super().__init__(
            parent,
            text=color_name,
            bg=color,
            fg=self._get_contrast_color(color),
            width=15,
            height=2,
            relief=tk.RAISED,
            bd=3,
            command=self._handle_click
        )
        
        self._on_click = on_click
        
        # Bind mouse events for visual feedback
        self.bind("<Enter>", self._on_mouse_enter)
        self.bind("<Leave>", self._on_mouse_leave)
    
    def _handle_click(self):
        """onClick event handler"""
        if self._on_click:
            self._on_click(self.color, f"button:{self.color_name}")
    
    def _on_mouse_enter(self, event):
        """onMouseEnter event handler - visual feedback"""
        self.config(relief=tk.SUNKEN, bd=4)
    
    def _on_mouse_leave(self, event):
        """onMouseLeave event handler - restore appearance"""
        self.config(relief=tk.RAISED, bd=3)
    
    @staticmethod
    def _get_contrast_color(bg_color: str) -> str:
        """Calculate contrasting text color for readability"""
        # Remove # and convert to RGB
        color = bg_color.lstrip('#')
        r, g, b = int(color[0:2], 16), int(color[2:4], 16), int(color[4:6], 16)
        
        # Calculate luminance
        luminance = (0.299 * r + 0.587 * g + 0.114 * b) / 255
        
        return "#000000" if luminance > 0.5 else "#ffffff"


class ColorListBox(tk.Listbox):
    """
    Custom listbox control for color selection.
    Second type of control as per requirements.
    """
    
    def __init__(self, parent, colors: list, on_select: Optional[Callable] = None):
        self.colors = colors
        self._on_select = on_select
        
        super().__init__(
            parent,
            height=len(colors),
            width=20,
            font=("Arial", 11),
            selectmode=tk.SINGLE,
            bd=2,
            relief=tk.SUNKEN
        )
        
        # Populate listbox
        for name, _ in colors:
            self.insert(tk.END, name)
        
        # Bind selection event
        self.bind("<<ListboxSelect>>", self._handle_selection)
    
    def _handle_selection(self, event):
        """Handle listbox selection event"""
        selection = self.curselection()
        if selection and self._on_select:
            index = selection[0]
            color_name, color_value = self.colors[index]
            self._on_select(color_value, f"listbox:{color_name}")


class ColorPickerButton(tk.Button):
    """
    Button that opens a color picker dialog.
    Third type of control for additional flexibility.
    """
    
    def __init__(self, parent, on_color_selected: Optional[Callable] = None):
        self._on_color_selected = on_color_selected
        
        super().__init__(
            parent,
            text="🎨 Custom Color Picker",
            font=("Arial", 12, "bold"),
            bg="#4CAF50",
            fg="white",
            width=20,
            height=2,
            command=self._open_color_picker
        )
    
    def _open_color_picker(self):
        """Open color picker dialog"""
        color = colorchooser.askcolor(title="Choose a color")
        if color[1] and self._on_color_selected:  # color[1] is hex value
            self._on_color_selected(color[1], "colorpicker")


class StatusBar(tk.Frame):
    """
    Status bar showing current color information.
    Demonstrates UI feedback in event-driven system.
    """
    
    def __init__(self, parent):
        super().__init__(parent, bg="#e0e0e0", height=30)
        
        self.label = tk.Label(
            self,
            text="Ready",
            bg="#e0e0e0",
            fg="#333333",
            font=("Arial", 10),
            anchor=tk.W,
            padx=10
        )
        self.label.pack(fill=tk.BOTH, expand=True)
    
    def update_status(self, message: str):
        """Update status bar text"""
        self.label.config(text=message)


class ColorChangerApp:
    """
    Main application class implementing event-driven architecture.
    
    Event-Driven Architecture Components:
    1. Event Loop: Tkinter's mainloop() handles the event queue
    2. Event Handlers: onClick, onMouseMove, onPaint callbacks
    3. Event Queue: Tkinter manages event dispatching
    4. Observer Pattern: ColorManager notifies observers of state changes
    """
    
    # Predefined color palette (more than 5 as required)
    COLORS = [
        ("Light Blue", "#87CEEB"),
        ("Coral", "#FF7F50"),
        ("Light Green", "#90EE90"),
        ("Lavender", "#E6E6FA"),
        ("Peach", "#FFDAB9"),
        ("Mint", "#98FF98"),
        ("Rose", "#FFB6C1"),
        ("Lemon", "#FFFACD"),
    ]
    
    def __init__(self, root: tk.Tk):
        self.root = root
        self.root.title("Color Changer - Event-Driven Programming")
        self.root.geometry("700x650")
        self.root.resizable(True, True)
        
        # Initialize color manager (core of event system)
        self.color_manager = ColorManager()
        self.color_manager.on_color_change.register_callback(self._on_color_changed)
        
        # Build UI
        self._create_ui()
        
        # Set initial color
        self.color_manager.change_color("#ffffff", "initialization")
        
        # Bind window events
        self.root.bind("<Configure>", self._on_window_resize)
    
    def _create_ui(self):
        """Create the user interface"""
        # Title
        title_frame = tk.Frame(self.root, bg="#2c3e50", height=60)
        title_frame.pack(fill=tk.X, pady=(0, 10))
        title_frame.pack_propagate(False)
        
        title_label = tk.Label(
            title_frame,
            text="Event-Driven Color Changer",
            font=("Arial", 18, "bold"),
            bg="#2c3e50",
            fg="white"
        )
        title_label.pack(expand=True)
        
        # Main content area (this will change color)
        self.content_frame = tk.Frame(self.root, bg="#ffffff")
        self.content_frame.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)
        
        # Control 1: Color Buttons
        self._create_button_controls()
        
        # Control 2: Color Listbox
        self._create_listbox_control()
        
        # Control 3: Color Picker Button
        self._create_picker_control()
        
        # Info label
        info_frame = tk.Frame(self.content_frame, bg="white", bd=2, relief=tk.GROOVE)
        info_frame.pack(pady=15, padx=20, fill=tk.X)
        
        self.info_label = tk.Label(
            info_frame,
            text="Current Color: #ffffff",
            font=("Arial", 14, "bold"),
            bg="white",
            fg="#333333",
            pady=10
        )
        self.info_label.pack()
        
        # Status bar
        self.status_bar = StatusBar(self.root)
        self.status_bar.pack(side=tk.BOTTOM, fill=tk.X)
    
    def _create_button_controls(self):
        """Create color button controls"""
        button_frame = tk.Frame(self.content_frame, bg="white")
        button_frame.pack(pady=10)
        
        label = tk.Label(
            button_frame,
            text="Click a color button:",
            font=("Arial", 12, "bold"),
            bg="white"
        )
        label.pack(pady=(0, 10))
        
        # Create grid of buttons
        btn_container = tk.Frame(button_frame, bg="white")
        btn_container.pack()
        
        for i, (name, color) in enumerate(self.COLORS):
            row = i // 2
            col = i % 2
            
            btn = ColorButton(
                btn_container,
                color,
                name,
                on_click=self.color_manager.change_color
            )
            btn.grid(row=row, column=col, padx=5, pady=5)
    
    def _create_listbox_control(self):
        """Create listbox control"""
        listbox_frame = tk.Frame(self.content_frame, bg="white")
        listbox_frame.pack(pady=10)
        
        label = tk.Label(
            listbox_frame,
            text="Or select from list:",
            font=("Arial", 12, "bold"),
            bg="white"
        )
        label.pack(pady=(0, 5))
        
        listbox = ColorListBox(
            listbox_frame,
            self.COLORS,
            on_select=self.color_manager.change_color
        )
        listbox.pack()
    
    def _create_picker_control(self):
        """Create color picker button"""
        picker_frame = tk.Frame(self.content_frame, bg="white")
        picker_frame.pack(pady=15)
        
        label = tk.Label(
            picker_frame,
            text="Or choose any color:",
            font=("Arial", 12, "bold"),
            bg="white"
        )
        label.pack(pady=(0, 5))
        
        picker_btn = ColorPickerButton(
            picker_frame,
            on_color_selected=self.color_manager.change_color
        )
        picker_btn.pack()
    
    def _on_color_changed(self, event: ColorChangeEvent):
        """
        Event handler called when color changes.
        This is the core of the event-driven architecture.
        """
        # Update background color (onPaint equivalent)
        self.content_frame.config(bg=event.color)
        
        # Update info label
        self.info_label.config(
            text=f"Current Color: {event.color}",
            fg=ColorButton._get_contrast_color(event.color)
        )
        
        # Update status bar
        self.status_bar.update_status(
            f"Color changed to {event.color} via {event.source}"
        )
    
    def _on_window_resize(self, event):
        """
        Handle window resize events.
        Demonstrates additional event handling.
        """
        if event.widget == self.root:
            self.status_bar.update_status(
                f"Window resized to {event.width}x{event.height}"
            )
    
    def run(self):
        """
        Start the event loop.
        Tkinter's mainloop() is the event dispatcher that:
        - Processes events from the event queue
        - Dispatches events to appropriate handlers
        - Updates the UI (onPaint)
        - Handles user input (onClick, onMouseMove, etc.)
        """
        self.root.mainloop()


def main():
    """Application entry point"""
    root = tk.Tk()
    app = ColorChangerApp(root)
    app.run()


if __name__ == "__main__":
    main()
