*** Settings ***
Documentation   Testy pro spravu zbozi - vyhledavani
...             a test pro cely proces objednavky zbozi

Metadata        Autor   Tran Dac Ha
Metadata        Verze   1.0

Resource  ../Resources/common.robot
Resource  ../Resources/spravaZbozi.robot
Resource  ../Resources/spravaUzivatele.robot

# robot -d Results/TS02_sprava_zbozi Tests/TS02_sprava_zbozi.robot

Test Setup      Otevreni stranky Alza
Test Teardown   Zavreni stranky Alza

*** Test Cases ***
Vyhledavani zbozi
    [Tags]  smoke
    Vyhledani zbozi  sluchatka

Objednavka zbozi
    [Tags]  smoke
    Kliknuti na prihlasit
    Vlozeni prihlasovacich udaju    ${email}    ${heslo}
    Vyhledani zbozi  sluchatka
    Vlozeni prvniho vyhledaneho zbozi do kosiku
    Pokracovani do kosiku
    Pokracovani na vyber dopravy
    Vybrani zpusobu dopravy     Praha 7 - Holešovice
    Vybrani zpusobu platby      Hotově / kartou
    Pokracovani na dodaci udaje
    Dokonceni objednavky