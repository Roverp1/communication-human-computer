<div align="center">

| Komunikacja Człowiek-Komputer | laboratorium                                     |
| ----------------------------- | ------------------------------------------------ |
| SAN                           |                                                  |
| Autor                         | Yaroslav Zubakha                                 |
| E-mail                        | 121546@student.san.edu.pl / yar.zubaha@proton.me |
| Nr albumu                     | 121546                                           |
| Data                          | 08.12.2025                                       |
| Wersja                        | 1.0                                              |

<br>

# **Zadanie nr 1**

## Interfejs tekstowy (CLI)

</div>

<br>

> ## Opis zadania

Zaprojektowanie komend dla programu szyfrującego pliki.

Wymagane artefakty:

- Tekst pomocy
- Opis odpowiedzi na błędne wykonanie (min. 3 scenariusze)

<br>

---

## Tekst pomocy

```
NAME
    encrypt - encrypt or decrypt files using various algorithms

SYNOPSIS
    encrypt [OPTIONS] INPUT_FILE [OUTPUT_FILE]

DESCRIPTION
    Encrypt or decrypt files with password-protected algorithms.
    If OUTPUT_FILE is not specified, creates INPUT_FILE.enc for
    encryption or INPUT_FILE.dec for decryption.

OPTIONS
    -e, --encrypt
        Encrypt the input file.

    -d, --decrypt
        Decrypt the input file.

    -a, --algorithm ALGO
        Specify encryption algorithm.
        Supported: AES-256, AES-128, DES, 3DES, RSA-2048
        Default: AES-256

    -o, --output FILE
        Write result to FILE instead of default output path.

    -f, --force
        Overwrite output file if it exists without asking.

    -v, --verbose
        Show detailed progress during operation.

    -q, --quiet
        Suppress all output except errors.

    -h, --help
        Display this help and exit.

EXAMPLES
    Encrypt a file with default algorithm:
        encrypt -e document.txt

    Decrypt with specific algorithm:
        encrypt -d -a AES-128 secret.enc

    Encrypt to specific output:
        encrypt -e -o backup.enc data.txt

    Verbose encryption:
        encrypt -e -v report.pdf

NOTES
    Password is never accepted as a command parameter.
    You will be prompted to enter it securely.

    Press Ctrl+C to abort operation at any time.
```

<br>

---

## Obsługa błędów

### Scenariusz 1: Brak pliku wejściowego

```
$ encrypt -e missing_file.txt

Error: File 'missing_file.txt' not found.
Check the path and try again.
Use 'encrypt --help' for usage information.
```

**Komunikat wyjaśnia**: nie znaleziono pliku i podaje konkretną nazwę.
**Rozwiązanie**: sprawdzić ścieżkę, użyć help.

<br>

### Scenariusz 2: Nieznany algorytm

```
$ encrypt -e -a BLOWFISH document.txt

Error: Unknown algorithm 'BLOWFISH'.
Supported algorithms: AES-256, AES-128, DES, 3DES, RSA-2048
Use 'encrypt -h' to see all options.
```

**Komunikat wyjaśnia**: podany algorytm nie istnieje.
**Rozwiązanie**: pokazuje listę dostępnych algorytmów.

<br>

### Scenariusz 3: Konflikt flag szyfrowania/deszyfrowania

```
$ encrypt -e -d document.txt

Error: Cannot use both --encrypt and --decrypt.
Choose one operation mode.
```

**Komunikat wyjaśnia**: użytkownik podał sprzeczne opcje.
**Rozwiązanie**: wybrać tylko jedną operację.

<br>

### Scenariusz 4: Plik wyjściowy już istnieje

```
$ encrypt -e document.txt output.enc

Warning: File 'output.enc' already exists.
Overwrite? (y/n): _
```

**Komunikat wyjaśnia**: plik zostanie nadpisany.
**Rozwiązanie**: użytkownik decyduje lub może użyć flagi `-f`.

<br>

### Scenariusz 5: Brak wymaganej operacji

```
$ encrypt document.txt

Error: No operation specified.
Use -e to encrypt or -d to decrypt.
Example: encrypt -e document.txt
```

**Komunikat wyjaśnia**: program nie wie co zrobić.
**Rozwiązanie**: konkretny przykład użycia.

<br>

---

## Dodatkowe funkcje

**Wprowadzanie hasła:**

```
$ encrypt -e document.txt
Enter password: ••••••••••••
Confirm password: ••••••••••••
Encrypting document.txt...
[████████████████████] 100%
Done. Output: document.txt.enc
```

**Przerwanie operacji:**

```
$ encrypt -e large_file.iso
Enter password: ••••••••
Encrypting large_file.iso...
[████████░░░░░░░░░░░░] 42%
Press Ctrl+C to abort operation.

^C
Operation aborted by user.
Partial file removed.
```

**Tryb verbose:**

```
$ encrypt -e -v report.pdf
Algorithm: AES-256
Input: report.pdf (2.4 MB)
Output: report.pdf.enc
Enter password: ••••••••
Generating key... done
Encrypting... 512 KB
Encrypting... 1.0 MB
Encrypting... 1.5 MB
Encrypting... 2.0 MB
Encrypting... 2.4 MB
Writing output... done
Completed in 1.2 seconds
```
