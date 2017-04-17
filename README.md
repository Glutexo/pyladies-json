# Jednoduchá JSON aplikace

Jednoduchá restová aplikace, která vrací strukturovaná jsonová data. Není
napsaná v Pythonu, takže zároveň ukazuje možnost vzájemného porozumění mezi
různými programovacími jazyky.

Aplikace běží na adrese
[pyladies-json.herokuapp.com](https://pyladies-json.herokuapp.com/). Je napsaná
v [Ruby](http://www.ruby-lang.org/) a používá jednoduchý framework
[Sinatra](http://www.sinatrarb.com/).

## Vstupní body

### `/prezidenti` – čeští prezidenti

Aplikace poskutyje informace o prezidentech Československa, Protektorátu Čechy a
Morava a Česka. O každém z nich uvádí pár údajů, aby se nejednalo jen o nudný
seznam řetězců se jmény.

Prezident je představován objektem s vlastnostmi `jméno` a `život`. Vlastnost
`život` je objektem s vlastnostmi `od` a `do`, kde pole `do` může obsahovat
prázdnou hodnotu.

#### Použití

`GET /prezidenti/všichni` – seznam všech prezidentů

`GET /prezidenti/[rok]` – seznam všech prezidentů úřadujících v zadaný rok;
příklad: `/prezidenti/1987`

`GET /prezidenti/[datum]` – seznam všech prezidentů úřadujících v zadaný den
(podle krátké normy ISO 8601, tedy RRRR-MM-DD); příklad:
`/prezidenti/1987-10-26`
