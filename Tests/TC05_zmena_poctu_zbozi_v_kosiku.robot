*** Settings ***
Metadata        Autor   Tran Dac Ha
Metadata        Verze   1.0

Resource  ../Resources/keywords.robot

# robot -d Results/TC05_zmena_poctu_zbozi_v_kosiku Tests/TC05_zmena_poctu_zbozi_v_kosiku.robot

Test Setup      Otevreni stranky Alza
Test Teardown   Zavreni stranky Alza

*** Test Cases ***
Zmena poctu zbozi v kosiku
    [Tags]  iterace-2
    Vyhledani zbozi  sluchatka
    Vlozeni prvniho vyhledaneho zbozi do kosiku
    Pokracovani do kosiku
    Pridani ks zbozi v kosiku   2
    Odebrani ks zbozi v kosiku  1