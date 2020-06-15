*** Test Cases ***
For Test
	FOR    ${i}    IN RANGE    999999
           Exit For Loop If    ${i} == 9
           Log    ${i}
	END
    Log    Exited