*** Settings ***
Resource          Resources/CommonResources.robot

*** Tasks ***
Tayta peruutuslomake
    [Documentation]    Nettilipun peruutuslomakkeen täyttö samana pysyvien kenttien osalta ilman lähetyksen automaattista painallusta
    Avaa Lomake
    Tayta Kentat
