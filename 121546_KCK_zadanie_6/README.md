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

# **Zadanie nr 6**

## AR Interface Design - University Telephone Exchange System

</div>

<br>

> ## Opis zadania

Zaprojektowanie interfejsu AR (Augmented Reality) dla uniwersyteckiego systemu centrali telefonicznej z inspiracją systemami HUD używanymi w awionice.

Wymagania:

- Opis 5 funkcji AR dla systemu centrali telefonicznej
- Wizualna makieta: interfejs AR nałożony na fotografię
- Elementy interfejsu narysowane/zaprojektowane (Paint, GIMP, Photoshop lub programowo)
- Inspiracja: systemy HUD w lotnictwie (horyzont, prędkość, celowanie, noktowizja)
- Diagramy sekwencji dla przypadków użycia centrali telefonicznej

<br>

---

## Rozwiązanie

**Plik PDF:** `KCK_Zadanie_6_AR_Interface_121546.pdf`

System AR dla uniwersyteckiej centrali telefonicznej inspirowany awionicznymi wyświetlaczami HUD. Wszystkie elementy graficzne wygenerowane programowo przy użyciu Python + PIL/Pillow.

<br>

---

## 5 Funkcji AR

### 1. Rozpoznawanie kontaktu i nakładka informacyjna

**Inspiracja:** System celowania w awionice - crosshair i panel informacyjny o celu

**Funkcjonalność:**
- Celownik krzyżowy wskazujący urządzenie telefoniczne
- Panel z informacjami: imię, wydział, numer wewnętrzny
- Status dostępności (AVAILABLE/BUSY/OFFLINE)
- Lokalizacja fizyczna (budynek, piętro, pokój)
- Historia ostatnich połączeń

**Zastosowanie:** Natychmiastowa identyfikacja dzwoniącego bez patrzenia na wyświetlacz.

### 2. Tłumaczenie w czasie rzeczywistym

**Inspiracja:** Nocne wyświetlacze HUD z warstwami informacji

**Funkcjonalność:**
- Tekst oryginalny + przetłumaczony w czasie rzeczywistym
- Poziom pewności tłumaczenia (%)
- Wykryty język rozmówcy
- Wizualizacja fali dźwiękowej
- Dwukierunkowe tłumaczenie głosowe

**Zastosowanie:** Komunikacja z zagranicznymi studentami i partnerami bez barier językowych.

### 3. Status kolejki i wizualizacja czasu oczekiwania

**Inspiracja:** Pasek postępu i wskaźniki stanu w kokpicie

**Funkcjonalność:**
- Pozycja w kolejce (np. 3 z 8)
- Szacowany czas oczekiwania (4m 23s)
- Nazwa działu (IT Support, Admin, itp.)
- Priorytet połączenia
- Dynamiczny pasek postępu
- Opcja zamówienia oddzwonienia

**Zastosowanie:** Transparentna informacja o czasie oczekiwania, redukcja frustracji.

### 4. Radar lokalizacji działów i nawigacja

**Inspiracja:** Radar awioniczny z oznaczeniami celów

**Funkcjonalność:**
- Okrągły radar z pierścieniami zasięgu
- Punkty działów z kodowaniem kolorami:
  - Zielony: Dostępny
  - Pomarańczowy: Zajęty
  - Czerwony: Offline/Zamknięty
- Nawigacja AR po wyborze działu
- Strzałki kierunkowe w czasie rzeczywistym
- Dystans do celu

**Zastosowanie:** Nawigacja po kampusie dla odwiedzających i nowych pracowników.

### 5. Analityka połączeń i monitoring jakości

**Inspiracja:** Parametry lotu w HUD - prędkość, wysokość, zużycie paliwa

**Funkcjonalność:**
- Czas trwania połączenia
- Jakość połączenia w % (Excellent/Good/Poor)
- Opóźnienie sieciowe (latency)
- Utrata pakietów
- Wykorzystanie pasma
- Kodek audio (Opus, G.711, itp.)
- Status redukcji szumów i tłumienia echa
- Szyfrowanie (AES-256)
- Wizualizacja połączenia ze strzałkami

**Zastosowanie:** Real-time diagnostyka jakości, automatyczna optymalizacja, dane dla IT.

<br>

---

## Makieta wizualna

**Plik:** `ar_interface/ar_interface_mockup.png`

Rozdzielczość: 1920x1080 (Full HD)

Kompletny interfejs HUD z wszystkimi 5 funkcjami AR wyświetlonymi jednocześnie. Zawiera:

