*** Test Cases ***
Demo Scalar
    [Documentation]    
    ...    This test case for demo scalar
    ...    Try to set test variable
    ${username} =    BuiltIn.Set Variable    John
    ${password} =    Set Variable    Welcome1
    # Try to print log hello world
    Log    Hello ${username} and ${password}    
    Log    Hi ${username}
    ${nickname} =    Set Variable    Mr J

Demo List
    @{product_names} =    Create List    Iphone 11    Android 12    Windows phone
    Log Many    @{product_names}
    Log    ${product names[1]}    

Demo Dictionary
    [Tags]    smoke
    &{user1} =    Create Dictionary    username=jonh    password=welcome1
    &{user2} =    Create Dictionary    username=mary    password=welcome2
    Log    ${user1.username}
    Log    ${user2.password}
