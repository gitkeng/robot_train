*** Test Cases ***
IF ELSE condition
    [Documentation]    
    ...    My student grade
    ...      >= 80 = A
    ...      70 - 79 = B
    ...      60 - 69 = C
    ...      50 - 59 = D
    ...      < 50 = F
    @{student_grades} =    Create List    23    67    80    99
    FOR    ${grade}    IN    @{student_grades}
        Log    ${grade}
        #Log student grade based on score    ${grade}
        
        ${actual_grade} =    Get student grade based on score    ${grade}
        Log    ${actual_grade}    
        # Run Keyword If    ${grade} >= 80    Log    A
        # ...    ELSE IF    70 <= ${grade} <= 79     Log    B  
        # ...    ELSE IF    60 <= ${grade} <= 69     Log    C    
        # ...    ELSE IF    50 <= ${grade} <= 59     Log    D   
        # ...    ELSE    Log    F  
        # Run Keyword If    70 <= ${grade} <= 79     Log    B  
        # Run Keyword If    60 <= ${grade} <= 69     Log    C    
        # Run Keyword If    50 <= ${grade} <= 59     Log    D   
        # Run Keyword If    ${grade} < 50     Log    F            
    END 
 
*** Keywords ***
Get student grade based on score
    [Arguments]    ${score}
    [Return]    ${grade}
    ${grade} =    Set Variable    F
    ${grade} =    Set Variable If    ${score} >= 80    A    ${grade}
    ${grade} =    Set Variable If    70 <= ${score} <= 79    B    ${grade}
    ${grade} =    Set Variable If    60 <= ${score} <= 69    C    ${grade}    
    ${grade} =    Set Variable If    50 <= ${score} <= 59    D    ${grade}   
    ${grade} =    Set Variable If    ${score} < 50    F    ${grade}    
Log student grade based on score    
    [Arguments]    ${score}
    Run Keyword If    ${score} >= 80    Log    A
        ...    ELSE IF    70 <= ${score} <= 79     Log    B  
        ...    ELSE IF    60 <= ${score} <= 69     Log    C    
        ...    ELSE IF    50 <= ${score} <= 59     Log    D   
        ...    ELSE    Log    F
    