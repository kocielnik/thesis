# FAQ

- W sekretariacie powiedziano mi, że główną czcionką pracy musi być Times New Roman. Jak ustawić tę czcionkę?
- W świetle samych wymagań rektora nie potrzebujesz czcionki Times New Roman ani jej odpowiednika, bo ustawa wymaga jedynie, by zastosowana czcionka była szeryfowa, a domyślna czcionka Computer Modern w systemie LaTeX jest przykładem takiej czcionki. Jeśli chcesz mimo to użyć w pracy najbliższego odpowiednika Times New Roman (oryginał jest płatny), możesz to zrobić używając przełącznika klasy `times`, czyli: `/documentclass[times]{weitidypl}`.

- Jak mogę zdefiniować rozdział bez numeru rozdziału, np. "Definicje" na początku pracy?
- Rozdziały nienumerowane dla programu Pandoc definiujemy dodając za tytułem rozdziału po spacji ciąg znaków `{-}`. Na przykład definicja nienumerowanego rozdziału "Definicje" będzie wyglądała następująco: `# Definicje {-}`.


