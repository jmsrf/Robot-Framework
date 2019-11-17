*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${nimi}           Etunimi Sukunimi
${puh}            0400-261272
${reitti}         Alajärvi - Jyväskylä Matkakeskus
${lahto}          16:30
${tunniste}       Valittu tunniste
${tili}           FI12 3456 789 9876 54
${email}          testimatkustaja@test.com
${url}            https://www.matkahuolto.fi/nettilipun-peruutuslomake

*** Keywords ***
Avaa Lomake
    Open Browser    ${url}    Firefox

Tayta Kentat
    Input Text    xpath://input[@name="name"]    ${nimi}
    Input Text    xpath://input[@name="email"]    ${email}
    Input Text    xpath://input[@name="phoneNumber"]    ${puh}
    Input Text    xpath://input[@name="bankAccount"]    ${tili}
    Input Text    xpath://input[@name="identifier"]    ${tunniste}
    Input Text    xpath://input[@name="route"]    ${reitti}
    Input Text    xpath://input[@name="departureTime"]    ${lahto}
