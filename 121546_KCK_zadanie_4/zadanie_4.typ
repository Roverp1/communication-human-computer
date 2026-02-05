#set document(
  title: "Zadanie 4 - UX Design dla E-commerce",
  author: "Yaroslav Zubakha",
  date: auto,
)

#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
  lang: "pl",
)

#set par(
  justify: true,
  leading: 0.65em,
)

#set heading(numbering: "1.1")

// Title page
#align(center)[
  #v(2cm)
  #text(size: 24pt, weight: "bold")[
    Zadanie 4
  ]
  
  #v(0.5cm)
  #text(size: 18pt)[
    UX Design dla Procesu Zakupowego E-commerce
  ]
  
  #v(2cm)
  #text(size: 14pt)[
    *Yaroslav Zubakha*\
    Nr albumu: 121546
  ]
  
  #v(1cm)
  #text(size: 12pt)[
    121546\@student.san.edu.pl\
    yar.zubaha\@proton.me
  ]
  
  #v(2cm)
  #text(size: 13pt)[
    Komunikacja Człowiek-Komputer\
    SAN - Społeczna Akademia Nauk
  ]
  
  #v(1fr)
  #datetime.today().display()
]

#pagebreak()

// Table of contents
#outline(
  title: "Spis treści",
  indent: auto,
)

#pagebreak()

= Opis zadania

Zaprojektowanie procesu zakupowego w sklepie e-commerce z wykorzystaniem zasad UX design. Projekt obejmuje minimum 4 etapy procesu zakupowego z obliczeniami czasu decyzji według Prawa Hicka.

== Wymagania

- Minimum 4 etapy procesu zakupowego
- Obliczenia czasu decyzji według Prawa Hicka
- Zastosowanie zasad: Miller's Law, Fitts's Law, Doherty Threshold, Von Restorff Effect, Law of Uniform Connection
- Zgodność z zasadami Jakoba (Jakob's Law)

= Struktura projektu

== Pliki HTML (Interaktywne mockupy)

Projekt składa się z 5 etapów, każdy zaimplementowany jako osobny plik HTML:

+ *stage1_product_selection.html* - Etap wyboru produktu (6 laptopów)
+ *stage2_payment.html* - Etap wyboru metody płatności (5 opcji)
+ *stage3_delivery.html* - Etap wyboru metody dostawy (4 opcje)
+ *stage4_summary.html* - Etap podsumowania zamówienia
+ *stage5_confirmation.html* - Etap finalizacji (potwierdzenie)

== Pliki Python

+ *hicks_law_analysis.py* - Skrypt do obliczeń Prawa Hicka
+ *generate_pdf.py* - Generator dokumentacji HTML

= Obliczenia Prawa Hicka

== Formuła

Prawo Hicka opisuje czas potrzebny na podjęcie decyzji w zależności od liczby dostępnych opcji:

$ T = a + b times log_2(n + 1) $

gdzie:
- $T$ = czas decyzji (sekundy)
- $a$ = czas bazowy (5 sekund)
- $b$ = współczynnik (1 sekunda)
- $n$ = liczba opcji

== Wyniki dla projektu

#table(
  columns: (auto, auto, auto, auto),
  align: (left, center, center, center),
  table.header(
    [*Etap*], [*Liczba opcji (n)*], [*Czas (T)*], [*Obliczenia*]
  ),
  [Wybór produktu], [6], [7.81s], [$5 + 1 times log_2(7)$],
  [Wybór płatności], [5], [7.58s], [$5 + 1 times log_2(6)$],
  [Wybór dostawy], [4], [7.32s], [$5 + 1 times log_2(5)$],
  [Weryfikacja], [-], [10.00s], [estymacja],
  table.hline(),
  [*CAŁKOWITY CZAS*], [-], [*32.71s*], [*~0.5 minuty*],
)

#v(1em)

