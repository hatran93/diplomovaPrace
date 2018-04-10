*** Variables ***
${BROWSER}                          chrome
${URL}                              https://www.alza.cz/
${prihlasitOdkaz}                   id=lblLogin
${prihlasovaciOkno}                 //div[@id='alzaDialog']
${novaRegistraceOdkaz}              //div[@id='alzaDialog']//a[@class='reg']
${emailRegistrace}                  id=edth1EmailLogin
${hesloRegistrace}                  id=edth1Password
${potvrzeniHeslaRegistrace}         id=edth1PasswordConfirm
${telefonRegistrace}                id=edth2Phone
${ulozitRegistraci}                 //div[@class='obuttons inner']/a
${mojeAlza}                         //span[@id='topbar']//a[@id='lblUser']
${emailPrihlasovani}                id=i_name
${hesloPrihlasovani}                id=i_psw
${tlacitkoPrihlasit}                id=btnLogin
${vyhledavaciPole}                  id=edtSearch
${tlacitkoHledat}                   id=btnSearch