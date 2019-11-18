*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Dialogs
Library           ExcelLibrary
Library           Collections

*** Variables ***
${EMAILS}         ${EMPTY}
${firstrangevalue}    0
${firstlength}    ${EMPTY}
${INDEX}          0
${INDEX2}         ${EMPTY}
${i}              0
${latestlength}    ${EMPTY}
${secondrangevalue}    1
${splittedtext}    ${EMPTY}
@{splittedlist}
${TITLE}          ${EMPTY}
${text}           ${EMPTY}
${url}            ${EMPTY}
${excelopenpath}    C:/Ohjelmointiprojektit/Robot_Framework_Projects/Robot_Projects/Email/Emails/Robot_base.xls
${excelsavepath}    C:/Ohjelmointiprojektit/Robot_Framework_Projects/Robot_Projects/Email/Emails/Robot_collected.xls

*** Keywords ***
Execute Manual Step With Message
    [Documentation]    This keyword provides a popup-window for user after every page is handled to ask about continuing. If "PASS" is pressed then executing is continued to next page but pressing "FAIL" stops executing to current page (current page however is still collected to Excel so FAIL may miselad a bit but naming comes from a library of Robot).
    Execute Manual Step    Do you want to continue? Click "PASS" if continuing and if you want to stop click "FAIL" instead. Note that although test seems to "FAIL" when clicking in this case it really means stopping test-execution instead because we are automating rather than testing and emails are seen in Excel even after pressing "FAIL" to stop running test-case.    Stop collecting emails for this session

Filter Lines Containing Emails From All Text
    [Documentation]    First this keyword gets all text from web-site's body element and puts text to ${text} variable. Then lines from that text containing @-mark or (at) are put to ${EMAILS} variable. "Get Lines Containing String" from String-library is used to filter these lines.
    ${text}=    Get Text    xpath://html/body
    Comment    Get lines those that include @ or (at) using regular expression
    ${EMAILS}=    Get Lines Matching Regexp    ${text}    @|\\((at)\\)    partial_match=True
    Set Suite Variable    ${EMAILS}
    Comment    Split collected emails to lines
    ${splittedtext}=    Split To Lines    ${EMAILS}
    Set Suite Variable    ${splittedtext}
    @{splittedlist}=    Convert to List    ${splittedtext}
    Set Suite Variable    @{splittedlist}
    Comment    Get latest length of splitted text meaning number of emails for this round
    ${latestlength}    Get Length    ${splittedtext}
    Set Suite Variable    ${latestlength}
    Log    There are ${latestlength} new emails for this round

Evaluate New Range
    [Documentation]    ${firstrangevalue} is the first value of range for Inner For Loop and ${secondrangevalue} is the later value of that range. These values are needed to change dynamically because number of emails differs from page to page and that range handles what Excel-lines are used for writing next.
    ...
    ...    Here a new ${firstrangevalue} is initialized with "old" value of ${secondrangevalue} because starting point for next range is always the same number that previous round is ended to.
    ${firstrangevalue}    Evaluate    ${secondrangevalue} + 0
    ${secondrangevalue}    Evaluate    ${firstrangevalue} + ${latestlength}
    Log    firstrangevalue initilalized for next round with a value of: ${firstrangevalue}
    Log    secondrangevalue initilalized for next round with a value of: ${secondrangevalue}
    Set Suite Variable    ${secondrangevalue}
    Set Suite Variable    ${firstrangevalue}

Initialize Loop Range For Next Round
    [Documentation]    ${firstrangevalue} is the first value of range for Inner For Loop and ${secondrangevalue} is the later value of that range. These values are needed to change dynamically because number of emails differs from page to page and that range handles what Excel-lines are used for writing next.
    ...
    ...    Here a new value for ${firstrangevalue} is is initialzed with an old value of ${secondrangevalue} as the range for next round is always starts with the same number thant the previous round is ended to.
    ...
    ...    ${secondrangevalue} is grown with a number of next batch of emails found. The number of emails is checked with ${latestlength} meaning a length of array and that provides the number of emails.
    ${firstrangevalue}    Evaluate    ${secondrangevalue} + 0
    ${secondrangevalue}    Evaluate    ${secondrangevalue} + ${latestlength}

