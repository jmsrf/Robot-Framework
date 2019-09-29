*** Settings ***
Test Teardown
Library           SeleniumLibrary
Resource          Commonkeywords.txt
Resource          ExcelDataFetch.txt

*** Test Cases ***
TC01_Book a Flight - Round Trip between To and From Destinations_Verify 'From' cities
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    Login
    Change to iframe    id=iframe-115
    verifyafterlogin
    Validationonmanagebooking
    ValidateFromCity
    Logout

TC02_Book a Flight - Round Trip between to and From Destinations_Verify 'To' cities
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    Login
    Change to iframe    id=iframe-115
    verifyafterlogin
    Validationonmanagebooking
    ValidateToCity

TC03_Book a Flight - Round Trip between To and From Destinations_Verify 'Class'
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    Login
    Change to iframe    id=iframe-115
    verifyafterlogin
    Validationonmanagebooking
    Validateclass

TC04_Book a Flight - Verify Radio button should not be select by default
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    Login
    Change to iframe    id=iframe-115
    verifyafterlogin
    Validationonmanagebooking
    Radiobutton Validation

TC05_Book a Flight - One way Trip between To and From Destinations_From Toronto to Paris_Economy
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    Login
    Change to iframe    id=iframe-115
    verifyafterlogin
    Validationonmanagebooking
    Book firstfare flight

TC06 Newyork to Mumbai
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    Login
    Change to iframe    id=iframe-115
    verifyafterlogin
    Validationonmanagebooking
    Book economy

TC07-Businessclass
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    Login
    Change to iframe    id=iframe-115
    verifyafterlogin
    Validationonmanagebooking
    Book business

TC08-Select either Flight/Hotel
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    Login
    Change to iframe    id=iframe-115
    verifyafterlogin
    Validationonmanagebooking
    Click Element    xpath://button[contains(text(),'Get Fare')]
    Wait Until Keyword Succeeds    2    1    Page Should Contain    Please choose one of Flight or Flight + Hotel

FlightAssignment
    Loginandnavigatetourl
    Change to iframe    id=iframe-014
    Login
    Change to iframe    id=iframe-115
    Click Button    xpath://button[contains(text(),'Search Flights')]
    Input Text    xpath://input[@id='FlightNo']    DA935
    Click Button    xpath://button[.//text() = 'Search']
    Table Should Contain    xpath://table[@id='statusTable']    Toronto(YYZ) to London(LHR) Terminal Scheduled Departed
    Table Cell Should Contain    xpath://table[@id='statusTable']    2    4    On time
