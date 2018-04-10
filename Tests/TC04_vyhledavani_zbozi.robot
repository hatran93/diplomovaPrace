*** Settings ***
Metadata        Autor   Tran Dac Ha
Metadata        Verze   1.0

Resource  ../Resources/keywords.robot

# robot -d Results/TC04_vyhledavani_zbozi Tests/TC04_vyhledavani_zbozi.robot

Test Setup      Otevreni stranky Alza
Test Teardown   Zavreni stranky Alza

*** Test Cases ***
Vyhledavani zbozi
    [Tags]  smoke
    Vyhledani zbozi  apple