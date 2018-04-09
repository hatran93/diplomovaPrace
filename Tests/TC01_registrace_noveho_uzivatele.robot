*** Settings ***
Documentation   Test pro registraci noveho uzivatele
...             Je potreba validnich udaju

Metadata        Autor   Tran Dac Ha
Metadata        Verze   1.0

Resource  ../Resources/keywords.robot

# robot -d Results/TC01_registrace_noveho_uzivatele Tests/TC01_registrace_noveho_uzivatele.robot

*** Test Cases ***
Registrace noveho uzivatele
    otevreni alza
