*** Settings ***
Suite Setup       Open Browser to Demosite
Suite Teardown    Close Browser
Resource          Resources/CommonResources.robot

*** Test Cases ***
TC01_Aboutme page navigation
    Click Element    xpath://html/body/header/nav/div/ul/li[2]/a
    Check Navigation
    Go To    https://jmseppala.github.io/mina.html
    Page Should Contain Element    xpath://html/body/div/div[1]
    Page Should Contain Element    xpath://html/body/div/div[2]
    Page Should Contain Element    xpath://html/body/div/div[3]
    Page Should Contain Element    xpath://html/body/div/div[1]/h3
    Page Should Contain Element    xpath://html/body/div/div[2]/h3
    Page Should Contain Element    xpath://html/body/div/div[3]/h3
    Page Should Contain Element    xpath://html/body/div/div[1]/p
    Page Should Contain Element    xpath://html/body/div/div[2]/p
    Page Should Contain Element    xpath://html/body/div/div[3]/p

TC02_Aboutme page header
    Check Header Elements

TC03_Aboutme page footer
    Check Footer
