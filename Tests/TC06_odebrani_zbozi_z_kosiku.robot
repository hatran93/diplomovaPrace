*** Settings ***
Metadata        Autor   Tran Dac Ha
Metadata        Verze   1.0

Resource  ../Resources/keywords.robot

# robot -d Results/TC06_odebrani_zbozi_z_kosiku Tests/TC06_odebrani_zbozi_z_kosiku.robot

Test Setup      Otevreni stranky Alza
Test Teardown   Zavreni stranky Alza

*** Test Cases ***
Odebrani zbozi z kosiku
    [Tags]  iterace-2
    Vyhledani zbozi  sluchatka
    Vlozeni prvniho vyhledaneho zbozi do kosiku
    Pokracovani do kosiku
    Kliknuti na odebrani zbozi z kosiku