Inner For Loop
    [Documentation]    ${INDEX2} basically handles Excel rows that new data is being written to although numbers are not directly the same. Range is dynamically changed based to a new batch of emails found so corrent amount of new Escel lines are written.
    ...
    ...    ${i} is incremented to pick one emails of a list of emails. Emails are written one email per one Excel line and without that ${i} value emails would be written to same Excel cell per one page handled.
    ...
    ...    Robot-emails is the name os sheet inside Excel file. Number after that point to column number (0 is the first column in Excel). Row number is dynamically changed by INDEX2-value.
    : FOR    ${INDEX2}    IN RANGE    ${firstrangevalue}    ${secondrangevalue}
    \    Log    firstrangevalue just after beginning this round: ${firstrangevalue}
    \    Log    secondrangevalue just after beginning this round: ${secondrangevalue}
    \    Set Suite Variable    ${INDEX2}
    \    ${i}    Evaluate    ${i}+1
    \    Put String To Cell    Robot-emails    0    ${INDEX2}    ${TITLE}
    \    Put String To Cell    Robot-emails    1    ${INDEX2}    @{splittedlist}[${i-1}]
    \    Put String To Cell    Robot-emails    2    ${INDEX2}    ${url}
    \    Set Suite Variable    ${firstrangevalue}
    \    Set Suite Variable    ${secondrangevalue}

Log Emails To Console
    [Documentation]    This keyword handles logging emails to console if emails are found. If ${EMAILS}-variable is not empty then it contains emails and those are logged to console. If that variable is empty then at marked emails were not found and "No emails as @ found this time" is logged to console instead.
    Log to console    .
    Run Keyword If    """${EMAILS}"""!="""${EMPTY}"""    Log to console    Emails from current URL were found (logged below)
    ...    ELSE IF    """${EMAILS}"""=="""${EMPTY}"""    Log to console    No emails found this time
    Log to console    ${EMAILS}

Open Browser With Blank Page
    [Documentation]    Opens browser with a blank page. Can be changed between Chrome and Firefox by modifying third line of this column of this keyword (currently as Chrome).
    ...    Blank page is opened at this stage because later the current url that emails are needed to be collected from is given manually by user.
    Open Browser    about:blank    Firefox

Open Excel From Given Path
    [Documentation]    Opens base Excel-file constructed manually from a given path. Path is saved and can be changed by modifying ${excelopenpath}-variable. Saving collected data is done to a different Excel file handled by "Save Emails Titles And URls"-keyword.
    Open Excel    ${excelopenpath}

Open Email And URLS Excel From Given Path
    Open Excel    C:/Users/Jari-Matti/Email/Emails/Robot_base_excel_emails_urls.xls

Pause Execution First Window
    [Documentation]    Pauses Robot execution after browser is opened and appearing pop up window instructs user to go to the site from which emails are intented to be collected. After correct page is seen by user then automated test execution can be continued by pressing OK.
    Pause Execution    Please navigate with browser's search bar to URL containing the first page where you want to collect emails from. After correct page is seen and loaded please press OK to continue test.

Pause Execution Later Windows
    [Documentation]    Pauses Robot execution after browser is opened and appearing pop up window instructs user to go to the site from which emails are intented to be collected. After correct page is seen by user then automated test execution can be continued by pressing OK.
    ...
    ...    Slightly modified text compared the popup for first page.
    Pause Execution    Please navigate with browser to a new URL containing page where you want to continue collecting emails from. After correct page is seen and loaded please press OK to continue test.

Save Emails Titles And URLs
    [Documentation]    This keyword saves collected data to a new Excel-file based to a base Excel file consctructed manually containing right columns etc. Path for saving is configured in ${excelsavepath}-variable and can be changed from there.
    Save Excel    ${excelsavepath}

Take Current Title
    [Documentation]    This keyword handles taking title of the current web page that emails are being collected from and puts title to a variable named ${TITLE}
    ${TITLE}=    Get Title
    Set Suite Variable    ${TITLE}
    Log to console    Current Title is:
    Log to console    ${TITLE}

Take Current URL
    [Documentation]    Gets URL from the page that user has navigated to collect emails from and switches window to that URL. This makes it possible to not tie this test to a preconfigured page which would need to be changed after wanting to collect emails from another site. Now that the pages is given manually then that is taken as URL.
    ${url}=    Get Location
    Set Suite Variable    ${url}
    Log To Console    .
    Log To Console    Current URL is:
    Log To Console    ${url}
    Switch Window    url=${url}
