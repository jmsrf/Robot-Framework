*** Settings ***
Resource          Resources/CommonResources.robot

*** Tasks ***
Tayta peruutuslomake
    [Documentation]    Bus ticket cancellation form filling with those fields that stay the same. Does not send cancel request.
    Open Form
    Fill Fields
