*** Settings ***
Library           SeleniumLibrary
Library           DateTime

*** Variables ***
${name}           	Firstname Lastname
${email}          	testtraveller@test.com
${phone}          	0500-XXXXXX
${identification}	Chosen identification
${route}          	Helsinki - Oulu 	
${departure}      	16:30
${url}            	https://www.matkahuolto.fi/nettilipun-peruutuslomake

*** Keywords ***
Open Form
    Open Browser    ${url}    Firefox
    Maximize Browser Window
    Wait Until Element Is Visible  //button[normalize-space()='Hyväksy vain välttämättömät']  timeout=5s
    Click Element   //button[normalize-space()='Hyväksy vain välttämättömät']

Fill Fields
    Input Text    xpath://input[@name="name"]    ${name}
    Input Text    xpath://input[@name="email"]    ${email}
    Input Text    xpath://input[@name="phoneNumber"]    ${phone}
    Input Text    xpath://input[@name="identifier"]    ${identification}
    Input Text    xpath://input[@name="route"]    ${route}
    Input Text    xpath://input[@name="travelDate"]    ${date}
    Input Text    xpath://input[@name="departureTime"]    ${departure}

Get Latest Date
    ${date} = 	Get Current Date    result_format=%d.%m.%Y
    Set Suite Variable    ${date}
