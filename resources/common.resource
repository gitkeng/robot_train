*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${target_url}    http://automationpractice.com/
${browser}    chrome

*** Keywords ***
eCommerce Suite Setup
    Open Browser    url=${target_url}    browser=${browser}
    Set Window Size    1920    1080

eCommerce Test Setup
    Delete All Cookies
    Go To    ${target_url}    