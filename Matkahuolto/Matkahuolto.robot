*** Settings ***
Documentation     Idea of this Robot-task is to demonstrate automated filling of Matkahuolto ticket cancellation form. Only those forms that would stay same to passenger for regular trip routes are filled in this case so that those fields would be automatically filled every time when there would ne need to cancel tickets. Dynamical information like for example ticket number would be filled manually after automated fields would be filled. Sending is also manual but could be technically easily automated.
Resource          Resources/CommonResources.robot

*** Tasks ***
Tayta peruutuslomake
    [Documentation]    Nettilipun peruutuslomakkeen täyttö samana pysyvien kenttien osalta ilman lähetyksen automaattista painallusta
    Avaa Lomake
    Tayta Kentat
