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

## Event-Driven Programming

### Color Changer GUI Application

</div>

<br>

---

## Uruchomienie

```bash
# Metoda 1: Użyj skryptu
./run.sh

# Metoda 2: Bezpośrednio z nix-shell
nix-shell -p python3Packages.tkinter --run "python3 color_changer.py"

# Walidacja kodu
./validate.py
```

---

## Wymagania

| Wymaganie | Status | Implementacja |
|-----------|--------|---------------|
| GUI z zmianą koloru okna | done | ColorChangerApp z dynamicznym tłem |
| Min. 5 kolorów | done | 8 predefiniowanych + nieskończoność przez picker |
| Min. 2 kontrolki | done | 3 typy: buttons, listbox, color picker |
| Programowanie obiektowe | done | 8 klas z dziedziczeniem i enkapsulacją |
| Event loop | done | Tkinter mainloop() |
| Event handlers | done | onClick, onMouseMove, onPaint, onResize |
| Event queue | done | Wewnętrzna kolejka Tkinter |
| Callbacks | done | EventHandler z Observer pattern |

---

## Struktura projektu

```
121546_KCK_zadanie_7/
├── color_changer.py      # Główna aplikacja (423 linii)
├── ZADANIE7.md           # Szczegółowa dokumentacja architektury
├── QUICKSTART.md         # Szybki start
├── ARCHITECTURE.md       # Diagramy architektury
├── validate.py           # Skrypt walidacji kodu
├── run.sh                # Skrypt uruchamiający
├── test.sh               # Test zależności
└── README.md             # Ten plik
```

---

## Architektura event-driven

### Komponenty

1. **Event Loop**: `mainloop()` - pętla zdarzeń Tkinter
2. **Event Queue**: Wewnętrzna kolejka zdarzeń systemowych
3. **Event Handlers**: Handlery dla różnych typów zdarzeń
4. **Callbacks**: System powiadomień Observer pattern
5. **Event Objects**: Enkapsulacja danych zdarzeń

### Typy zdarzeń

- **onClick** - kliknięcia przycisków
- **onMouseMove** - ruch myszy (hover effects)
- **onSelect** - wybór z listy
- **onPaint** - odświeżanie interfejsu
- **onResize** - zmiana rozmiaru okna

---

## Klasy OOP

```python
EventHandler          # Bazowa klasa dla systemu zdarzeń
ColorChangeEvent      # Obiekt zdarzenia
ColorManager          # Zarządzanie stanem + Observer pattern
ColorButton           # Custom button z event handling
ColorListBox          # Custom listbox control
ColorPickerButton     # Button z color picker dialog
StatusBar             # UI feedback component
ColorChangerApp       # Główna aplikacja - orchestrator
```

**Zasady OOP:**
- Dziedziczenie (custom controls od Tkinter widgets)
- Enkapsulacja (prywatne metody, ukryte dane)
- Polimorfizm (jednolity interfejs callbacków)
- Abstrakcja (EventHandler, ColorManager)

---

## Paleta kolorów

8 predefiniowanych kolorów:

1. Light Blue - `#87CEEB`
2. Coral - `#FF7F50`
3. Light Green - `#90EE90`
4. Lavender - `#E6E6FA`
5. Peach - `#FFDAB9`
6. Mint - `#98FF98`
7. Rose - `#FFB6C1`
8. Lemon - `#FFFACD`

Plus: **nieograniczona paleta** przez color picker dialog

---

## Kontrolki

### 1. Color Buttons (8 przycisków)
- onClick handler
- onMouseEnter/Leave (hover effect)
- Auto-contrast text
- Visual feedback (3D relief)

### 2. Color Listbox
- Selection event handling
- Alternative color selection method
- Synchronized with buttons

### 3. Color Picker Button
- Opens system color dialog
- RGB/HSV/Hex input
- Unlimited color options

### 4. Status Bar
- Real-time feedback
- Shows color value
- Displays event source

---

## Przepływ zdarzeń

```
User Click
    ↓
Tkinter Event Queue
    ↓
Event Loop (mainloop)
    ↓
Control Handler (onClick/onSelect)
    ↓
ColorManager.change_color()
    ↓
ColorChangeEvent created
    ↓
Observer callbacks triggered
    ↓
UI updated (background, labels)
    ↓
Tkinter repaint (onPaint)
```

---

## Observer Pattern

```python
# Rejestracja obserwatorów
color_manager.on_color_change.register_callback(handler)

# Powiadomienie wszystkich obserwatorów
color_manager.on_color_change.trigger(event)
```

Loose coupling - kontrolki nie znają aplikacji głównej, komunikują się przez ColorManager.

---

## Features

- **Hover effects** - przyciski reagują na najechanie myszą
- **Auto-contrast** - tekst automatycznie dostosowuje kolor
- **Status feedback** - informacje o każdej zmianie
- **Window resize** - obsługa zmiany rozmiaru okna
- **Event source tracking** - pokazuje źródło zdarzenia
- **Color history** - pamięta poprzednie kolory (gotowe do undo/redo)

---

## Technologie

- **Język**: Python 3
- **Framework**: Tkinter (built-in)
- **Wzorce**: Observer, Command, Template Method
- **Architektura**: Event-driven
- **LOC**: 423 linii kodu
- **Klasy**: 8
- **Metody**: 27

---

## Dokumentacja

Szczegółowa dokumentacja w plikach:

- **ZADANIE7.md** - Pełne wyjaśnienie architektury event-driven
- **ARCHITECTURE.md** - Diagramy i schematy
- **QUICKSTART.md** - Szybki przewodnik
- **color_changer.py** - Komentarze inline w kodzie

---

## Testowanie

Scenariusze testowe:

1. Kliknij wszystkie 8 przycisków kolorów
2. Wybierz kolory z listbox
3. Użyj color picker dla własnego koloru
4. Najedź myszą na przyciski (hover effect)
5. Zmień rozmiar okna
6. Sprawdź status bar po każdej akcji

---

## Design Patterns

**Observer Pattern** - ColorManager powiadamia obserwatorów o zmianach

**Command Pattern** - Akcje użytkownika jako komendy przez callbacks

**Template Method** - EventHandler jako template dla handlerów

**Strategy Pattern** - Różne metody wyboru koloru, ten sam rezultat

---

## Extensibility

Łatwe rozszerzenia dzięki architekturze:

- Nowe kontrolki (tylko callback do ColorManager)
- Undo/Redo (color_history już istnieje)
- Save/Load palet
- Animacje przejść
- Keyboard shortcuts
- Drag & drop
- Gradients

---

## Podsumowanie

Aplikacja pokazuje event-driven programming w praktyce:

- Wszystkie wymagania przekroczone  
- Czysty, skomentowany kod OOP  
- Architektura da się rozszerzać  
- Obsługa wielu typów zdarzeń  
- Interface z feedbackiem  

Event-driven architecture pozwala budować reaktywne aplikacje reagujące na akcje użytkownika zamiast działać w sztywnej sekwencji.
