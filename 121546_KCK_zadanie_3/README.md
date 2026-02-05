<div align="center">

| Komunikacja Człowiek-Komputer | laboratorium                                     |
| ----------------------------- | ------------------------------------------------ |
| SAN                           |                                                  |
| Autor                         | Yaroslav Zubakha                                 |
| E-mail                        | 121546@student.san.edu.pl / yar.zubaha@proton.me |
| Nr albumu                     | 121546                                           |
| Data                          | 14.12.2025                                       |
| Wersja                        | 1.0                                              |

<br>

# **Zadanie nr 3**

## Portal WWW

</div>

<br>

> ## Opis zadania

Wykonanie 3 szkiców graficznego interfejsu użytkownika portalu www.

Wymagania:

- 3 szkice dla tego samego serwisu
- Minimum 5 kontrolek na każdym szkicu
- Razem co najmniej 15 kontrolek w całej pracy
- Spójność stylu wizualnego
- Zgodność z konwencjami webowymi

<br>

---

## Portal

System Zarządzania Ocenami

Portal webowy dla nauczycieli do zarządzania ocenami studentów. Trzy główne ekrany pokrywają typowy przepływ pracy: logowanie, wprowadzanie ocen, przeglądanie raportów.

## Metoda tworzenia szkiców

Szkice zostały wygenerowane programistycznie przy użyciu Python + biblioteki PIL/Pillow. Są to graficzne wireframe'y pokazujące strukturę interfejsu użytkownika bez nadmiernych detali wizualnych. Każdy szkic prezentuje układ kontrolek, hierarchię informacji i przepływ interakcji użytkownika.

Szkice nie są kodem HTML/CSS - są to obrazy graficzne przedstawiające mockupy interfejsu, podobnie jak powstałyby w narzędziach typu Figma, Sketch czy Adobe XD.

## Specyfika portalu www

Portal zaprojektowany z uwzględnieniem zasad projektowania stron internetowych:

**Ograniczona uwaga użytkowników:**
- Formularz wprowadzania podzielony na sekcje z nagłówkami
- Najważniejsze przyciski wyróżnione kolorem
- Tekst pomocniczy pod polami zamiast długich instrukcji

**Niecierpliwość i wartość dla użytkownika:**
- Procesy zoptymalizowane do minimum kroków
- Widoczne przyciski akcji (Eksportuj PDF, Excel, Drukuj)
- Statusy w stopce pokazują co się dzieje

**Konwencje webowe:**
- Ikonka lupy przy wyszukiwaniu
- Niebieskie podkreślone linki
- Menu nawigacyjne u góry strony
- Paginacja pod tabelą

**Responsywne projektowanie:**
- Interfejs używa standardowych kontrolek webowych
- Layout przygotowany pod różne rozdzielczości
- Białe tło głównej zawartości dla czytelności

<br>

---

## Szkic 1: Ekran logowania

**Plik:** `wireframes/szkic-1-logowanie.png`

Graficzny szkic ekranu logowania z centralnym panelem. Wireframe pokazuje strukturę interfejsu bez nadmiernych detali wizualnych.

**Kontrolki (6):**

1. Pole tekstowe (nazwa użytkownika)
2. Pole hasła
3. Checkbox (zapamiętaj mnie)
4. Link (zapomniałeś hasła)
5. Przycisk "Anuluj"
6. Przycisk "Zaloguj się"

**Zastosowane zasady:**

- Przycisk głównej akcji po prawej, anuluj po lewej (konwencja webowa)
- Wyraźna hierarchia wizualna - centralny panel z białym tłem
- Link odzyskiwania hasła dostępny ale nie dominujący
- Status połączenia w stopce (informacja zwrotna)
- Minimalistyczny design skupiający uwagę na logowaniu

<br>

---

## Szkic 2: Wprowadzanie oceny

**Plik:** `wireframes/szkic-2-wprowadzanie-oceny.png`

Graficzny szkic formularza do dodawania ocen. Wireframe pokazuje układ pól formularza, paska narzędzi i przycisków akcji.

**Kontrolki (11):**

1. Przycisk "Cofnij" (pasek narzędzi)
2. Przycisk "Ponów" (pasek narzędzi)
3. Przycisk "Zapisz" (pasek narzędzi)
4. Dropdown wyboru studenta
5. Dropdown wyboru przedmiotu
6. Dropdown wyboru oceny
7. Date picker (data wystawienia)
8. Pole tekstowe wieloliniowe (komentarz)
9. Przycisk "Wyczyść"
10. Przycisk "Anuluj"
11. Przycisk "Zapisz ocenę"

