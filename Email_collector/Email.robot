*** Settings ***
Library           ExcelLibrary
Library           SeleniumLibrary
Library           String
Library           Dialogs
Resource          Resources/CommonResources.robot

*** Test Cases ***
Get_Emails_URLs_And_Titles
    Open Browser With Blank Page
    :FOR    ${INDEX}    IN RANGE    1    1000
    \    Set Suite Variable    ${INDEX}
    \    Pause Execution First Window
    \    Take Current URL
    \    Take Current Title
    \    Filter Lines Containing Emails From All Text
    \    Evaluate New Range
    \    Log Emails To Console
    \    Open Excel From Given Path
    \    Inner For Loop
    \    Save Emails Titles And URLs
    \    Execute Manual Step With Message
    \    Initialize Loop Range For Next Round
