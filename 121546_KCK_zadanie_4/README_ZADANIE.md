# Zadanie 4 - UX Design dla Procesu Zakupowego E-commerce

## Autor
- **Imię i nazwisko:** Yaroslav Zubakha
- **Nr albumu:** 121546
- **Email:** 121546@student.san.edu.pl / yar.zubaha@proton.me
- **Przedmiot:** Komunikacja Człowiek-Komputer
- **Uczelnia:** SAN - Społeczna Akademia Nauk

## Opis zadania

Zaprojektowanie procesu zakupowego w sklepie e-commerce z wykorzystaniem zasad UX design:
- Minimum 4 etapy procesu zakupowego
- Obliczenia czasu decyzji według Prawa Hicka
- Zastosowanie zasad: Miller's Law, Fitts's Law, Doherty Threshold, Von Restorff Effect, Law of Uniform Connection
- Zgodność z zasadami Jakoba (Jakob's Law)

## Struktura projektu

### Pliki HTML (Interaktywne mockupy)
1. **stage1_product_selection.html** - Etap wyboru produktu (6 laptopów)
2. **stage2_payment.html** - Etap wyboru metody płatności (5 opcji)
3. **stage3_delivery.html** - Etap wyboru metody dostawy (4 opcje)
4. **stage4_summary.html** - Etap podsumowania zamówienia
5. **stage5_confirmation.html** - Etap finalizacji (potwierdzenie)

### Pliki Python
1. **hicks_law_analysis.py** - Skrypt do obliczeń Prawa Hicka
2. **generate_pdf.py** - Generator dokumentacji HTML

### Dokumentacja
1. **121546_KCK_zadanie_4_YZubakha.pdf** - Główny dokument PDF z pełną dokumentacją
2. **documentation.html** - Źródłowy plik HTML dokumentacji
3. **hicks_law_output.txt** - Wyniki obliczeń Prawa Hicka
4. **README.md** - Ten plik

## Jak uruchomić interaktywne mockupy

### Opcja 1: Bezpośrednio w przeglądarce
```bash
# Otwórz dowolny plik HTML w przeglądarce
firefox stage1_product_selection.html
# lub
chromium stage1_product_selection.html
```

### Opcja 2: Lokalny serwer HTTP
```bash
# Python 3
python3 -m http.server 8000
# Następnie otwórz: http://localhost:8000/stage1_product_selection.html

# Lub z nix-shell
nix-shell -p python3 --run "python3 -m http.server 8000"
```

### Opcja 3: Przeglądanie sekwencyjne
Otwórz `stage1_product_selection.html` i klikaj przycisk "Przejdź dalej" aby przejść przez wszystkie etapy:
1. Wybierz produkt → Kliknij "Przejdź do płatności"
2. Wybierz płatność → Kliknij "Przejdź do dostawy"
3. Wybierz dostawę → Kliknij "Przejdź do podsumowania"
4. Zaakceptuj regulamin → Kliknij "Złóż zamówienie"
5. Zobacz potwierdzenie

## Obliczenia Prawa Hicka

### Formuła
```
T = a + b × log₂(n + 1)
gdzie:
  T = czas decyzji (sekundy)
  a = czas bazowy (5 sekund)
  b = współczynnik (1 sekunda)
  n = liczba opcji
```

### Wyniki dla projektu
- **Wybór produktu (n=6):** T = 5 + 1×log₂(7) ≈ **7.81 sekund**
- **Wybór płatności (n=5):** T = 5 + 1×log₂(6) ≈ **7.58 sekund**
- **Wybór dostawy (n=4):** T = 5 + 1×log₂(5) ≈ **7.32 sekund**
- **Weryfikacja podsumowania:** **10.00 sekund** (estymacja)
- **CAŁKOWITY CZAS:** **32.71 sekund** (~0.5 minuty)

### Uruchomienie skryptu obliczeń
```bash
nix-shell -p python3 --run "python3 hicks_law_analysis.py"
```

## Zastosowane zasady UX

### 1. Prawo Hicka (Hick's Law)
✓ Ograniczona liczba opcji na każdym etapie (4-6)
✓ Filtry zmniejszają widoczne opcje
✓ Paginacja dla dużych katalogów

### 2. Prawo Millera (Miller's Law - 7±2)
✓ Produkty: 6 widocznych jednocześnie
✓ Płatności: 5 metod
✓ Dostawa: 4 opcje
✓ Menu: 5 kroków

### 3. Prawo Fittsa (Fitts's Law)
✓ Duże przyciski głównych akcji (padding 16-20px)
✓ Odpowiednie odstępy między elementami (15-25px)
✓ Minimalna wielkość touch target: 40×40px
✓ Najważniejsze elementy większe i bliżej użytkownika

### 4. Próg Doherty'ego (Doherty Threshold - <400ms)
✓ Natychmiastowa reakcja na kliknięcia (< 100ms)
✓ Animacje trwają 200-300ms
✓ Instant visual feedback przy wszystkich akcjach

### 5. Efekt Von Restorffa (Von Restorff Effect)
✓ Bestseller wyróżniony żółtym gradientem + badge "BESTSELLER"
✓ Polecana metoda płatności z badge'em "POLECANE"
✓ Najszybsza dostawa z czerwonym badge'em "NAJSZYBSZA"
✓ Darmowa dostawa w zielonym kolorze "GRATIS"

### 6. Prawo Jednolitego Połączenia (Law of Uniform Connection)
✓ Powiązane elementy zgrupowane wizualnie
✓ Filtry w jednym kontenerze
✓ Spójne kolory dla podobnych akcji
✓ Sekcje wyraźnie oddzielone

### 7. Zasady Jakoba (Jakob's Law)
✓ Standardowy przepływ e-commerce
✓ Ikona koszyka w prawym górnym rogu
✓ Pasek postępu u góry
✓ Przyciski "Dalej" po prawej, "Wróć" po lewej
✓ Znane konwencje kolorystyczne

## Kluczowe cechy implementacji

### Responsywność
- Grid layout z `minmax(250px, 1fr)`
- Flexbox dla układów jednowymiarowych
- Sticky sidebar dla podsumowania zamówienia

### Animacje (zgodnie z Progiem Doherty'ego)
- `transition: all 0.2s` - przyciski
- `transition: all 0.3s` - karty produktów
- `animation: scaleIn 0.5s` - ikona sukcesu
- `transform: translateY(-2px)` - hover effects

### Kolory (spójność wizualna)
- **#667eea** - Akcje główne, branding
- **#48bb78** - Sukces, potwierdzenia, "Dalej"
- **#e74c3c** - Badge'y, wyróżnienia
- **#fdcb6e** - Bestseller, polecane
- **#cbd5e0** - Akcje drugorzędne, disabled

### JavaScript
- Event listeners na wszystkich interaktywnych elementach
- Natychmiastowa zmiana stanu (< 100ms)
- Dynamiczna aktualizacja podsumowania
- Walidacja formularzy

## Regeneracja PDF

Jeśli potrzebujesz wygenerować PDF ponownie:

```bash
# Metoda 1: Chromium (zalecane)
chromium --headless --disable-gpu --print-to-pdf=121546_KCK_zadanie_4_YZubakha.pdf --print-to-pdf-no-header documentation.html

# Metoda 2: Firefox
firefox --headless --screenshot documentation.html
# Następnie wydrukuj do PDF z przeglądarki

# Metoda 3: wkhtmltopdf (jeśli dostępne)
nix-shell -p wkhtmltopdf --run 'wkhtmltopdf --enable-local-file-access documentation.html 121546_KCK_zadanie_4_YZubakha.pdf'
```

## Struktura dokumentu PDF

1. **Strona tytułowa** - Informacje o autorze i zadaniu
2. **Wprowadzenie** - Cel projektu i struktura
3. **Analiza Prawa Hicka** - Szczegółowe obliczenia dla każdego etapu
4. **Zastosowane zasady UX** - Opis każdej zasady z przykładami
5. **Szczegółowy opis etapów** - Analiza każdego z 5 ekranów
6. **Implementacja techniczna** - Technologie i kluczowe cechy
7. **Podsumowanie i wnioski** - Osiągnięte cele i metryki

## Statystyki projektu

- **Liczba etapów:** 5 (wymagane minimum: 4) ✓
- **Liczba plików HTML:** 5 interaktywnych mockupów
- **Liczba zastosowanych zasad UX:** 7
- **Całkowity czas przepływu:** 32.71s (~0.5 min)
- **Rozmiar dokumentacji PDF:** 372KB
- **Linie kodu HTML/CSS/JS:** ~1400

## Zgodność z wymaganiami

✓ **Minimum 4 etapy** - Zrealizowano 5 etapów
✓ **Wizualne mockupy** - Interaktywne HTML/CSS dla każdego etapu
✓ **Obliczenia Prawa Hicka** - Szczegółowa analiza z różnymi wartościami n
✓ **Prawo Millera (7±2)** - Wszystkie etapy w zakresie 4-6 opcji
✓ **Prawo Fittsa** - Duże elementy interaktywne, odpowiednie odstępy
✓ **Próg Doherty'ego** - Reakcje < 400ms, animacje < 300ms
✓ **Efekt Von Restorffa** - Wyróżnione elementy kluczowe
✓ **Prawo Jednolitego Połączenia** - Grupowanie powiązanych elementów
✓ **Zasady Jakoba** - Standardowe konwencje e-commerce

## Technologie

- **HTML5** - Semantyczna struktura
- **CSS3** - Zaawansowane style, gradienty, animacje
- **JavaScript (Vanilla)** - Interaktywność bez frameworków
- **Python 3** - Skrypty do obliczeń i generowania dokumentacji

## Uruchomienie wszystkich analiz

```bash
# 1. Uruchom analizę Prawa Hicka
nix-shell -p python3 --run "python3 hicks_law_analysis.py > hicks_law_output.txt"

# 2. Wygeneruj dokumentację HTML
nix-shell -p python3 --run "python3 generate_pdf.py"

# 3. Konwertuj do PDF
chromium --headless --disable-gpu --print-to-pdf=121546_KCK_zadanie_4_YZubakha.pdf documentation.html

# 4. Uruchom lokalny serwer do testowania mockupów
nix-shell -p python3 --run "python3 -m http.server 8000"
```

## Kontakt

Yaroslav Zubakha
- Email: 121546@student.san.edu.pl
- Email alternatywny: yar.zubaha@proton.me
- Nr albumu: 121546

## Licencja

Projekt edukacyjny - SAN - Komunikacja Człowiek-Komputer
