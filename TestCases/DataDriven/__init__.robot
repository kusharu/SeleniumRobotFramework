*** Settings ***

Library    SeleniumLibrary
Library    Collections
Suite Setup    Before Suite
Suite Teardown    After Suite




*** Keywords ***
Before Suite
    log to console    Before Suite runs

After Suite
    log to console    After Suite runs

