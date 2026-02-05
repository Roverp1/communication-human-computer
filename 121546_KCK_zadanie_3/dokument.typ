#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
  lang: "pl"
)

#set par(justify: true, leading: 0.65em)

#set heading(numbering: "1.")

#show heading.where(level: 1): it => [
  #set text(size: 20pt, weight: "bold")
  #block(below: 1.2em, above: 1.5em)[#it]
]

#show heading.where(level: 2): it => [
  #set text(size: 14pt, weight: "bold")
  #block(below: 0.8em, above: 1.2em)[#it]
]

#show heading.where(level: 3): it => [
  #set text(size: 12pt, weight: "semibold")
  #block(below: 0.6em, above: 1em)[#it]
]

// Header
#align(center)[
  #block[
    #table(
      columns: 2,
      stroke: 0.5pt + black,
      align: (left, left),
      inset: 8pt,
      [*Komunikacja Człowiek-Komputer*], [laboratorium],
      [SAN], [],
      [Autor], [Yaroslav Zubakha],
      [E-mail], [121546\@student.san.edu.pl / yar.zubaha\@proton.me],
      [Nr albumu], [121546],
      [Data], [14.12.2025],
      [Wersja], [1.0],
    )
  ]
  
  #v(1em)
  
  #text(size: 24pt, weight: "bold")[Zadanie nr 3]
  
  #v(0.5em)
  
  #text(size: 16pt)[Portal WWW]
]

#v(1.5em)

= Opis zadania

Wykonanie 3 szkiców graficznego interfejsu użytkownika portalu www.

*Wymagania:*
- 3 szkice dla tego samego serwisu
- Minimum 5 kontrolek na każdym szkicu
- Razem co najmniej 15 kontrolek w całej pracy
- Spójność stylu wizualnego
- Zgodność z konwencjami webowymi

#pagebreak()

= Portal

*System Zarządzania Ocenami*

Portal webowy dla nauczycieli do zarządzania ocenami studentów. Trzy główne ekrany pokrywają typowy przepływ pracy: logowanie, wprowadzanie ocen, przeglądanie raportów.

== Metoda tworzenia szkiców

Szkice zostały wygenerowane programistycznie przy użyciu Python + biblioteki PIL/Pillow. Są to graficzne wireframe'y pokazujące strukturę interfejsu użytkownika bez nadmiernych detali wizualnych. Każdy szkic prezentuje układ kontrolek, hierarchię informacji i przepływ interakcji użytkownika.

Szkice nie są kodem HTML/CSS - są to obrazy graficzne przedstawiające mockupy interfejsu, podobnie jak powstałyby w narzędziach typu Figma, Sketch czy Adobe XD.

== Specyfika portalu www

Portal zaprojektowany z uwzględnieniem zasad projektowania stron internetowych:

*Ograniczona uwaga użytkowników:*
- Formularz wprowadzania podzielony na sekcje z nagłówkami
- Najważniejsze przyciski wyróżnione kolorem
- Tekst pomocniczy pod polami zamiast długich instrukcji

*Niecierpliwość i wartość dla użytkownika:*
- Procesy zoptymalizowane do minimum kroków
- Widoczne przyciski akcji (Eksportuj PDF, Excel, Drukuj)
- Statusy w stopce pokazują co się dzieje

*Konwencje webowe:*
- Ikonka lupy przy wyszukiwaniu
- Niebieskie podkreślone linki
- Menu nawigacyjne u góry strony
- Paginacja pod tabelą

*Responsywne projektowanie:*
- Interfejs używa standardowych kontrolek webowych
- Layout przygotowany pod różne rozdzielczości
- Białe tło głównej zawartości dla czytelności

#pagebreak()

= Szkice graficzne

== Szkic 1: Ekran logowania

#figure(
  image("wireframes/szkic-1-logowanie.png", width: 85%),
  caption: [Ekran logowania],
)

Graficzny szkic ekranu logowania z centralnym panelem. Wireframe pokazuje strukturę interfejsu bez nadmiernych detali wizualnych.

*Kontrolki (6):*

#enum(
  [Pole tekstowe (nazwa użytkownika)],
  [Pole hasła],
  [Checkbox (zapamiętaj mnie)],
  [Link (zapomniałeś hasła)],
  [Przycisk "Anuluj"],
  [Przycisk "Zaloguj się"],
)

*Zastosowane zasady:*

- Przycisk głównej akcji po prawej, anuluj po lewej (konwencja webowa)
- Wyraźna hierarchia wizualna - centralny panel z białym tłem
- Link odzyskiwania hasła dostępny ale nie dominujący
- Status połączenia w stopce (informacja zwrotna)
- Minimalistyczny design skupiający uwagę na logowaniu

#pagebreak()

== Szkic 2: Wprowadzanie oceny

#figure(
  image("wireframes/szkic-2-wprowadzanie-oceny.png", width: 85%),
  caption: [Formularz wprowadzania oceny],
)

Graficzny szkic formularza do dodawania ocen. Wireframe pokazuje układ pól formularza, paska narzędzi i przycisków akcji.

