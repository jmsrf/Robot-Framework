*** Settings ***
Library           Selenium2Library
Library           DateTime


*** Keywords ***
Open Browser to URL
    Comment    Open VR.fi
    Open Browser    https://www.vr.fi    Firefox
    Maximize Browser Window

Check Cookies
    Wait Until Element Is Visible  //button[normalize-space()='Jatka välttämättömillä']  timeout=5s
    Click Element   //button[normalize-space()='Jatka välttämättömillä']
    
Select Route
    # From station
    Click Element      //*[@id="from-station-picker"] 
    Input Text    xpath://input[@id="station-search"]   Helsinki
    Wait Until Page Contains Element    xpath://*[@id="stationPickerOption_0"]
    Click Element    xpath://*[@id="stationPickerOption_0"]

    # To station
    Click Element     //*[@id="to-station-picker"]
    Input Text    xpath://input[@id="station-search"]   Oulu
    Wait Until Page Contains Element    xpath://*[@id="stationPickerOption_0"]
    Click Element    xpath://*[@id="stationPickerOption_0"]

    # Search trips and scroll to end of page where button "Next day" is located
    Click Element   //button[normalize-space()='Hae matkoja']
    Sleep  1
    Execute JavaScript    window.scrollTo(0,document.body.scrollHeight)

Navigate To Friday
    Comment    Get current date as a day name and put it to ${CurrentDay} variable
    ${CURRENT_DAY}=    Get Current Date    result_format=%A
    Log to console    ${CURRENT_DAY}
    #Comment    Run a keyword containing right amout of next day-clicks based on what day it is today
        IF    '${CURRENT_DAY}' == 'Saturday'    
            Six Clicks
        ELSE IF    '${CURRENT_DAY}' == 'Sunday'
            Repeat Keyword    5 times    Click Element   //button[normalize-space()='Seuraa­va päivä']
        ELSE IF    '${CURRENT_DAY}' == 'Monday'
            Repeat Keyword    4 times    Click Element   //button[normalize-space()='Seuraa­va päivä']
        ELSE IF    '${CURRENT_DAY}' == 'Tuesday'
            Repeat Keyword    3 times    Click Element   //button[normalize-space()='Seuraa­va päivä']
        ELSE IF    '${CURRENT_DAY}' == 'Wednesday'
            Repeat Keyword    2 times    Click Element   //button[normalize-space()='Seuraa­va päivä']
        ELSE IF    '${CURRENT_DAY}' == 'Thursday'
            Repeat Keyword    Click Element   //button[normalize-space()='Seuraa­va päivä']
        ELSE IF    '${CURRENT_DAY}' == 'Friday'
            Log to console    Today is Friday
        END

