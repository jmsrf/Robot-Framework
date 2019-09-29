*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary
Resource          Userdefinedkeywords.txt    # This is my first resource file

*** Variables ***
${var1}           4    # This is my first scalar variable
${var2}           4    # This is my 2nd variable
@{USER}           Bharat    Robotframework
&{Credentials}    username=bharat    password=bharat
@{cities}
${City}           ${EMPTY}
${textfield}      ${EMPTY}
${testi}          ${EMPTY}
${num12}          ${EMPTY}

*** Test Cases ***
TC01
    [Documentation]    This is my first test case. It is used to compare two variables.
    ...    *Testcase01* _This will be in italic_
    ...    Link is http://www.google.com
    Should Be Equal    ${var1}    ${var2}
    \    ${var400}

TC02
    [Tags]    LOGIN
    [Setup]    SetupDemo
    Should Not Be Equal As Strings    @{USER}[0]    @{USER}[1]
    [Teardown]    Teardowndemo

TC03
    Should Be Equal As Strings    &{Credentials}[username]    &{Credentials}[password]

TC04
    [Tags]    LOGIN
    Should Be True    4    4

TC05
    [Setup]
    [Template]    Should Be Equal As Integers    # This is a template
    [Timeout]    2 minutes 20 seconds    # This is my test timeout
    4    4
    6    6
    8    8
    12    12

TC06
    Comparetwovariables

Assign Id to Element
    Set Selenium Speed    0.5
    Open Browser    https://ngendigital.com/practice    chrome
    Select Frame    id=iframe-014
    Assign Id To Element    xpath://tbody/tr[4]/td[3]    pm
    ${num12}    Get Text    pm
    Log    ${num12}
    Capture Page Screenshot
    [Teardown]    Close Browser

Miscellaneous 1
    Set Selenium Speed    0.5
    Open Browser    https://ngendigital.com/practice    chrome
    Select Frame    id=iframe-014
    Current Frame Should Contain    Select Example
    Element Attribute Value Should Be    xpath://input[@value='bmw']    name    car
    [Teardown]    Close Browser

Disabled Element
    Set Selenium Speed    0.5
    Open Browser    https://www.cineplex.com    chrome
    Maximize Browser Window
    Element Should Be Disabled    xpath://div[@class='selectize-input items not-full disabled locked']//input[@title='Type or Select Movie']
    [Teardown]    Close Browser

Count Elements
    Set Selenium Speed    0.5
    Open Browser    https://www.ngendigital.com/practice    chrome
    Select Frame    id=iframe-014
    ${var1}    Get Element Count    //input[@name='car']
    Should Be True    ${var1}==3
    [Teardown]    Close Browser

Go back
    Open Browser    https://www.ngendigital.com/practice
    Sleep    2
    Go To    https://www.cineplex.com/

URL Verify
    Open Browser    https://ngendigital.com/    Chrome
    Location Should Be    https://ngendigital.com/    it is not the same url
    Close Browser
    Open Browser    https://www.gmail.com/    Chrome
    Log Location
    Log Source
    Log Title
    Close Browser

*** Keywords ***
SetupDemo
    Log To Console    This is Setup method

Teardowndemo
    Log To Console    This is teardown
