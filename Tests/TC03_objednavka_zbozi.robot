*** Settings ***
Metadata        Autor   Tran Dac Ha
Metadata        Verze   1.0

Resource  ../Resources/keywords.robot

# robot -d Results/TC03_objednavka_zbozi Tests/TC03_objednavka_zbozi.robot

Test Setup      Otevreni stranky Alza
Test Teardown   Zavreni stranky Alza

*** Test Cases ***
Objednavka zbozi
    Kliknuti na prihlasit
    Vlozeni prihlasovacich udaju    ${email}    ${heslo}

*** Variables ***
${email}    robottest@email.cz
${heslo}    RFtest1234