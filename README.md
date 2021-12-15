# Praca dyplomowa z pliku .md w 60 sekund, z podglądem PDF gotowym do wydruku

Praca magisterska w formacie gotowym do obrony na EiTI PW, prosto ze źródeł w
Markdown. Bez konieczności użycia Worda (bo drogi i czasami nieprzewidywalny)
ani LaTeXa.

Tak piszą pragmatyczni programiści!

> Rozwijamy książki podobnie, jak oprogramowanie: wszystko jest pod nadzorem
> systemu kontroli wersji, a wszystkie książki pisane są w składni Markdown
> albo w języku XML.

-- Autorzy książki "The Pragmatic Programmer" o swoim wydawnictwie

Użycie:

*Przykładowy dokument wyjściowy: [out.pdf](out.pdf)*

W pakiecie:

1. Szablon z formatowaniem gotowym do użycia w pracy magisterskiej,
    - Bardziej aktualny szablon pracy dyplomowej dla EiTI PW tu:
    [WUT-Thesis](https://github.com/ArturB/WUT-Thesis)
2. Proste użycie poprzez mechanizm `documentclass` systemu LaTeX.
3. Kompilacja jedną komendą w kilka sekund dla pracy liczącej 90 stron.
   Podobne zadanie narzędzia dedykowane dla systemu LaTeX wykonują w ciągu od
   60 do 120 sekund.

Więcej informacji o przygotowywaniu pracy dyplomowej na WEiTI: [Poradnik dyplomanta](http://www.ii.pw.edu.pl/ii_pol/Instytut-Informatyki/Nauczanie/Poradnik-dyplomanta).

**Nie** oferuje (i na razie nie powinien oferować):

1. Szablonu dla pracy *inżynierskiej*,
2. Czegokolwiek ponad to, co oferuje.

Wymagania do kompilacji
-----------------------

Pandoc i LuaLaTex.

Korzystanie
--------------

1. `sudo ./configure`,
2. `make`,
3. `make show`.

Będzie zapewne dużo błędów po drodze.

Gdyby ktoś chciał fiksy dla tych błędów włączyć do procedury konfiguracji środowiska w pliku `configure` - może zgłosić *pull request*, ale tylko jeśli nowa wersja będzie kompatybilna z systemem Fedora *oraz* Ubuntu.

Struktura repozytorium
----------------------

Definicja formatu pracy:

- Plik `eitidypl.cls`.

Twoja wersja robocza:

- Plik `meta.yaml` ze spersonalizowaną konfiguracją Pandoca,
- Katalog `personal`, a w nim:
  - Plik `labels.tex` z metadanymi pracy (tytuł, autor, streszczenie),
  - Plik `.md` z treścią pracy, oraz
  - Katalog `img` na obrazki do pracy.

Proces edycji (REPL)
--------------------

Uwaga: pojęcie "tekst" w odniesieniu do pracy oznacza *wszystkie* pliki z rozszerzeniem`.md` w katalogu `personal` - porównaj z linią `in=*.md` w pliku `Makefile`.

1. `make ed` by wyświetlić tekst [^tekst] do edycji (edytor ustawiasz w pliku `Makefile`),
2. `make` by wprowadzić zmiany do pliku wyjściowego w PDF,
3. `make show` by zobaczyć plik wyjściowy,
4. */rinse and repeat/*.

Opcje klasy
-----------

- `strict` - tylko czcionki bezszeryfowe, jak w rozporządzeniu (może nie działać),
- `draft` - znak wodny "draft" na każdej stronie.

Bonus: TDD (TDW)
-----------------------

> Write now, edit later.

W katalogu `validation` znajduje się plik `goal`.

Można w nim umieścić docelową liczbę stron do napisania w pracy.

Sprawdzenia dokonujemy komendą `make test`.

*For best effects, use regularly in small doses.*

Credits 
-------

1. Initial work: Jakub Schmidtke: `sjakub@gmail.com`,
2. Further improvements: Mikolaj Kowalski: `cmosqt@gmail.com`,
3. Refactoring and yet further improvements: Patryk Kocielnik: `dev@kocielnik.pl`.