*Kontrolki (11):*

#enum(
  [Przycisk "Cofnij" (pasek narzędzi)],
  [Przycisk "Ponów" (pasek narzędzi)],
  [Przycisk "Zapisz" (pasek narzędzi)],
  [Dropdown wyboru studenta],
  [Dropdown wyboru przedmiotu],
  [Dropdown wyboru oceny],
  [Date picker (data wystawienia)],
  [Pole tekstowe wieloliniowe (komentarz)],
  [Przycisk "Wyczyść"],
  [Przycisk "Anuluj"],
  [Przycisk "Zapisz ocenę"],
)

*Zastosowane zasady:*

- Menu nawigacyjne u góry (spójność)
- Dropdowny zamiast wolnego tekstu (zapobieganie błędom)
- Wymagane pola oznaczone gwiazdką (\*)
- Status formularza w stopce (widoczność stanu systemu)
- Cofnij/Ponów dla kontroli użytkownika
- Teksty pomocnicze pod polami
- Główna akcja wyróżniona kolorem niebieskim
- Dwukolumnowy układ dla efektywnego wykorzystania przestrzeni

#pagebreak()

== Szkic 3: Raport ocen studentów

#figure(
  image("wireframes/szkic-3-raport-studentow.png", width: 85%),
  caption: [Raport ocen studentów],
)

Graficzny szkic tabeli raportowej z ocenami studentów. Wireframe pokazuje strukturę danych, filtry, opcje eksportu i paginację.

*Kontrolki (15+):*

#enum(
  [Pole wyszukiwania],
  [Przycisk szukaj (ikona lupy)],
  [Przycisk "Eksportuj PDF"],
  [Przycisk "Eksportuj Excel"],
  [Przycisk "Drukuj"],
  [Dropdown filtra (przedmiot)],
  [Dropdown filtra (okres)],
  [Dropdown filtra (status)],
  [Tabela danych (7 kolumn, 5 wierszy widocznych)],
  [Ikony akcji edycji i usuwania w kolumnie "Akcje"],
  [Przycisk "Poprzednia" (paginacja)],
  [Przyciski numerów stron (1-6)],
  [Przycisk "Następna" (paginacja)],
  [Panel statystyk (łącznie ocen)],
  [Panel statystyk (średnia)],
  [Panel statystyk (zdawalność)],
)

*Zastosowane zasady:*

- Menu nawigacyjne u góry (spójność z innymi ekranami)
- Statystyki w osobnych panelach na górze (KPI widoczne od razu)
- Elastyczność (wiele opcji eksportu i filtrów)
- Rozpoznawanie zamiast przypominania (ikony przy akcjach)
- Paginacja dla dużych zbiorów danych
- Informacje o stanie w stopce (liczba rekordów, ostatnia aktualizacja)
- Czytelne nagłówki kolumn
- Widoczne oznaczenia akcji dla każdego rekordu

#pagebreak()

= Podsumowanie

== Kontrolki

#table(
  columns: 2,
  stroke: 0.5pt + black,
  align: (left, center),
  inset: 8pt,
  [*Ekran*], [*Liczba kontrolek*],
  [Logowanie], [6],
  [Wprowadzanie oceny], [11],
  [Raport], [15+],
  [*Razem*], [*32+*],
)

#v(0.5em)

Wymagane minimum (15) przekroczone dwukrotnie.

== Spójność wizualna

*Kolory:*
- Niebieski (główna akcja, nagłówki, linki)
- Szary (akcje drugorzędne, tło)
- Czerwony (usuwanie, błędy)
- Zielony (sukces, pozytywne wartości)

*Typografia:*
- Jednolity font we wszystkich ekranach
- Konsystentne rozmiary dla nagłówków, tekstu, etykiet

*Layout:*
- Menu nawigacyjne u góry (spójne na ekranach 2-3)
- Stopka ze statusem na wszystkich ekranach
- Białe tło głównej zawartości
- Odpowiednie odstępy między elementami

*Przyciski:*
- Anuluj zawsze po lewej, główna akcja po prawej
- Ikony tam gdzie poprawiają czytelność
- Konsystentny padding i zaokrąglenia

== Zgodność z heurystykami Nielsena

#enum(
  [*Widoczność statusu:* stopki ze statusem, wskaźniki postępu],
  [*Dopasowanie do świata rzeczywistego:* polska terminologia edukacyjna],
  [*Kontrola użytkownika:* cofnij/ponów, anuluj, czyszczenie formularzy],
  [*Spójność i standardy:* układ przycisków, nawigacja, kolory],
  [*Zapobieganie błędom:* dropdowny, date picker, pola wymagane],
  [*Rozpoznawanie zamiast przypominania:* widoczne menu, ikony],
  [*Elastyczność:* filtry, opcje eksportu, paginacja],
  [*Estetyka i minimalizm:* czysty design, brak zbędnych elementów],
  [*Pomoc przy błędach:* teksty pomocnicze, placeholdery],
  [*Dokumentacja:* statusy, etykiety, podpowiedzi],
)