**Zastosowane zasady:**

- Menu nawigacyjne u góry (spójność)
- Dropdowny zamiast wolnego tekstu (zapobieganie błędom)
- Wymagane pola oznaczone gwiazdką (*)
- Status formularza w stopce (widoczność stanu systemu)
- Cofnij/Ponów dla kontroli użytkownika
- Teksty pomocnicze pod polami
- Główna akcja wyróżniona kolorem niebieskim
- Dwukolumnowy układ dla efektywnego wykorzystania przestrzeni

<br>

---

## Szkic 3: Raport ocen studentów

**Plik:** `wireframes/szkic-3-raport-studentow.png`

Graficzny szkic tabeli raportowej z ocenami studentów. Wireframe pokazuje strukturę danych, filtry, opcje eksportu i paginację.

**Kontrolki (15+):**

1. Pole wyszukiwania
2. Przycisk szukaj (ikona lupy)
3. Przycisk "Eksportuj PDF"
4. Przycisk "Eksportuj Excel"
5. Przycisk "Drukuj"
6. Dropdown filtra (przedmiot)
7. Dropdown filtra (okres)
8. Dropdown filtra (status)
9. Tabela danych (7 kolumn, 5 wierszy widocznych)
10. Ikony akcji edycji i usuwania w kolumnie "Akcje"
11. Przycisk "Poprzednia" (paginacja)
12. Przyciski numerów stron (1-6)
13. Przycisk "Następna" (paginacja)
14. Panel statystyk (łącznie ocen)
15. Panel statystyk (średnia)
16. Panel statystyk (zdawalność)

**Zastosowane zasady:**

- Menu nawigacyjne u góry (spójność z innymi ekranami)
- Statystyki w osobnych panelach na górze (KPI widoczne od razu)
- Elastyczność (wiele opcji eksportu i filtrów)
- Rozpoznawanie zamiast przypominania (ikony przy akcjach)
- Paginacja dla dużych zbiorów danych
- Informacje o stanie w stopce (liczba rekordów, ostatnia aktualizacja)
- Czytelne nagłówki kolumn
- Widoczne oznaczenia akcji dla każdego rekordu

<br>

---

## Podsumowanie kontrolek

| Ekran              | Liczba kontrolek |
| ------------------ | ---------------- |
| Logowanie          | 6                |
| Wprowadzanie oceny | 11               |
| Raport             | 15+              |
| **Razem**          | **32+**          |

Wymagane minimum (15) przekroczone dwukrotnie.

<br>

---

## Spójność wizualna

**Kolory:**

- Niebieski (główna akcja, nagłówki, linki)
- Szary (akcje drugorzędne, tło)
- Czerwony (usuwanie, błędy)
- Zielony (sukces, pozytywne wartości)

**Typografia:**

- Jednolity font we wszystkich ekranach
- Konsystentne rozmiary dla nagłówków, tekstu, etykiet

**Layout:**

- Menu nawigacyjne u góry (spójne na ekranach 2-3)
- Stopka ze statusem na wszystkich ekranach
- Białe tło głównej zawartości
- Odpowiednie odstępy między elementami

**Przyciski:**

- Anuluj zawsze po lewej, główna akcja po prawej
- Ikony tam gdzie poprawiają czytelność
- Konsystentny padding i zaokrąglenia

<br>

---

## Zgodność z heurystykami Nielsena

1. **Widoczność statusu**: stopki ze statusem, wskaźniki postępu
2. **Dopasowanie do świata rzeczywistego**: polska terminologia edukacyjna
3. **Kontrola użytkownika**: cofnij/ponów, anuluj, czyszczenie formularzy
4. **Spójność i standardy**: układ przycisków, nawigacja, kolory
5. **Zapobieganie błędom**: dropdowny, date picker, pola wymagane
6. **Rozpoznawanie zamiast przypominania**: widoczne menu, ikony
7. **Elastyczność**: filtry, opcje eksportu, paginacja
8. **Estetyka i minimalizm**: czysty design, brak zbędnych elementów
9. **Pomoc przy błędach**: teksty pomocnicze, placeholdery
10. **Dokumentacja**: statusy, etykiety, podpowiedzi
