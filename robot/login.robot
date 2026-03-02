*** Settings ***
Library     Browser

*** Variables ***
${URL}          http://localhost:7272
${USERNAME}     demo
${PASSWORD}     mode

 
*** Test Cases ***
Welcome Page Should Be Visible After Successful Login
    Open Login Page
    Submit Credentials    ${USERNAME}    ${PASSWORD}
    Welcome Page Should Be Open


*** Keywords ***
Open Login Page
    New Browser    headless=${False}
    New Page    ${URL}

Submit Credentials
    [Arguments]    ${user}    ${pass}
    Fill Text    id=username_field    ${user}
    Fill Text    id=password_field    ${pass}
    Click    id=login_button

Welcome Page Should Be Open
    Get Title    ==    Welcome Page


*** Comments ***
Ex2
Welcome Page Should Be Visible After Successful Login
    New Browser    headless=${FALSE}
    New Page    http://localhost:7272
    Fill Text    id=username_field    demo
    Fill Text    id=password_field    mode
    Click    id=login_button
    Get Title    ==    Welcome Page
