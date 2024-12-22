*** Settings ***
Documentation    To work with data driven test cases
Library    SeleniumLibrary
Library     Collections
Resource    ../../Resources/RS_013_RediffmailDataDriven.robot


*** Variables ***

*** Test Cases ***
Data_Driven_Test
    [Documentation]    Working with Data Driven Approach
    [Teardown]    run keyword if test failed    capture page screenshot     Failed_Screen_Data_Driven_{index}.png
    ${MAXROW}=    get max row number    Data
    log to console    ${MAXROW}

    FOR     ${i}    IN RANGE    2   ${MAXROW}
    Open Website            https://mail.rediff.com/cgi-bin/login.cgi       chrome    --disable-notifications
    Type in Username    Data    ${i}    1
    Type in Password    Data    ${i}    2
    Click on Sign in Button
    Click on write mail link
    Type on TO field    Data    ${i}    3
    Type on SUBJECT field    Data    ${i}    4
    Move to frame from main page
    Write in compose area    Data    ${i}    5
    Get out from frame to main page
    Click on send button
    Click on Logout
    Close Website
    END



