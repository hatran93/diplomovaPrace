*** Settings ***
Resource        variables.robot
Library         Selenium2Library

*** Keywords ***
Otevreni stranky Alza
    open browser        ${URL}    ${BROWSER}
    ${titulek}=         get title
    should be equal     ${titulek}     Alza.cz - největší obchod s počítači a elektronikou | Alza.cz

Zavreni stranky Alza
    close all browsers

Kliknuti na prihlasit
    click element       ${prihlasitOdkaz}
    wait until element is visible   ${prihlasovaciOkno}

Kliknuti na Nova registrace
    click element       ${novaRegistraceOdkaz}
    ${aktualniURL}=     get location
    should be equal     ${aktualniURL}   https://www.alza.cz/Registration.htm
    #wait until element is visible        ${emailRegistrace}

Vlozeni povinnych udaju pri registraci
    [Arguments]      ${email}    ${heslo}    ${telefon}
    input text       ${emailRegistrace}            ${email}
    input password   ${hesloRegistrace}            ${heslo}
    input password   ${potvrzeniHeslaRegistrace}   ${heslo}
    input text       ${telefonRegistrace}          ${telefon}
    click element    ${ulozitRegistraci}
    Zkontrolovani ze je uzivatel prihlasen         ${email}

Zkontrolovani ze je uzivatel prihlasen
    [Arguments]  ${email}
    ${textMojeAlza}=   get text  ${mojeAlza}
    should end with    ${textMojeAlza}   ${email}

Vlozeni prihlasovacich udaju
    [Arguments]       ${email}    ${heslo}
    input text        ${emailPrihlasovani}    ${email}
    input password    ${hesloPrihlasovani}    ${heslo}
    click element     ${tlacitkoPrihlasit}
    wait until element is not visible         ${tlacitkoPrihlasit}
    Zkontrolovani ze je uzivatel prihlasen    ${email}

Vyhledani zbozi
    [Arguments]     ${nazevZbozi}
    input text      ${vyhledavaciPole}   ${nazevZbozi}
    click element   ${tlacitkoHledat}
    Zkontrolovani spravnosti vysledku vyhledavani   ${nazevZbozi}

Zkontrolovani spravnosti vysledku vyhledavani
    [Arguments]     ${nazevZbozi}
    ${vyhledanyRetezec}=    get text  //div[@id='h1c']/h1
    should end with     ${vyhledanyRetezec}     ${nazevZbozi}   ignore_case=True

