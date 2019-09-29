*** Settings ***
Library           SeleniumLibrary
Resource          Commonlyusedkeywords.txt
Library           ExcelLibrary

*** Test Cases ***
OpenBrowser
    Open Browser    https://facebook.com    Chrome
    Maximize Browser Window
    Sleep    2
    Input Text    css:#email    ngendigital
    Sleep    2
    Input Text    css:#pass    abcd
    Sleep    2
    Close Browser

AdvanceXpaths
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Click Element    xpath://input[@value='merc']/preceding-sibling::input[@value = 'bmw']
    Sleep    4
    [Teardown]    close browser

AdvanceCSSSelector
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Click Element    css:fieldset>select :nth-child(2)
    Sleep    4
    Close Browser

TextboxDemo
    Set Selenium Implicit Wait    5
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Page Should Contain Textfield    xpath://input[@name='FirstName']    It has failed    Warn
    Sleep    2
    Input Text    xpath://input[@name='FirstName']    NgenDigital
    Sleep    2
    Textfield Value Should Be    xpath://input[@name='FirstName']    NgenDigital
    Sleep    2
    Clear Element Text    xpath://input[@name='FirstName']
    Sleep    2
    [Teardown]    Close Browser

ButtonExample
    Open Browser    https://www.facebook.com/login.php?PARAMETERS&locale2=en_US    Chrome
    Maximize Browser Window
    Input Text    css:#email    demo
    Sleep    3
    Input Text    css:#pass    demo1
    Sleep    3
    Click Button    xpath://input[@value='loginbutton']
    [Teardown]    Close Browser

CheckboxDemo
    [Setup]
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Page Should Contain Checkbox    //input[@value='bmw']    Checkbox not found    Info
    Sleep    2
    Select Checkbox    //input[@value='bmw']
    Sleep    3
    Checkbox Should Be Selected    //input[@value='bmw']
    Sleep    3
    Unselect Checkbox    //input[@value='bmw']
    Sleep    3
    [Teardown]    Close Browser

ListElementDemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Sleep    2
    Page Should Contain List    css:#FromCity
    Sleep    2
    @{cities}    Get List Items    css:#FromCity
    : FOR    ${City}    IN    @{cities}
    \    LOG    ${City}
    Sleep    4
    List Selection Should Be    css:#FromCity    Toronto
    Sleep    2
    Select From List By Index    css:#FromCity    1
    Sleep    2
    Select From List    css:#FromCity    Chicago
    Sleep    2
    [Teardown]    Close Browser

RadiobuttonDemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Page Should Contain Radio Button    xpath://input[@value='flight']
    Sleep    2
    Select Radio Button    flight    flighthotel
    Sleep    2
    Radio Button Should Be Set To    flight    flighthotel
    Sleep    3
    [Teardown]    Close Browser

Imagedemo
    [Tags]    Tag
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Click Image    xpath://*[@id="header_stickynav16156"]/nav/div[2]/div[1]/div/a/img
    Sleep    3
    [Teardown]    Close Browser

Tableexample
    [Tags]    Tag
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-014
    Page Should Contain Element    xpath:/html/body/fieldset[7]/table    Table not found    INFO
    Table Should Contain    xpath:/html/body/fieldset[7]/table    Country
    Sleep    1
    Table Cell Should Contain    xpath:/html/body/fieldset[7]/table    2    3    Canada
    Sleep    2
    Table Column Should Contain    xpath:/html/body/fieldset[7]/table    1    Justin Trudeau
    Sleep    1
    Table Row Should Contain    xpath:/html/body/fieldset[7]/table    5    Chancellor
    ${textfield}    Get Text    xpath://tbody/tr[4]/td[1]
    Log To Console    ${textfield}
    Should Be Equal As Strings    ${textfield}    Theresa May
    Sleep    2
    [Teardown]    Close Browser

Flight Application
    Open Browser    https://ngendigital.com/demo-application    chrome
    Sleep    1
    Select Frame    id=iframe-014
    Wait Until Keyword Succeeds    1 min    5s    Login to flight application
    Sleep    2
    [Teardown]    Close Browser

NegativeTCAssignment
    Open Browser    https://ngendigital.com/demo-application    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    LoginInvalid
    Page Should Contain Element    xpath://*[@id="InvalidLogin"]
    ${testi}    Get Text    xpath://*[@id="InvalidLogin"]
    Log    ${testi}
