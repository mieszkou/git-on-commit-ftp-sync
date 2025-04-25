# Synchronizacja po commit na `main`

Ten projekt umożliwia automatyczną synchronizację plików z serwerem FTP po wykonaniu commitu na gałęzi `main`. Poniżej znajduje się opis działania oraz konfiguracji skryptów.

## Pliki i konfiguracja

### 1. Plik `.env`
Plik `.env` zawiera dane konfiguracyjne potrzebne do połączenia z serwerem FTP. Przykładowy plik `.env.sample` wygląda następująco:

```
FTP_HOST=host.example.com
FTP_LOGIN=login
FTP_PASSWORD=pass
FTP_FOLDER=/public_html/
```

Skopiuj plik `.env.sample` do `.env` i uzupełnij odpowiednimi danymi.

### 2. Skrypt `enable_git_hooks_in_new_repo.cmd`
Ten skrypt kopiuje odpowiednie hooki Git do katalogu `.git/hooks`, aby umożliwić automatyczne uruchamianie synchronizacji po każdym commicie.

#### Jak używać:
1. Upewnij się, że znajdujesz się w katalogu głównym repozytorium Git.
2. Uruchom skrypt `enable_git_hooks_in_new_repo.cmd`.
3. Skrypt skopiuje hooki Git i wyświetli komunikat o sukcesie.

### 3. Hooki Git
Hooki Git (np. `post-commit`) są odpowiedzialne za uruchamianie procesu synchronizacji z serwerem FTP po każdym commicie na gałęzi `main`.

## Działanie synchronizacji
1. Po wykonaniu commitu na gałęzi `main`, hook `post-commit` zostaje automatycznie uruchomiony.
2. Hook korzysta z danych konfiguracyjnych z pliku `.env` i przesyła zmienione pliki na serwer FTP do wskazanego katalogu.

## Wykluczenia plików
Plik `.gitignore` zawiera listę plików, które nie będą synchronizowane z serwerem FTP. Domyślnie wykluczone są:
- `.env`
- `winscp.log`

## Wymagania
- Zainstalowany Git.
- Dostęp do serwera FTP.
- Skonfigurowany plik `.env`.

## Uwagi
- Upewnij się, że dane w pliku `.env` są poprawne i aktualne.
- Skrypt `enable_git_hooks_in_new_repo.cmd` należy uruchomić tylko raz po skonfigurowaniu repozytorium.

## Autor
Projekt został stworzony w celu automatyzacji procesu wdrażania zmian na serwerze FTP.

