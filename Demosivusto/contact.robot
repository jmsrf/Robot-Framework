*** Settings ***
Suite Setup       Open Browser to Demosite
Suite Teardown    Close Browser
Resource          Resources/CommonResources.robot

*** Test Cases ***
TC01_Contact page navigation
    Click Element    xpath://html/body/header/nav/div/ul/li[3]/a
    Check Navigation
    Go To    https://jmseppala.github.io/yhteystiedot.html

TC02_Contact page header
    Check Header Elements

TC03_Contact page texts
    Page Should Contain Element    xpath://html/body/section/div[1]/h2
    Page Should Contain Element    xpath://html/body/section/div[2]/div[1]
    Page Should Contain Element    xpath://html/body/section/div[2]/div[2]
    Page Should Contain Element    xpath://html/body/section/div[2]/div[3]
    Page Should Contain Element    xpath://html/body/section/div[2]/div[1]/h3
    Page Should Contain Element    xpath://html/body/section/div[2]/div[2]/h3
    Page Should Contain Element    xpath://html/body/section/div[2]/div[3]/h3
    Page Should Contain Element    xpath://html/body/section/div[2]/div[1]/p
    Page Should Contain Element    xpath://html/body/section/div[2]/div[2]/p
    Page Should Contain Element    xpath://html/body/section/div[2]/div[3]/p

TC04_Contact page footer
    Check Footer
