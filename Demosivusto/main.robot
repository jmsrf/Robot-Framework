*** Settings ***
Suite Setup       Open Browser to Demosite
Suite Teardown    Close Browser
Resource          Resources/CommonResources.robot

*** Test Cases ***
TC01_Main page navigation
    Check Navigation

TC02_Main page header texts
    Check Header Elements

TC03_Main page hobbies section
    Scroll Element Into View    xpath://*[@id="features"]/div[1]/h2
    Page Should Contain Element    xpath://*[@id="features"]/div[1]/h2
    Page Should Contain Element    xpath://*[@id="features"]/div[1]/p
    Scroll Element Into View    xpath://*[@id="features"]/div[2]/div[1]/i
    Page Should Contain Element    xpath://*[@id="features"]/div[2]/div[1]/i
    Page Should Contain Element    xpath://*[@id="features"]/div[2]/div[2]/i
    Page Should Contain Element    xpath://*[@id="features"]/div[2]/div[3]/i
    Page Should Contain Element    xpath://*[@id="features"]/div[2]/div[4]/i
    Page Should Contain Element    xpath://*[@id="features"]/div[2]/div[1]/h3
    Page Should Contain Element    xpath://*[@id="features"]/div[2]/div[2]/h3
    Page Should Contain Element    xpath://*[@id="features"]/div[2]/div[3]/h3
    Page Should Contain Element    xpath://*[@id="features"]/div[2]/div[4]/h3
    Page Should Contain Element    xpath://*[@id="features"]/div[2]/div[1]/p
    Page Should Contain Element    xpath://*[@id="features"]/div[2]/div[2]/p
    Page Should Contain Element    xpath://*[@id="features"]/div[2]/div[3]/p
    Page Should Contain Element    xpath://*[@id="features"]/div[2]/div[4]/p

TC04_Main page fishing section
    Page Should Contain Element    xpath://html/body/section[2]/ul[1]/li[1]/figure/img
    Mouse Over    xpath://html/body/section[2]/ul[1]/li[1]/figure/img
    Page Should Contain Element    xpath://html/body/section[2]/ul[1]/li[2]/figure/img
    Mouse Over    xpath://html/body/section[2]/ul[1]/li[2]/figure/img
    Page Should Contain Element    xpath://html/body/section[2]/ul[1]/li[3]/figure/img
    Mouse Over    xpath://html/body/section[2]/ul[1]/li[3]/figure/img
    Page Should Contain Element    xpath://html/body/section[2]/ul[1]/li[4]/figure/img
    Mouse Over    xpath://html/body/section[2]/ul[1]/li[4]/figure/img
    Page Should Contain Element    xpath://html/body/section[2]/ul[2]/li[1]/figure/img
    Mouse Over    xpath://html/body/section[2]/ul[2]/li[1]/figure/img
    Page Should Contain Element    xpath://html/body/section[2]/ul[2]/li[2]/figure/img
    Mouse Over    xpath://html/body/section[2]/ul[2]/li[2]/figure/img
    Page Should Contain Element    xpath://html/body/section[2]/ul[2]/li[3]/figure/img
    Mouse Over    xpath://html/body/section[2]/ul[2]/li[3]/figure/img
    Page Should Contain Element    xpath://html/body/section[2]/ul[2]/li[4]/figure/img
    Mouse Over    xpath://html/body/section[2]/ul[2]/li[4]/figure/img

TC05_Main page places section
    Scroll Element Into View    xpath://html/body/section[2]/ul[2]/li[4]/figure/img
    Page Should Contain Element    xpath://html/body/section[2]/ul[2]/li[4]/figure/img
    Scroll Element Into View    xpath://*[@id="places"]/div[2]/div[1]/img
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[1]/img
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[2]/img
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[3]/img
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[4]/img
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[1]/h3
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[2]/h3
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[3]/h3
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[4]/h3
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[1]/div[1]
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[2]/div[1]
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[3]/div[1]
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[4]/div[1]
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[1]/div[2]/a
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[2]/div[2]/a
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[3]/div[2]/a
    Page Should Contain Element    xpath://*[@id="places"]/div[2]/div[4]/div[2]/a
    Wait Until Keyword Succeeds    4    1    Click Element    xpath://*[@id="places"]/div[2]/div[1]/div[2]/a
    Wait Until Keyword Succeeds    4    1    Go Back
    Wait Until Keyword Succeeds    4    1    Click Element    xpath://*[@id="places"]/div[2]/div[2]/div[2]/a
    Wait Until Keyword Succeeds    4    1    Go Back
    Wait Until Keyword Succeeds    4    1    Click Element    xpath://*[@id="places"]/div[2]/div[3]/div[2]/a
    Wait Until Keyword Succeeds    4    1    Go Back
    Wait Until Keyword Succeeds    4    1    Click Element    xpath://*[@id="places"]/div[2]/div[4]/div[2]/a
    Wait Until Keyword Succeeds    4    1    Go Back

TC06_Main page technologies
    Scroll Element Into View    xpath://*[@id="technologies"]/div[1]/h2
    Page Should Contain Element    xpath://*[@id="technologies"]/div[1]/h2
    Scroll Element Into View    xpath://*[@id="technologies"]/div[2]/div[1]/div/div[1]/h3
    Page Should Contain Element    xpath://*[@id="technologies"]/div[2]/div[1]/div/div[1]/h3
    Page Should Contain Element    xpath://*[@id="technologies"]/div[2]/div[2]/div/div[1]/h3
    Page Should Contain Element    xpath://*[@id="technologies"]/div[2]/div[3]/div/div[1]/h3
    Page Should Contain Element    xpath://*[@id="technologies"]/div[2]/div[1]/div/div[2]/ul/li[1]
    Page Should Contain Element    xpath://*[@id="technologies"]/div[2]/div[1]/div/div[2]/ul/li[2]
    Page Should Contain Element    xpath://*[@id="technologies"]/div[2]/div[1]/div/div[2]/ul/li[3]
    Page Should Contain Element    xpath://*[@id="technologies"]/div[2]/div[1]/div/div[2]/ul/li[4]
    Page Should Contain Element    xpath://*[@id="technologies"]/div[2]/div[2]/div/div[2]/ul/li[1]
    Page Should Contain Element    xpath://*[@id="technologies"]/div[2]/div[2]/div/div[2]/ul/li[2]
    Page Should Contain Element    xpath://*[@id="technologies"]/div[2]/div[2]/div/div[2]/ul/li[3]
    Page Should Contain Element    xpath://*[@id="technologies"]/div[2]/div[2]/div/div[2]/ul/li[4]

TC07_Main page footer
    Check Footer
