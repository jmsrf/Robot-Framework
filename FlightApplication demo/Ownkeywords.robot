*** Settings ***
Library           Myfirst.py
Library           jointwostrings.py
Library           excelownkeyword.py

*** Test Cases ***
Createnewfiletc01
    Myfirst.Createfile    this is my first python file

Jointwostringstc02
    ${var1}    Join Two String    Ngen    Digital
    log    ${var1}

Addsheetinexistingexceltc04
    excelownkeyword.Addsheet    myexcel.xlsx    NgenDigital
