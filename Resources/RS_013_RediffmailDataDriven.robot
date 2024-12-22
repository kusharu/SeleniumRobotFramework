*** Settings ***
Documentation    To work with data driven where keywords are kept to read data from cell
Library    SeleniumLibrary
Library     Collections
Library     ../ExternalKeywords/DataDrivenKeywords.py


*** Variables ***



*** Keywords ***
Open Website
    [Arguments]    ${Url}    ${Browser}    ${Options}
    set selenium implicit wait    20 Seconds
    open browser    ${Url}    ${Browser}    ${Options}
    maximize browser window
    set selenium timeout    10 seconds
    set selenium implicit wait    10 seconds
    wait until page contains    rediff
    page should contain    rediff

Close Website
    set selenium implicit wait    20 Seconds
    close browser
Type in Username
    [Arguments]    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    ${USERNAME}    Read Locator    Registration.username_id
    ${USERNAMEVALUE}=     Read Data From Cell     ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    set selenium implicit wait    20 Seconds
    input text    id:${USERNAME}        ${USERNAMEVALUE}

Type in Password
    [Arguments]    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    ${PASSWORD}    Read Locator    Registration.password_id
    ${PASSWORDVALUE}      Read Data From Cell     ${SHEETNAME}    ${ROWNUMBER}   ${COLUMNNUMBER}
    set selenium implicit wait    20 Seconds
    input password    id:${PASSWORD}   ${PASSWORDVALUE}

Click on Sign in Button
    ${SIGNIN}    Read Locator    Registration.signin_name
    set selenium implicit wait    20 Seconds
    click button    name:${SIGNIN}
    sleep    5 Seconds

Click on write mail link
    sleep    2 Seconds      # Stale element Referecne exception was coming so given sleep
    set selenium implicit wait    20 Seconds
    ${WRITEMAIL}    Read Locator    Inbox.writemail_xpath
    set selenium implicit wait    20 Seconds
    double click element    xpath:${WRITEMAIL}
    sleep    2 Seconds

Type on TO field
    [Arguments]     ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    ${TOVALUE}      Read Data From Cell     ${SHEETNAME}    ${ROWNUMBER}   ${COLUMNNUMBER}
    ${TOFIELD}    Read Locator    Inbox.to_xpath
    sleep    2 Seconds
    set selenium implicit wait    20 Seconds
    # taken xpath value from the browser run by selenium
    click element    xpath:${TOFIELD}
    input text    xpath:${TOFIELD}    ${TOVALUE}
    sleep    2 Seconds
    press key    xpath:${TOFIELD}    \\13
    sleep    2 Seconds


Type on SUBJECT field
    [Arguments]     ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    ${SUBJECTVALUE}    Read Data From Cell      ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    # taken xpath value from the browser run by selenium
    ${SUBJECTFIELD}    Read Locator    Inbox.subject_xpath
    sleep    2 Seconds
    set selenium implicit wait    20 Seconds
    input text    xpath:${SUBJECTFIELD}    ${SUBJECTVALUE}
    sleep    2 Seconds

Move to frame from main page
    # taken xpath value from the browser run by selenium
    ${Frame}    Read Locator    Inbox.frame_xpath
    sleep    2 Seconds
    set selenium implicit wait    20 Seconds
    select frame    xpath:${Frame}
    sleep    2 Seconds

Write in compose area
    [Arguments]     ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    ${COMPOSEVALUE}    Read Data From Cell      ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    # taken xpath value from the browser run by selenium
    ${COMPOSEFIELD}    Read Locator    Inbox.compose_area_xpath
    sleep    2 Seconds
    set selenium implicit wait    20 Seconds
    input text    xpath:${COMPOSEFIELD}    ${COMPOSEVALUE}
    sleep    2 Seconds



Get out from frame to main page
    sleep    5 Seconds
    set selenium implicit wait    20 Seconds
    unselect frame


Click on send button
    # taken xpath value from the browser run by selenium
    ${SENDBUTTON}    Read Locator    Inbox.send_button_xpath
    sleep    2 Seconds
    set selenium implicit wait    20 Seconds
    click link    xpath:${SENDBUTTON}
    sleep    2 Seconds


Click on Logout
    # taken xpath value from the browser run by selenium
    ${Logout}    read Locator    Inbox.logout_xpath
    sleep    2 Seconds
    click link      xpath:${Logout}
    sleep    2 Seconds



Read Locator
    [Arguments]    ${JSONPATH}
    ${VALUE}   read locator from json    ${JSONPATH}
    [Return]    ${VALUE}

Read Data From Cell
    [Arguments]    ${sheetName}  ${row}  ${column}
    ${dataValue}    get data from cell  ${sheetName}  ${row}  ${column}
    [Return]    ${dataValue}
