<div align="center">

| Komunikacja Człowiek-Komputer | laboratorium                                     |
| ----------------------------- | ------------------------------------------------ |
| SAN                           |                                                  |
| Autor                         | Yaroslav Zubakha                                 |
| E-mail                        | 121546@student.san.edu.pl / yar.zubaha@proton.me |
| Nr albumu                     | 121546                                           |
| Data                          | 05.02.2026                                       |
| Wersja                        | 1.0                                              |

<br>

# **Zadanie nr 7**

## Event-Driven Programming - Color Changer Application

</div>

<br>

> ## Opis zadania

Stworzenie aplikacji GUI z funkcjonalnością zmiany koloru okna.

Wymagania:
- Minimum 5 kolorów do wyboru
- Minimum 2 typy kontrolek
- Programowanie obiektowe
- Architektura sterowana zdarzeniami: pętla zdarzeń, handlery zdarzeń, kolejka zdarzeń, callbacki

<br>

---

## Uruchomienie aplikacji

```bash
# Wejdź do katalogu zadania
cd 121546_KCK_zadanie_7

# Uruchom z nix-shell (rekomendowane)
nix-shell -p python3Packages.tkinter --run "python3 color_changer.py"

# Lub bezpośrednio (jeśli Tkinter zainstalowany)
python3 color_changer.py
```

<br>

---

## Wybór technologii

**Python 3 + Tkinter**

Tkinter wybrano z kilku powodów:
- Wbudowany w Python, łatwa konfiguracja
- Natywna obsługa event loop i event queue
- Świetnie demonstruje event-driven architecture
- Prosty ale potężny system bindowania zdarzeń
- Cross-platform

<br>

---

## Architektura sterowana zdarzeniami

### 1. Event Loop (Pętla zdarzeń)

```python
def run(self):
    self.root.mainloop()  # Tkinter event loop
```

`mainloop()` to serce event-driven architecture:
- Działa w nieskończonej pętli do zamknięcia okna
- Czeka na zdarzenia z systemu operacyjnego
- Przetwarza zdarzenia z kolejki
- Wywołuje odpowiednie handlery
- Odświeża interfejs (repaint)

### 2. Event Queue (Kolejka zdarzeń)

Tkinter zarządza kolejką zdarzeń wewnętrznie:
- Zdarzenia systemowe (kliknięcia myszy, ruch, klawiatura)
- Zdarzenia UI (focus, resize, expose)
- Custom events (color change events)

Zdarzenia procesowane są w kolejności FIFO (First In, First Out).

### 3. Event Handlers (Handlery zdarzeń)

Aplikacja implementuje kluczowe typy handlerów:

**onClick (kliknięcie)**
```python
def _handle_click(self):
    if self._on_click:
        self._on_click(self.color, f"button:{self.color_name}")
```

**onMouseMove (ruch myszy)**
```python
def _on_mouse_enter(self, event):
    self.config(relief=tk.SUNKEN, bd=4)

def _on_mouse_leave(self, event):
    self.config(relief=tk.RAISED, bd=3)
```

**onPaint (odświeżanie widoku)**
```python
def _on_color_changed(self, event: ColorChangeEvent):
    self.content_frame.config(bg=event.color)  # repaint
```

**onResize (zmiana rozmiaru)**
```python
def _on_window_resize(self, event):
    if event.widget == self.root:
        self.status_bar.update_status(f"Window resized to {event.width}x{event.height}")
```

### 4. Callbacks i Observer Pattern

Implementacja wzorca Observer dla komunikacji między komponentami:

```python
class EventHandler:
    def register_callback(self, callback: Callable):
        self._callbacks.append(callback)
    
    def trigger(self, *args, **kwargs):
        for callback in self._callbacks:
            callback(*args, **kwargs)
```

ColorManager używa tego wzorca:
```python
self.color_manager.on_color_change.register_callback(self._on_color_changed)
```

Gdy kolor się zmienia, wszystkie zarejestrowane callbacki są wywoływane:
```python
def change_color(self, color: str, source: str = "unknown"):
    event = ColorChangeEvent(color, source)
    self.on_color_change.trigger(event)  # powiadamia obserwatorów
```

### 5. Event Objects (Obiekty zdarzeń)

Zdarzenia enkapsulowane są w obiektach:

```python
class ColorChangeEvent:
    def __init__(self, color: str, source: str):
        self.color = color
        self.source = source  # skąd pochodzi zdarzenie
```

To pozwala przenosić kontekst zdarzenia między komponentami.

<br>

---

## Struktura obiektowa (OOP)

### Hierarchia klas

```
EventHandler (bazowa klasa dla handlerów)
    ↓
ColorManager (zarządza stanem i zdarzeniami)

ColorChangeEvent (enkapsulacja danych zdarzenia)

tk.Button → ColorButton (custom button z event handling)
tk.Listbox → ColorListBox (custom listbox)
tk.Button → ColorPickerButton (button z dialog)
tk.Frame → StatusBar (status bar z feedback)

ColorChangerApp (główna aplikacja, orchestrator)
```

### Zasady OOP

**Enkapsulacja**
- Dane i metody zgrupowane w klasach
- Prywatne metody z `_` prefix
- Gettery/settery gdzie potrzebne

**Dziedziczenie**
- Custom kontrolki dziedziczą z Tkinter widgets
- Rozszerzają funkcjonalność bazowych klas

**Polimorfizm**
- Wszystkie kontrolki używają tego samego interfejsu callback
- `on_click` / `on_select` / `on_color_selected` → `color_manager.change_color`

**Abstrakcja**
- `EventHandler` abstrahuje mechanizm callbacków
- `ColorManager` ukrywa szczegóły zarządzania stanem

