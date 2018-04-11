*** Settings ***
Documentation   Test pro registraci noveho uzivatele
...             Je doporuceno zmenit pouze promennou ${email}
...             v souboru variables a inkrementovat hondnoty,
...             napr. robottest20@email.cz

Metadata        Autor   Tran Dac Ha
Metadata        Verze   1.0

Resource  ../Resources/keywords.robot

# robot -d Results/TC01_registrace_noveho_uzivatele Tests/TC01_registrace_noveho_uzivatele.robot

Test Setup      Otevreni stranky Alza
Test Teardown   Zavreni stranky Alza

*** Test Cases ***
Registrace noveho uzivatele
    [Tags]  iterace-1
    Kliknuti na prihlasit
    Kliknuti na Nova registrace
    Vlozeni povinnych udaju pri registraci    ${email}    ${heslo}    ${telefon}