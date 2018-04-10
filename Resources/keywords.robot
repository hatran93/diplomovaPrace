*** Settings ***
Resource        variables.robot
Library         SeleniumLibrary
Library         String

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
    wait until element is not visible         ${prihlasovaciOkno}
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

Vlozeni prvniho vyhledaneho zbozi do kosiku
    click element   ${tlacitkoKoupit}

Pokracovani do kosiku
    click element  ${tlacitkoJitDoKosiku}

Pokracovani na vyber dopravy
    click element  ${btnPokracovatVyberDopravy}
    wait until element is visible  ${zpusobyDopravy}

Vybrani zpusobu dopravy
    [Arguments]  ${nazevDopravy}
    Zobrazeni vsech zpusobu dopravy
    wait until element is visible   ${zpusobyDopravy}//div[contains(text(),'${nazevDopravy}')]
    click element   ${zpusobyDopravy}//div[contains(text(),'${nazevDopravy}')]
    wait until element is visible   ${btnPotvrzeniVyberuDopravy}
    click element                   ${btnPotvrzeniVyberuDopravy}
    wait until element is visible   ${seznamPlateb}

Zobrazeni vsech zpusobu dopravy
    ${pocetDoprav}=   get element count  ${zpusobyDopravy}
    run keyword if    ${pocetDoprav}==1     click element   ${zmenaDopravy}
    run keyword if    ${pocetDoprav}==1     wait until element is visible   ${seznamDoprav}

Vybrani zpusobu platby
    [Arguments]  ${typPlatby}
    wait until element is visible  ${seznamPlateb}//span[@class='paymentLabel' and contains(text(),'${typPlatby}')]
    click element  ${seznamPlateb}//span[@class='paymentLabel' and contains(text(),'${typPlatby}')]
    wait until page does not contain element  ${seznamPlateb}

Pokracovani na dodaci udaje
    click element      ${btnPokracovatDodaciUdaje}
    Zkontrolovani spravnych dodacich udaju

Zkontrolovani spravnych dodacich udaju
    wait until element is visible      //input[@id='phone']
    ${kontaktniTelefon}=    get value  //input[@id='phone']
    ${kontaktniEmail}=      get value  //input[@id='contactEmail']
    ${kontaktniTelefon}=    replace string  ${kontaktniTelefon}  ${SPACE}  ${EMPTY}
    should be equal    ${kontaktniTelefon}  ${telefon}
    should be equal    ${kontaktniEmail}    ${email}

Dokonceni objednavky
    click element   ${btnDokonceniObjednavky}
    wait until element is visible   ${uspesnaObjednavka}

Pridani ks zbozi v kosiku
    [Arguments]  ${pocetPridanychKs}
    repeat keyword  ${pocetPridanychKs}times  click element   ${pridaniKsZbozi}
    Zkontrolovani spravneho mnozstvi  ${pocetPridanychKs}
    Zkontrolovani spravne ceny

Odebrani ks zbozi v kosiku
    [Arguments]  ${pocetOdebranychKs}
    repeat keyword  ${pocetOdebranychKs}times  click element   ${odebraniKsZbozi}
    Zkontrolovani spravne ceny

Zkontrolovani spravneho mnozstvi
    [Arguments]  ${pocetKs}
    ${aktualniMnozstvi}=  get value  ${mnozstviKsVKosiku}
    ${pocetKs}=           evaluate   ${pocetKs}+1
    ${aktualniMnozstvi}=  convert to integer   ${aktualniMnozstvi}
    ${pocetKs}=           convert to integer   ${pocetKs}
    should be equal       ${aktualniMnozstvi}  ${pocetKs}

Zkontrolovani spravne ceny
    ${aktualniMnozstvi}=  get value  ${mnozstviKsVKosiku}

    ${cenaZaKus}=         get text    //td[@class='c4']
    ${cenaZaKus}=         replace string  ${cenaZaKus}  Kč / ks   ${EMPTY}
    ${cenaZaKus}=         replace string  ${cenaZaKus}  ${SPACE}  ${EMPTY}
    ${cenaZaKus}=         convert to integer  ${cenaZaKus}
    ${spocitanaCena}=     evaluate  ${cenaZaKus}*${aktualniMnozstvi}

    ${celkovaCena}=       get text    //td[@class='c5']
    ${celkovaCena}=       replace string  ${celkovaCena}  Kč        ${EMPTY}
    ${celkovaCena}=       replace string  ${celkovaCena}  ${SPACE}  ${EMPTY}
    ${celkovaCena}=       convert to integer  ${celkovaCena}

    should be equal       ${spocitanaCena}   ${celkovaCena}

Kliknuti na odebrani zbozi z kosiku
    click element   ${odebraniZbozi}
    wait until element is visible   ${prazdnyKosik}