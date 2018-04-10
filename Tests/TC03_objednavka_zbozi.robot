*** Settings ***
Documentation   Test pro cely proces objednavky zbozi

Metadata        Autor   Tran Dac Ha
Metadata        Verze   1.0

Resource  ../Resources/keywords.robot

# robot -d Results/TC03_objednavka_zbozi Tests/TC03_objednavka_zbozi.robot

Test Setup      Otevreni stranky Alza
Test Teardown   Zavreni stranky Alza

*** Test Cases ***
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