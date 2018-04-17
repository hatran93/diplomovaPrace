*** Settings ***
Documentation   Testy pro operace s kosikem - zmena poctu zbozi a odebrani zbozi
Metadata        Autor   Tran Dac Ha
Metadata        Verze   1.0

Resource  ../Resources/common.robot
Resource  ../Resources/operaceSKosikem.robot
Resource  ../Resources/spravaZbozi.robot

# robot -d Results/TS03_operace_s_kosikem Tests/TS03_operace_s_kosikem.robot

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

Odebrani zbozi z kosiku
    [Tags]  iterace-2
    Vyhledani zbozi  sluchatka
    Vlozeni prvniho vyhledaneho zbozi do kosiku
    Pokracovani do kosiku
    Kliknuti na odebrani zbozi z kosiku