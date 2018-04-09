*** Settings ***
Resource        variables.robot
Library         SeleniumLibrary

*** Keywords ***
Otevreni Alza
    open browser     ${url}   ${browser}