<br>

---

## Kontrolki (spełnienie wymagań)

### Typ 1: Color Buttons (8 przycisków)

**Klasa:** `ColorButton`

Przyciski z predefiniowanymi kolorami:
- Light Blue (#87CEEB)
- Coral (#FF7F50)
- Light Green (#90EE90)
- Lavender (#E6E6FA)
- Peach (#FFDAB9)
- Mint (#98FF98)
- Rose (#FFB6C1)
- Lemon (#FFFACD)

Features:
- onClick handler zmienia kolor
- onMouseEnter/Leave dla hover effect
- Automatyczne dopasowanie koloru tekstu (kontrast)
- Visual feedback (3D relief effect)

### Typ 2: Color Listbox

**Klasa:** `ColorListBox`

Listbox z tymi samymi kolorami co przyciski.

Features:
- Selection event handler
- Single selection mode
- Alternatywna metoda wyboru koloru

### Typ 3: Color Picker Button

**Klasa:** `ColorPickerButton`

Przycisk otwierający natywny color picker dialog.

Features:
- Nieograniczona paleta kolorów
- Integracja z system dialog
- RGB/HSV/Hex selection

### Dodatkowe elementy UI

**StatusBar**
- Pokazuje aktualny status
- Feedback po każdej akcji
- Info o źródle zdarzenia

**Info Label**
- Wyświetla hex value koloru
- Dynamicznie dostosowuje kolor tekstu

<br>

---

## Przepływ zdarzeń

```
User Action (klik/select)
    ↓
Control Event Handler (onClick/onSelect)
    ↓
ColorManager.change_color()
    ↓
Create ColorChangeEvent
    ↓
Trigger callbacks (Observer pattern)
    ↓
ColorChangerApp._on_color_changed()
    ↓
Update UI (background, label, status)
    ↓
Tkinter repaints (onPaint)
```

### Przykład: Klik na przycisk

1. User klika przycisk "Coral"
2. Tkinter detektuje zdarzenie myszy
3. Event queue przekazuje zdarzenie do przycisku
4. `ColorButton._handle_click()` wywoływany
5. `color_manager.change_color("#FF7F50", "button:Coral")`
6. `ColorManager` tworzy `ColorChangeEvent`
7. Wszystkie callbacki powiadamiane
8. `_on_color_changed()` aktualizuje UI
9. Tkinter repaint odświeża widok

<br>

---

## Kluczowe cechy event-driven architecture

### 1. Asynchroniczność

Aplikacja reaguje na zdarzenia gdy występują, nie w określonym porządku.

### 2. Loose Coupling

Kontrolki nie wiedzą o `ColorChangerApp`. Komunikują się przez `ColorManager` i callbacks.

### 3. Separation of Concerns

- `ColorManager`: logika biznesowa
- Custom Controls: UI i lokalne event handling
- `ColorChangerApp`: orchestration i high-level events

### 4. Extensibility

Łatwo dodać nowe kontrolki:
```python
new_control = CustomColorControl(
    parent,
    on_color_selected=self.color_manager.change_color
)
```

### 5. Event Propagation

Zdarzenia propagują się przez system:
- System → Tkinter → Widget → Handler → ColorManager → Observers

<br>

---

## Event Binding w Tkinter

Aplikacja używa różnych metod bindowania:

### Command callback
```python
tk.Button(command=self._handle_click)
```

### Event binding
```python
self.bind("<Enter>", self._on_mouse_enter)
self.bind("<Leave>", self._on_mouse_leave)
self.root.bind("<Configure>", self._on_window_resize)
```

### Virtual events
```python
self.bind("<<ListboxSelect>>", self._handle_selection)
```

<br>

---

## Demonstrowane koncepty

✓ Event Loop (mainloop)  
✓ Event Queue (Tkinter internal)  
✓ Event Handlers (onClick, onMouseMove, onPaint, onResize)  
✓ Callbacks (funkcje jako argumenty)  
✓ Observer Pattern (register/trigger)  
✓ Event Objects (ColorChangeEvent)  
✓ Minimum 5 kolorów (8 predefiniowanych + nieskończoność przez picker)  
✓ Minimum 2 kontrolki (3: buttons, listbox, picker)  
✓ OOP (dziedziczenie, enkapsulacja, polimorfizm)  
✓ Zmiana koloru okna  

<br>

---

## Testowanie

Przetestuj następujące scenariusze:

1. **Button clicks**: Kliknij każdy z 8 przycisków kolorów
2. **Listbox selection**: Wybierz kolory z listbox
3. **Color picker**: Użyj custom color picker do wyboru dowolnego koloru
4. **Mouse hover**: Najedź na przyciski aby zobaczyć hover effect
5. **Window resize**: Zmień rozmiar okna i obserwuj event handling
6. **Status updates**: Sprawdź czy status bar pokazuje źródło zmiany

<br>

---

## Potencjalne rozszerzenia

Architektura pozwala na łatwe rozszerzenia:

- Historia kolorów (undo/redo) - już częściowo zaimplementowane
- Zapisywanie/wczytywanie palet
- Gradients i animacje
- Keyboard shortcuts (event binding)
- Drag & drop kolorów
- Real-time color mixing
- Theme persistence

<br>

---

## Podsumowanie

Aplikacja demonstruje pełną event-driven architecture:
- Wszystkie wymagania spełnione
- Czysty, dobrze skomentowany kod
- Proper OOP design
- Extensible architecture
- Multiple event types handled
- Professional GUI with feedback

Event-driven programming pozwala na reaktywne, user-friendly aplikacje gdzie system reaguje na akcje użytkownika zamiast działać w rigid sequence.
