*** Settings ***
Library    SeleniumLibrary    

Suite Teardown    Close Browser

*** Test Cases ***
Headless Chrome - Create Webdriver
    Open Browser    http://www.kapook.com    headlesschrome
    
    Go to     http://www.kapook.com
    Maximize Browser Window
    Capture Page Screenshot       