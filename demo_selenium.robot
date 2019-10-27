*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${target_url}    http://automationpractice.com/
${browser}    headlesschrome


*** Test Cases ***
Open browser demo
    Open Browser    url=${target_url}    browser=${browser}

Test caes 2
    Log    ${target_url}
    

Test Id locator
    Open Browser    url=${target_url}    browser=${browser}
    Click Element    id:contact-link  
    Wait Until Page Contains    send  
    Page Should Contain    send
    
Test CSS location
    Open Browser    url=${target_url}    browser=${browser}
    Set Window Size    1920    1080    
    Click Element    css:a.login   
    Wait Until Page Contains    Already registered     
    Page Should Contain    Already registered?
    Capture Page Screenshot    
    Close Browser
