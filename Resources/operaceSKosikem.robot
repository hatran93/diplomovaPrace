*** Settings ***
Resource        variables.robot
Library         SeleniumLibrary
Library         String

*** Keywords ***
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