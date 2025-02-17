*** Settings ***
Resource          Resources/CommonResources.robot

*** Tasks ***
Search Train Trips
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

