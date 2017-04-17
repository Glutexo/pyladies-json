# Jednoduchá JSON aplikace

Jednoduchá restová aplikace, která vrací strukturovaná jsonová data. Není
napsaná v Pythonu, takže zároveň ukazuje možnost vzájemného porozumění mezi
různými programovacími jazyky.

Aplikace běží na adrese
[pyladies-json.herokuapp.com](https://pyladies-json.herokuapp.com/). Je napsaná
v [Ruby](http://www.ruby-lang.org/) a používá jednoduchý framework
[Sinatra](http://www.sinatrarb.com/) a databázi
[PostgreSQL](http://www.postgresql.org/).

## Vstupní body

### `/prezidenti` – čeští prezidenti

Aplikace poskutyje informace o prezidentech Československa, Protektorátu Čechy a
Morava a Česka. O každém z nich uvádí jméno, den narození a úmrtí a den nástupu
do úřadu a odstoupení z něj.

Prezident je představován objektem s vlastnostmi `jméno`, `život` a `úřad`.
Vlastnosti `život` a `úřad` jsou objektem s vlastnostmi `od` a `do`, kde pole
`do` může obsahovat prázdnou hodnotu.

Den v roce je uveden vždy podle krátké normy ISO 8601, tedy ve formátu
RRRR-MM-DD. To platí jak pro datum v adrese, tak pro hodnoty ve vráceném
objektu.

Ve všech případech se vrací seznam prezidentů: V jeden den jsme mohli mít i více
než jednoho prezidenta (protektorátní a exilový), stejně jako jsme v některé dny
žádného prezidenta neměli.

#### Použití

`GET /prezidenti/všichni` – seznam všech prezidentů

`GET /prezidenti/[rok]` – seznam všech prezidentů úřadujících v zadaný rok;
příklad: `/prezidenti/1987`

`GET /prezidenti/[datum]` – seznam všech prezidentů úřadujících v zadaný den; příklad:
`/prezidenti/1987-10-26`
