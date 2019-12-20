*** Settings ***
Suite Setup       Open Browser to Demosite
Suite Teardown    Close Browser
Resource          Resources/CommonResources.robot

*** Test Cases ***
TC01_Links page navigation
    Click Element    xpath://html/body/header/nav/div/ul/li[3]/a
    Check Navigation
    Go To    https://jmseppala.github.io/linkit.html

TC02_Links page header
    Check Header Elements

TC03_Links page links
    Page Should Contain Element    xpath://html/body/section/div[1]/h2
    Page Should Contain Element    xpath://html/body/section/div[2]/div/ul/li[1]
    Page Should Contain Element    xpath://html/body/section/div[2]/div/ul/li[2]
    Page Should Contain Element    xpath://html/body/section/div[2]/div/ul/li[3]
    Page Should Contain Element    xpath://html/body/section/div[2]/div/ul/li[4]
    Page Should Contain Element    xpath://html/body/section/div[2]/div/ul/li[5]
    Page Should Contain Element    xpath://html/body/section/div[2]/div/ul/li[6]
    Page Should Contain Element    xpath://html/body/section/div[2]/div/ul/li[1]/a
    Page Should Contain Element    xpath://html/body/section/div[2]/div/ul/li[2]/a
    Page Should Contain Element    xpath://html/body/section/div[2]/div/ul/li[3]/a
    Page Should Contain Element    xpath://html/body/section/div[2]/div/ul/li[4]/a
    Page Should Contain Element    xpath://html/body/section/div[2]/div/ul/li[5]/a
    Page Should Contain Element    xpath://html/body/section/div[2]/div/ul/li[6]/a
    Comment    Clickable links
    Wait Until Keyword Succeeds    4    1    Click Element    xpath://html/body/section/div[2]/div/ul/li[1]/a
    Wait Until Keyword Succeeds    4    1    Go Back
    Wait Until Keyword Succeeds    4    1    Click Element    xpath://html/body/section/div[2]/div/ul/li[2]/a
    Wait Until Keyword Succeeds    4    1    Go Back
    Wait Until Keyword Succeeds    4    1    Click Element    xpath://html/body/section/div[2]/div/ul/li[3]/a
    Wait Until Keyword Succeeds    4    1    Go Back
    Wait Until Keyword Succeeds    4    1    Click Element    xpath://html/body/section/div[2]/div/ul/li[4]/a
    Wait Until Keyword Succeeds    4    1    Go Back
    Wait Until Keyword Succeeds    4    1    Click Element    xpath://html/body/section/div[2]/div/ul/li[5]/a
    Wait Until Keyword Succeeds    4    1    Go Back
    Wait Until Keyword Succeeds    4    1    Click Element    xpath://html/body/section/div[2]/div/ul/li[6]/a
    Wait Until Keyword Succeeds    4    1    Go Back

TC04_Links page footer
    Comment    Scroll Element Into View    xpath://html/body/footer
    Check Footer