**Elementy wizualne:**
- Celownik krzyżowy z nawiasami kątowymi (crosshair + targeting brackets)
- 5 paneli informacyjnych z semi-przezroczystym tłem
- Radar kołowy z kolorowymi punktami
- Pasek postępu czasu oczekiwania
- Wizualizacja fali dźwiękowej
- Linie połączenia ze strzałkami
- Znaczniki narożne ramki widoku (aviation style)
- Górny i dolny pasek statusu
- Kodowanie kolorami:
  - Zielony (HUD_GREEN): OK, dostępny, połączony
  - Cyan (HUD_CYAN): informacje, identyfikacja
  - Pomarańczowy (HUD_ORANGE): uwaga, zajęty, oczekiwanie
  - Czerwony (HUD_RED): alarm, offline, błąd
  - Żółty (HUD_YELLOW): nawigacja, routing

**Technologia:** Python + PIL/Pillow (generowanie programowe)

<br>

---

## Diagramy sekwencji

Pięć diagramów sekwencji ilustrujących przepływ interakcji dla każdej funkcji AR:

1. **sequence_diagram_1.png** - Contact Recognition & Info Overlay
   - Aktorzy: User, AR Device, Recognition AI, PBX, Contact DB
   - Przepływ: Point → Capture → Analyze → Query → Lookup → Display

2. **sequence_diagram_2.png** - Real-time Translation Overlay
   - Aktorzy: Remote Caller, PBX, AR Device, Speech AI, Translation Engine
   - Przepływ: Speak → Stream → Process → Transcribe → Translate → Display

3. **sequence_diagram_3.png** - Call Queue Status & Wait Time
   - Aktorzy: User, AR Device, PBX, Queue Manager, Department
   - Przepływ: Call → Check → Queue → Assign → Display → Update → Connect

4. **sequence_diagram_4.png** - Department Location & Navigation
   - Aktorzy: User, AR Device, Location Service, PBX, Building Map
   - Przepływ: Request → Position → Query → Coordinates → Radar → Select → Route → Navigate

5. **sequence_diagram_5.png** - Call Analytics & Quality Monitoring
   - Aktorzy: User, PBX, QoS Monitor, Analytics Engine, AR Device
   - Przepływ: Call → Stream → Monitor → Analyze → Calculate → Display → Summary

**Technologia:** Python + PIL/Pillow (generowanie programowe, style UML)

<br>

---

## Struktura projektu

```
121546_KCK_zadanie_6/
├── KCK_Zadanie_6_AR_Interface_121546.pdf    # Kompletny raport PDF
├── ar_interface/                             # Pliki źródłowe
│   ├── generate_ar_mockup.py                # Skrypt generujący makietę AR
│   ├── generate_sequence_diagrams.py        # Skrypt generujący diagramy
│   ├── generate_pdf_report.py               # Skrypt generujący PDF
│   ├── ar_interface_mockup.png              # Makieta AR (1920x1080)
│   ├── sequence_diagram_1.png               # Diagram: Contact Recognition
│   ├── sequence_diagram_2.png               # Diagram: Translation
│   ├── sequence_diagram_3.png               # Diagram: Queue Status
│   ├── sequence_diagram_4.png               # Diagram: Navigation
│   ├── sequence_diagram_5.png               # Diagram: Analytics
│   ├── sequence_1_contact_recognition.md    # Opis przypadku użycia 1
│   ├── sequence_2_translation.md            # Opis przypadku użycia 2
│   ├── sequence_3_queue.md                  # Opis przypadku użycia 3
│   ├── sequence_4_navigation.md             # Opis przypadku użycia 4
│   └── sequence_5_analytics.md              # Opis przypadku użycia 5
└── README.md                                 # Ten plik
```

<br>

---

## Technologie wykorzystane

**Generowanie grafiki:**
- Python 3.13
- PIL/Pillow - rysowanie elementów HUD, nakładek, kształtów
- ImageDraw - linie, okręgi, prostokąty, tekst
- ImageFont - fonty DejaVu Sans Mono (monospace dla HUD)

**Dokumentacja:**
- ReportLab - automatyczne generowanie PDF
- Markdown - opisy przypadków użycia

**Narzędzia:**
- Nix shell - izolowane środowisko z zależnościami
- Git - kontrola wersji

<br>

---

## Architektura systemu AR

**Warstwa 1: Prezentacja**
- AR Device (smart glasses lub smartphone z AR)
- Wyświetlacz HUD z nakładkami
- Interfejs gestów/głosowy

**Warstwa 2: Logika biznesowa**
- Recognition AI (computer vision, OCR)
- Speech Recognition & Translation AI
- QoS Monitor (analiza jakości połączeń)
- Analytics Engine (obliczenia, agregacja)

**Warstwa 3: Integracja**
- PBX API (Asterisk, FreePBX, 3CX)
- Location Services (GPS + Indoor Positioning)
- Queue Manager
- Network Probe

**Warstwa 4: Dane**
- Contact Database (SQL/NoSQL)
- Building Map Database (GIS)
- Call Analytics Storage
- User Preferences

<br>

---

## Przypadki użycia

**Dla pracowników administracji:**
- Szybka identyfikacja dzwoniących
- Efektywne zarządzanie wieloma połączeniami
- Lepszy routing dzięki informacji o dostępności

