*** Settings ***
Library           HttpLibrary.HTTP

*** Test Cases ***
GetRequest
    HttpLibrary.HTTP.Create Http Context    dummy.restapiexample.com    http
    HttpLibrary.HTTP.GET    /api/v1/employees
    Response Status Code Should Equal    200
    Response Status Code Should Not Equal    401
    ${a1}    Get Response Status
    Log To Console    ${a1}
    Log Response Status
    ${a2}    HttpLibrary.HTTP.Get Response Body
    Log To Console    ${a2}
    Comment    Show Response Body In Browser
    Response Body Should Contain    55614
    Log Response Headers
    Response Should Have Header    connection
    Response Should Not Have Header    json
    Response Header Should Equal    connection    keep-alive
    Response Header Should Not Equal    connection    keep-dead

PostRestAPI
    HttpLibrary.HTTP.Create Http Context    dummy.restapiexample.com    http
    ${Body}    Catenate    {"salary":"1234","age":"12","name":"Nextgenx120"}
    log    ${Body}
    Set Request Body    ${Body}
    HttpLibrary.HTTP.POST    /api/v1/create

PUTRestAPI
    HttpLibrary.HTTP.Create Http Context    dummy.restapiexample.com    http
    ${Body}    Catenate    {"salary":"12345","age":"12","name":"Nextgenx120"}
    log    ${Body}
    Set Request Body    ${Body}
    PUT    /api/v1/update/55881

DeleteRestAPI
    HttpLibrary.HTTP.Create Http Context    dummy.restapiexample.com    http
    DELETE    /api/v1/update/55881

JSONSTRINGExample
    HttpLibrary.HTTP.Create Http Context    dummy.restapiexample.com    http
    ${body}    Set Json Value    {"name":"name","age":"age","salary":"salary"}    /name    "Nextgen111"
    ${body}    Set Json Value    ${body}    /age    11
    ${body}    Set Json Value    ${body}    /salary    1231
    Log To Console    ${body}
    Set Request Body    ${body}
    POST    /api/v1/create

EndtoEndTC
    HttpLibrary.HTTP.Create Http Context    dummy.restapiexample.com    http
    HttpLibrary.HTTP.GET    /api/v1/employees
    ${body}    Get Response Body
    HttpLibrary.HTTP.Response Status Code Should Equal    200
    Log Response Headers
    Response Header Should Equal    connection    keep-alive
    ${Body}    Catenate    {"salary":"1234","age":"25","name":"NextgenE2E"}
    log    ${Body}
    Comment    Set Request Body    ${Body}
    Comment    HttpLibrary.HTTP.POST    /api/v1/create
    Log Response Status
    GET    /api/v1/employees
    ${BODY1}    Get Response Body
    Response Body Should Contain    NextgenE2E
    ${Body2}    Catenate    {"salary":"1234","age":"30","name":"NextgenE2E"}
    Set Request Body    ${Body2}
    HttpLibrary.HTTP.PUT    /api/v1/update/61600
    Log Response Status
    GET    /api/v1/employees
    Log Response Body
    Response Body Should Contain    "employee_age":"30"

GetRequestAssignment
    Create HTTP Context    httpstat.us    http
    ${resp}    HttpLibrary.HTTP.GET    /
    Log to Console    ${resp}
    Response Status Code Should Equal    200
    Response Body Should Contain     Reset Content
