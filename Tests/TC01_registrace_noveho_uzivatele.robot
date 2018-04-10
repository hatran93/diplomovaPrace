*** Settings ***
Documentation   Test pro registraci noveho uzivatele
...             Je potreba validnich udaju

Metadata        Autor   Tran Dac Ha
Metadata        Verze   1.0

Resource  ../Resources/keywords.robot

# robot -d Results/TC01_registrace_noveho_uzivatele Tests/TC01_registrace_noveho_uzivatele.robot

Test Setup      Otevreni stranky Alza
Test Teardown   Zavreni stranky Alza


*** Test Cases ***
Registrace noveho uzivatele
    Kliknuti na prihlasit
    Kliknuti na Nova registrace
    Vlozeni povinnych udaju pri registraci    ${email}    ${heslo}    ${telefon}

*** Variables ***
${email}        robottest5@email.cz
${heslo}        RFtest1234
${telefon}      123456789