**Dla kadry naukowej:**
- Komunikacja z zagranicznymi partnerami bez barier
- Szybkie łączenie się ze studentami
- Monitoring jakości dla webinarów i zdalnych wykładów

**Dla odwiedzających:**
- Intuicyjna nawigacja po kampusie
- Natychmiastowy dostęp do informacji o działach
- Redukcja czasu poszukiwania biur

**Dla działu IT:**
- Real-time monitoring jakości VoIP
- Automatyczna diagnostyka problemów
- Dane do optymalizacji infrastruktury

<br>

---

## Inspiracje z awioniki

System AR czerpie z zaawansowanych wyświetlaczy HUD używanych w lotnictwie wojskowym i cywilnym:

1. **F-35 Lightning II HUD:**
   - Celownik krzyżowy z nawiasami kątowymi
   - Kodowanie kolorami (zielony = przyjazny, czerwony = wrogi)
   - Semi-przezroczyste nakładki

2. **Boeing 787 HUD:**
   - Horyzont sztuczny i wskaźniki parametrów lotu
   - Ciągła informacja o statusie systemów
   - Minimalistyczny design dla szybkiego czytania

3. **Radar lotniczy:**
   - Okrągły wyświetlacz z pierścieniami zasięgu
   - Punkty z oznaczeniami kierunku i prędkości
   - Automatyczne śledzenie celów

4. **Night Vision Goggles:**
   - Zielone monochromatyczne wyświetlacze
   - Nałożenie informacji na rzeczywisty obraz
   - Wskaźniki orientacji przestrzennej

<br>

---

## Spójność z heurystykami Nielsena

1. **Widoczność statusu:** Paski statusu, wskaźniki czasu, quality indicators
2. **Dopasowanie do świata:** Polska terminologia, znane ikony, radar jak w życiu
3. **Kontrola użytkownika:** Opcje callback, nawigacja, dostosowywanie wyświetlania
4. **Spójność i standardy:** Kolory HUD, układ paneli, typografia
5. **Zapobieganie błędom:** Automatyczna detekcja języka, sugestie routingu
6. **Rozpoznawanie:** Ikony uniwersalne, kolory semantyczne, crosshair
7. **Elastyczność:** Multi-funkcyjność, adaptacja do kontekstu
8. **Estetyka i minimalizm:** Tylko istotne dane, przezroczyste tła, czytelność
9. **Pomoc przy błędach:** Quality warnings, network alerts, recovery suggestions
10. **Dokumentacja:** Etykiety, tooltips (potencjalnie), status descriptions

<br>

---

## Dostępność

**Kodowanie kolorami z alternatywami:**
- Kolory semantyczne + teksty opisowe
- Ikony + etykiety tekstowe
- Kontrasty spełniające WCAG 2.1 AA

**Wielokanałowość:**
- Wizualne HUD overlays
- Audio feedback (opcjonalnie)
- Wibracje/haptic feedback (na urządzeniach mobilnych)

**Personalizacja:**
- Regulacja przezroczystości paneli
- Wybór rozmiaru czcionki
- Włączanie/wyłączanie poszczególnych warstw AR

<br>

---

## Możliwości rozwoju

**Dodatkowe funkcje AR:**
- Kalendarz i automatyczne planowanie oddzwonień
- Integracja z systemem kontroli dostępu (badge scanning)
- Transkrypcja rozmów z archiwizacją
- Rozpoznawanie twarzy (przy zgodzie użytkowników)
- AR annotations na fizycznych urządzeniach (instrukcje, diagnostyka)

**Machine Learning:**
- Predykcja czasu oczekiwania (uczenie na historii)
- Automatyczne kategoryzowanie połączeń
- Wykrywanie anomalii w jakości sieci
- Personalizowane sugestie routing

**IoT Integration:**
- Status wszystkich telefonów w budynku
- Automatyczne przekierowania na podstawie lokalizacji
- Smart office lighting (wskazywanie zajętości pokojów)

<br>

---

## Podsumowanie

System AR dla uniwersyteckiej centrali łączy awioniczne HUD z potrzebami środowiska akademickiego.

**Zrobione:**
- 5 funkcji AR szczegółowo opisanych  
- Makieta wygenerowana programowo  
- 5 diagramów sekwencji  
- Raport PDF  
- Inspiracja awionicznym HUD (celownik, radar, panele)  
- Kod źródłowy Python (PIL/Pillow)  

**Kluczowe cechy:**
- Interfejs HUD w stylu lotniczym
- Real-time overlays kontekstowe
- Kodowanie kolorami
- Minimalizm i czytelność
- Da się rozszerzyć

System pokazuje potencjał AR w usprawnianiu komunikacji w organizacjach edukacyjnych: redukuje bariery językowe, optymalizuje routing, zapewnia transparentność operacyjną.
