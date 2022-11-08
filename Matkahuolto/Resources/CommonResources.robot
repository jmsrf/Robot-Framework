*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${name}           	Etunimi Sukunimi
${phone}          	0400-XXXXXX
${route}          	Helsinki - Oulu
${departure}      	16:30
${identification}	Chosen identification
${tili}           	FIXX XXXX XXX XXX XX
${email}          	testimatkustaja@test.com
${url}            	https://www.matkahuolto.fi/nettilipun-peruutuslomake

*** Keywords ***
Open Form
    Open Browser    ${url}    Firefox

Fill Fields
    Input Text    xpath://input[@name="name"]    ${nimi}
    Input Text    xpath://input[@name="email"]    ${email}
    Input Text    xpath://input[@name="phoneNumber"]    ${puh}
    Input Text    xpath://input[@name="bankAccount"]    ${tili}
    Input Text    xpath://input[@name="identifier"]    ${tunniste}
    Input Text    xpath://input[@name="route"]    ${reitti}
    Input Text    xpath://input[@name="departureTime"]    ${lahto}
