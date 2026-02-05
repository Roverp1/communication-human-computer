# Zadanie 3 - Szkice Graficzne

## Podsumowanie wykonania

### Ocena poprzednia: 3/5
**Problem:** "Te same szkice co w zadaniu 2" - HTML/CSS screenshots zamiast graficznych mockupów

### Nowe podejście: Graficzne wireframe'y

Zadanie zostało przerobione z użyciem **graficznych szkiców** zamiast kodu HTML/CSS.

## Wygenerowane pliki

### Szkice graficzne (wireframes):
- `wireframes/szkic-1-logowanie.png` - Ekran logowania (6 kontrolek)
- `wireframes/szkic-2-wprowadzanie-oceny.png` - Formularz ocen (11 kontrolek)
- `wireframes/szkic-3-raport-studentow.png` - Raport tabelaryczny (15+ kontrolek)

### Dokumentacja:
- `121546_KCK_zadanie_3_szkice_graficzne.pdf` - Kompletny dokument PDF ze wszystkimi szkicami i opisami
- `README.md` - Szczegółowy opis każdego szkicu

### Skrypty generujące:
- `generate_sketches.py` - Generuje wireframe'y używając Python + PIL/Pillow
- `generate_pdf.py` - Tworzy dokument PDF z opisami

## Różnice między Zadaniem 2 a Zadaniem 3

| Aspekt | Zadanie 2 | Zadanie 3 (nowe) |
|--------|-----------|------------------|
| Format | HTML/CSS kod | Graficzne wireframe'y |
| Narzędzia | Tkinter + HTML | Python + PIL/Pillow |
| Rezultat | Działający prototyp | Mockup graficzny |
| Cel | Demonstracja funkcjonalności | Demonstracja designu UI |
| Pliki | HTML + CSS + screenshots | PNG wireframes |

## Wymagania spełnione

✓ 3 szkice graficzne interfejsu  
✓ Minimum 5 kontrolek na szkic (mamy 6, 11, 15+)  
✓ Razem 32 kontrolki (wymagane minimum: 15)  
✓ Spójność stylu wizualnego (kolory, typografia, układ)  
✓ Zgodność z konwencjami webowymi  
✓ Nie są to screenshoty HTML/CSS - tylko grafika  

## Jak uruchomić

Regenerowanie szkiców:
```bash
nix-shell -p python3Packages.pillow --run "python3 generate_sketches.py"
```

Regenerowanie PDF:
```bash
nix-shell -p python3Packages.pillow --run "python3 generate_pdf.py"
```

## Główne kontrolki użyte

1. **Pola tekstowe** - Input fields z placeholderami
2. **Dropdown/Select** - Listy rozwijane z trójkątem
3. **Przyciski** - Podstawowe i główne akcje (primary)
4. **Checkbox** - Pole wyboru z oznaczeniem
5. **Date picker** - Pole daty z ikoną kalendarza
6. **Textarea** - Wieloliniowe pole tekstowe
7. **Tabela** - Strukturyzowane dane w wierszach i kolumnach
8. **Linki** - Podkreślone odnośniki
9. **Ikony akcji** - Edycja, usuwanie
10. **Paginacja** - Numerowane strony
11. **Panel statystyk** - KPI widgets
12. **Pasek narzędzi** - Toolbar z akcjami
13. **Menu nawigacyjne** - Top navigation bar
14. **Pasek statusu** - Footer z informacjami o stanie

## Wykorzystane zasady UX

- **Hierarchia wizualna** - Wyraźne rozróżnienie ważności elementów
- **Konwencje webowe** - Standardowe pozycje i zachowania kontrolek
- **Spójność** - Jednolity styl na wszystkich ekranach
- **Informacja zwrotna** - Status bary, komunikaty
- **Zapobieganie błędom** - Dropdowny, walidacja, required fields
- **Elastyczność** - Wiele opcji działania (eksport, filtry)
- **Minimalizm** - Brak zbędnych elementów, clean design
