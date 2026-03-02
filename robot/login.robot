*** Settings ***
Library     Browser
Resource    common.resource

*** Variables ***
${USERNAME}    demo
${PASSWORD}    mode

*** Test Cases ***
Welcome Page Should Be Visible After Successful Login
    [Teardown]    Do Successful Logout
    Do Successful Login
    Verify That Welcome Page Is Visible

Login Form Should Be Visible After Successful Logout
    [Setup]    Do Successful Login
    Do Successful Logout
    Verify That Login Page Is Visible

*** Keywords ***

# -------------- Workflow -------------
Do Successful Login
    Open Browser To Login Page
    Enter Username    ${USERNAME}
    Enter Password    ${PASSWORD}
    Submit Login Form

Do Successful Logout
    Click    text=Logout

# ------------- Verification -------------
Verify That Welcome Page Is visible
    Get Text    body    contains    Welcome Page
    Get Title    ==    Welcome Page

Verify That Login Page Is Visible
    Get Text    h1    contains    Login Page
    Get Element States    id=login_button    contains    visible        



*** Comments ***

Ex4
/*** Test Cases ***
Welcome Page Should Be Visible After Successful Login
    [Teardown]    Do Successful Logout
    Do Successful Login
    Verify That Welcome Page Is Visible

Login Form Should Be Visible After Successful Logout
    [Setup]    Do Successful Login
    Do Successful Logout
    Verify That Login Page Is Visible

/*** Keywords ***
# -------------- Atomic -------------
Open Browser To Login Page
    New Browser    headless=${FALSE}
    New Page       ${URL}

Enter Username
    Fill Text      id=username_field    ${USERNAME}

Enter Password
    Fill Secret    id=password_field    $PASSWORD

Submit Login Form
    Click          id=login_button

# -------------- Workflow -------------
Do Successful Login
    Open Browser To Login Page
    Enter Username
    Enter Password
    Submit Login Form

Do Successful Logout
    Click    text=Logout

# ------------- Verification -------------
Verify That Welcome Page Is visible
    Get Text    body    contains    Welcome Page
    Get Title    ==    Welcome Page

Verify That Login Page Is Visible
    Get Text    h1    contains    Login Page
    Get Element States    id=login_button    contains    visible        



Ex3

#*** Test Cases ***
Welcome Page Should Be Visible After Successful Login
    Open Login Page
    Submit Credentials    ${USERNAME}    ${PASSWORD}
    Welcome Page Should Be Open


#*** Keywords ***
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

--------
Ex2
Welcome Page Should Be Visible After Successful Login
    New Browser    headless=${FALSE}
    New Page    http://localhost:7272
    Fill Text    id=username_field    demo
    Fill Text    id=password_field    mode
    Click    id=login_button
    Get Title    ==    Welcome Page


