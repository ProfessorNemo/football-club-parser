# Исправленный в соответствии с 3-й версией ruby парсер футбольных клубов с сайта https://www.transfermarkt.com, который был написан на стримах в декабре 2019 г.:

> Первая часть: https://www.youtube.com/watch?v=_LNcuGqbmoY

> Вторая часть: https://www.youtube.com/watch?v=3BW7zISHri0

###### Язык написания — Ruby (версия 3.0.2)

> парсер совмещает данные таблицы премьер-лиги:  https://www.transfermarkt.com/premier-liga/tabelle/wettbewerb/RU1/

> со списком игроков команд и ценами контрактов, к примеру ФК «Зенит»:
https://www.transfermarkt.com/zenit-st-petersburg/startseite/verein/964?saison_id=2021

> Результатом работы программы является таблица с местами ФК в рейтинге, название
> ФК и суммарной стоимостью игроков каждого клуба (стоимость ФК). В конце
> выводится общая стоимость всех ФК в евро.

## Пример работы программы:
```
ruby main.rb

1: Zenit S-Pb, €164 550 000.0

5: CSKA Moscow, €104 850 000.0

2: Dynamo Moscow, €104 700 000.0

10: Spartak Moscow, €102 950 000.0

6: Loko Moscow, €79 300 000.0

4: Krasnodar, €68 125 000.0

14: Rubin Kazan, €32 775 000.0

3: Sochi, €31 750 000.0

9: Rostov, €30 350 000.0

8: KS Samara, €25 600 000.0

7: Akhmat Grozny, €25 410 000.0

16: Arsenal Tula, €22 575 000.0

13: Khimki, €19 925 000.0

15: Ufa, €17 150 000.0

12: Ural, €15 875 000.0

11: Nizhny Novgorod, €14 750 000.0

Стоимость российского футбола: €860 635 000.0
```


