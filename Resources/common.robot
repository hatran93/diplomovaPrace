*** Settings ***
Resource        variables.robot
Library         SeleniumLibrary

*** Keywords ***
Otevreni stranky Alza
    open browser        ${URL}    ${BROWSER}
    ${titulek}=         get title
    should be equal     ${titulek}     Alza.cz - největší obchod s počítači a elektronikou | Alza.cz

Zavreni stranky Alza
    close all browsers