*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://jmseppala.github.io/index.html
${demotext}       ${EMPTY}
${authortext}     ${EMPTY}

*** Keywords ***
Open Browser to Demosite
    Open Browser    ${URL}    Chrome
    Maximize Browser Window

Check Navigation
    [Documentation]    Check navigation
    Wait Until Keyword Succeeds    2    1    Page Should Contain Element    xpath://html/body/header/nav/div/ul/li[1]/a
    Wait Until Keyword Succeeds    2    1    Page Should Contain Element    xpath://html/body/header/nav/div/ul/li[2]/a
    Wait Until Keyword Succeeds    2    1    Page Should Contain Element    xpath://html/body/header/nav/div/ul/li[3]/a
    Wait Until Keyword Succeeds    2    1    Page Should Contain Element    xpath://html/body/header/nav/div/ul/li[4]/a
    Click Element    xpath://html/body/header/nav/div/ul/li[1]/a
    Go Back
    Click Element    xpath://html/body/header/nav/div/ul/li[2]/a
    Go Back
    Click Element    xpath://html/body/header/nav/div/ul/li[3]/a
    Go Back
    Click Element    xpath://html/body/header/nav/div/ul/li[4]/a
    Go Back

Check Header Elements
    Page Should Contain Element    xpath://html/body/header
    Page Should Contain Element    xpath://html/body/header/div
    Page Should Contain Element    xpath://html/body/header/div/h1

Check Footer
    Comment    Scroll Element Into View    xpath://html/body/footer
    Page Should Contain Element    xpath://html/body/footer
    Page Should Contain Element    xpath://html/body/footer/div[2]/p
    Page Should Contain Element    xpath://html/body/footer/div[1]/div/ul/li[1]/a
    Page Should Contain Element    xpath://html/body/footer/div[1]/div/ul/li[2]/a
    Page Should Contain Element    xpath://html/body/footer/div[1]/div/ul/li[3]/a
    Page Should Contain Element    xpath://html/body/footer/div[1]/div/ul/li[1]/a/i
    Page Should Contain Element    xpath://html/body/footer/div[1]/div/ul/li[2]/a/i
    Page Should Contain Element    xpath://html/body/footer/div[1]/div/ul/li[3]/a/i
    Wait Until Keyword Succeeds    2    1    Click Element    xpath://html/body/footer/div[1]/div/ul/li[1]/a
    Wait Until Keyword Succeeds    2    1    Go Back
    Wait Until Keyword Succeeds    2    1    Click Element    xpath://html/body/footer/div[1]/div/ul/li[2]/a
    Wait Until Keyword Succeeds    2    1    Go Back
    Wait Until Keyword Succeeds    2    1    Click Element    xpath://html/body/footer/div[1]/div/ul/li[3]/a
    Wait Until Keyword Succeeds    2    1    Go Back
