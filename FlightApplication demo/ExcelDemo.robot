*** Settings ***
Library           ExcelLibrary
Library           SeleniumLibrary
Resource          Commonlyusedkeywords.txt

*** Variables ***
${Count}          ${EMPTY}
@{Count1}
${VAR1}           ${EMPTY}

*** Test Cases ***
ReadExcelDemo
    Open Excel    /home/m9022/Työpöytä/Robot_projects/Robot-Projects/Demo/Demo.xls
    Check Cell Type    Taulukko1    2    1
    ${Count}    Get Column Count    Taulukko1
    @{Count1}    Get Column Values    Taulukko1    2
    : FOR    ${VAR1}    IN    @{Count1}
    \    LOG    ${VAR1}
    ${Count}    Get Sheet Names
    ${VAR1}    Read Cell Data By Coordinates    Taulukko1    1    1
    ${Count}    Read Cell Data By Name    Taulukko1    E2

ExcelTC01
    Open Excel    /home/m9022/Työpöytä/Robot_projects/Robot-Projects/Demo/Demo.xls
    Put Number To Cell    sample123    1    0    10
    Save Excel    Demo2.xls

ExcelAssignment7_spreadsheet_flag
    Open Excel    /home/m9022/Työpöytä/Robot_projects/Robot-Projects/Demo/Assignment.xls
    ${rowCount}    Get Row Count    Taulukko1
    Log to Console    ${rowCount}
    : FOR    ${x}    IN RANGE    1    ${rowCount}
    \    ${runValue}    Read Cell Data By Coordinates    Taulukko1    1    ${x}
    \    Log to Console    ${runValue}
    \    Log to Console    ${x}
    \    Run Keyword If    "${runValue}"=="Y"    Log to Console    Executing the test

ExcelAssignment8_invalid_credentials_comparing
    Open Browser    https://ngendigital.com/demo-application    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-014
    LoginInvalid
    Page Should Contain Element    xpath://*[@id="InvalidLogin"]
    ${testi}    Get Text    xpath://*[@id="InvalidLogin"]
    Log    ${testi}
    ${error}    Read Cell Data By Coordinates    Login    3    4
    Log    ${error}
    Should Be Equal As Strings    ${error}    ${testi}
