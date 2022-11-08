*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${name}           	Firstname Lastname
${email}          	testtraveller@test.com
${phone}          	0500-XXXXXX
${bank}           	FIXX XXXX XXX XXX XX
${identification}	Chosen identification
${route}          	Helsinki - Oulu
${departure}      	16:30
${url}            	https://www.matkahuolto.fi/nettilipun-peruutuslomake

*** Keywords ***
Open Form
    Open Browser    ${url}    Firefox

Fill Fields
    Input Text    xpath://input[@name="name"]    ${name}
    Input Text    xpath://input[@name="email"]    ${email}
    Input Text    xpath://input[@name="phoneNumber"]    ${phone}
    Input Text    xpath://input[@name="bankAccount"]    ${bank}
    Input Text    xpath://input[@name="identifier"]    ${identification}
    Input Text    xpath://input[@name="route"]    ${route}
    Input Text    xpath://input[@name="departureTime"]    ${departure}
