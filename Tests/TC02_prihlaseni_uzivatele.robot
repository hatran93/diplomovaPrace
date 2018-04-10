*** Settings ***
Metadata        Autor   Tran Dac Ha
Metadata        Verze   1.0

Resource  ../Resources/keywords.robot

# robot -d Results/TC02_prihlaseni_uzivatele Tests/TC02_prihlaseni_uzivatele.robot

Test Setup      Otevreni stranky Alza
Test Teardown   Zavreni stranky Alza

*** Test Cases ***
Prihlaseni existujiciho uzivatele
    Kliknuti na prihlasit
    Vlozeni prihlasovacich udaju    ${email}    ${heslo}

*** Variables ***
${email}    robottest@email.cz
${heslo}    RFtest1234