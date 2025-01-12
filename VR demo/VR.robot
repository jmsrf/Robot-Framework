*** Settings ***
Library           Selenium2Library
Library           DateTime

*** Tasks ***
Search_Friday
    [Documentation]    *Idea:*
    ...    The idea with this Robot Framework-task is to first navigate to VR.fi-page, search for train tickets to Helsinki - Oulu route and then navigate to Friday's trips which would be the actual day of the week for the train trip in this example. "Tasks" is used here instead of "Test Cases" so this is basically RPA (Robot Process Automation) as idea for this would be to automatically show next Friday's trips for user instead of actually testing VR.fi-site.
    ...
    ...    *How this works:*
    ...    After landing to VR.fi main page first station that the trip is started from and also destination station are filled to fields reserved for them on the page. Now when search button is clicked the next page shows trips for this current day. Robot checks current day and based on that day it clicks appropriate amount of clicks for "next day"-button on trip results page to land to page showing Friday's train trips for searched route. If current day is actually Friday when this task is executed then there is no clicks and "Today is Friday" is logged instead.
    ...
    ...    *About manually searching for train tickets:*
    ...    When user lands to VR.fi main-page he or she would probably choose a day for train straight from calendar. That could be technically done with Robot but problem with that would be calendar date changing for every trip so there would be a need to modify this tasks. When navigating is done based on week days instead then this works no matter when this is executed and this would be helpful if trips are done regularly on Fridays.
    Open Browser to URL
    Check Cookies
    Select Route
    Navigate To Friday

*** Keywords ***
Open Browser to URL
    Comment    Open VR.fi
    Open Browser    https://www.vr.fi    Firefox
    Maximize Browser Window

Check Cookies
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

