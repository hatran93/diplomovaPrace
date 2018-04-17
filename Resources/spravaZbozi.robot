*** Settings ***
Resource        variables.robot
Library         SeleniumLibrary
Library         String

*** Keywords ***
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