Całkowity czas przepływu wynosi około 32.71 sekundy, co daje użytkownikowi szybki i efektywny proces zakupowy. Ograniczenie liczby opcji na każdym etapie do 4-6 pozwala utrzymać czas decyzji poniżej 8 sekund.

= Zastosowane zasady UX

== Prawo Hicka (Hick's Law)

Ograniczona liczba opcji na każdym etapie minimalizuje czas decyzji:

- Produkty: 6 widocznych jednocześnie
- Płatności: 5 metod
- Dostawa: 4 opcje
- Filtry zmniejszają widoczne opcje w większych katalogach
- Paginacja dla rozbudowanych sekcji

== Prawo Millera (Miller's Law 7±2)

Liczba elementów na każdym ekranie mieści się w zakresie 7±2, co odpowiada pojemności pamięci roboczej:

- Produkty: 6 jednocześnie widocznych
- Metody płatności: 5 opcji
- Opcje dostawy: 4 warianty
- Kroki w menu postępu: 5 etapów

== Prawo Fittsa (Fitts's Law)

Elementy interaktywne zaprojektowane z uwzględnieniem odległości i rozmiaru:

- Duże przyciski głównych akcji (padding 16-20px)
- Odpowiednie odstępy między elementami (15-25px)
- Minimalna wielkość klikanych elementów: 40×40px
- Najważniejsze akcje są większe i bliżej użytkownika

== Próg Doherty'ego (Doherty Threshold \<400ms)

Wszystkie interakcje zachodzą poniżej progu 400ms:

- Reakcja na kliknięcia \< 100ms
- Animacje przejść 200-300ms
- Natychmiastowy feedback wizualny
- Dynamiczna aktualizacja stanu bez opóźnień

== Efekt Von Restorffa (Von Restorff Effect)

Kluczowe elementy wyróżnione wizualnie:

- Bestseller z żółtym gradientem + badge
- Polecana metoda płatności z dedykowanym badge'em
- Najszybsza dostawa - czerwony badge
- Darmowa dostawa - zielony badge

== Prawo Jednolitego Połączenia

Powiązane elementy zgrupowane wizualnie:

- Filtry w jednym kontenerze
- Spójne kolory dla podobnych akcji
- Sekcje wyraźnie oddzielone
- Powiązane informacje w jednym bloku

== Zasady Jakoba (Jakob's Law)

Użycie standardowych konwencji e-commerce:

- Ikona koszyka w prawym górnym rogu
- Pasek postępu u góry strony
- Przyciski "Dalej" po prawej stronie
- Przyciski "Wróć" po lewej stronie
- Znane konwencje kolorystyczne (zielony = sukces, czerwony = akcent)

= Kluczowe cechy implementacji

== Responsywność

- Grid layout z `minmax(250px, 1fr)` dla elastycznego układu
- Flexbox dla układów jednowymiarowych
- Sticky sidebar dla podsumowania zamówienia
- Adaptacja do różnych rozmiarów ekranu

== Animacje

Zgodnie z Progiem Doherty'ego, wszystkie animacje poniżej 400ms:

- `transition: all 0.2s` dla przycisków
- `transition: all 0.3s` dla kart produktów
- `animation: scaleIn 0.5s` dla ikony sukcesu
- `transform: translateY(-2px)` dla efektów hover

== Kolory

Spójna paleta kolorów w całym projekcie:

#table(
  columns: (auto, 1fr),
  align: (left, left),
  [*\#667eea*], [Akcje główne, branding],
  [*\#48bb78*], [Sukces, potwierdzenia, przyciski "Dalej"],
  [*\#e74c3c*], [Badge'y, wyróżnienia],
  [*\#fdcb6e*], [Bestseller, elementy polecane],
  [*\#cbd5e0*], [Akcje drugorzędne, disabled],
)

== JavaScript

- Event listeners na wszystkich interaktywnych elementach
- Natychmiastowa zmiana stanu (\< 100ms)
- Dynamiczna aktualizacja podsumowania zamówienia
- Walidacja formularzy w czasie rzeczywistym

= Szczegółowy opis etapów

== Etap 1: Wybór produktu

Ekran prezentuje 6 laptopów w przejrzystym układzie grid. Bestseller wyróżniony wizualnie żółtym gradientem. Każda karta produktu zawiera:

- Obraz produktu
- Nazwę i podstawowe parametry
- Cenę
- Przycisk "Wybierz"

Czas decyzji według Prawa Hicka: 7.81s

== Etap 2: Wybór płatności

Pięć metod płatności z wyraźnie zaznaczoną rekomendacją. Opcje obejmują:

- Karta płatnicza (polecana)
- BLIK
- PayPal
- Przelew bankowy
- Płatność przy odbiorze

Czas decyzji: 7.58s

== Etap 3: Wybór dostawy

Cztery opcje dostawy z wyróżnieniem darmowej dostawy:

- Kurier InPost (darmowa)
- Kurier DPD (express)
- Paczkomat InPost
- Odbiór osobisty

Czas decyzji: 7.32s

== Etap 4: Podsumowanie

Weryfikacja wszystkich wyborów z możliwością powrotu do wcześniejszych etapów. Wyświetlenie:

- Wybrany produkt
- Metoda płatności
- Metoda dostawy
- Całkowita kwota
- Checkbox z regulaminem

Czas weryfikacji: 10.00s (estymacja)

== Etap 5: Potwierdzenie

Ekran finalizacji z potwierdzeniem zamówienia, numerem zamówienia i dalszymi instrukcjami.

= Statystyki projektu

#table(
  columns: (1fr, auto),
  align: (left, right),
  [Liczba etapów], [5],
  [Liczba plików HTML], [5],
  [Liczba zastosowanych zasad UX], [7],
  [Całkowity czas przepływu], [32.71s],
  [Linie kodu HTML/CSS/JS], [~1400],
)

= Zgodność z wymaganiami

Projekt spełnia wszystkie wymagania zadania:

- *Min 4 etapy* - Zrealizowano 5 etapów
- *Wizualne mockupy* - HTML/CSS dla każdego etapu
- *Obliczenia Prawa Hicka* - Analiza z różnymi wartościami n
- *Prawo Millera (7±2)* - Wszystkie etapy zawierają 4-6 opcji
- *Prawo Fittsa* - Duże elementy, odpowiednie odstępy
- *Próg Doherty'ego* - Reakcje \<400ms, animacje \<300ms
- *Efekt Von Restorffa* - Wyróżnione elementy kluczowe
- *Prawo Jednolitego Połączenia* - Grupowanie powiązanych elementów
- *Zasady Jakoba* - Standardowe konwencje e-commerce

= Technologie

Projekt wykorzystuje:

- *HTML5* - Semantyczna struktura dokumentu
- *CSS3* - Zaawansowane style, gradienty, animacje
- *JavaScript (Vanilla)* - Interaktywność bez zewnętrznych frameworków
- *Python 3* - Skrypty do obliczeń i generowania dokumentacji

= Podsumowanie

Projekt realizuje kompletny proces zakupowy w sklepie e-commerce z uwzględnieniem najważniejszych zasad UX design. Całkowity czas przepływu wynoszący 32.71 sekundy świadczy o efektywności zaprojektowanego interfejsu.

Ograniczenie liczby opcji na każdym etapie do 4-6 elementów, zgodnie z Prawem Hicka i Prawem Millera, pozwala użytkownikowi na szybkie podejmowanie decyzji bez przeciążenia poznawczego.

Zastosowanie standardowych konwencji e-commerce (Jakob's Law) zapewnia intuicyjność interfejsu, a wyróżnienie kluczowych elementów (Von Restorff Effect) kieruje uwagę użytkownika na najważniejsze akcje.

Projekt demonstruje praktyczne zastosowanie teorii UX w rzeczywistym scenariuszu biznesowym.
