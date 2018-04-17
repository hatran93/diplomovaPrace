*** Settings ***
Documentation   Test pro registraci a prihlaseni noveho uzivatele
...             Je doporuceno pri registraci zmenit pouze promennou ${email}
...             v souboru variables a inkrementovat hodnoty,
...             napr. robottest20@email.cz

Metadata        Autor   Tran Dac Ha
Metadata        Verze   1.0

Resource  ../Resources/common.robot
Resource  ../Resources/spravaUzivatele.robot

# robot -d Results/TS01_sprava_uzivatele Tests/TS01_sprava_uzivatele.robot

Test Setup      Otevreni stranky Alza
Test Teardown   Zavreni stranky Alza

*** Test Cases ***
TC 01 - Registrace noveho uzivatele
    [Tags]  iterace-1
    Kliknuti na prihlasit
    Kliknuti na Nova registrace
    Vlozeni povinnych udaju pri registraci    ${email}    ${heslo}    ${telefon}


TC 02 - Prihlaseni existujiciho uzivatele
    [Tags]  smoke   iterace-1
    Kliknuti na prihlasit
    Vlozeni prihlasovacich udaju    ${email}    ${heslo}