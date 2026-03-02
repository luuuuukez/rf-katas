*** Settings ***
Library    Browser
Resource    common.resource
Test Setup    Open Browser To Login Page
Test Template    Error Page Is Visible When Using Incorrect Credentials

*** Test Cases ***   
#test cases                      #username            #password
Empty Username And Password      ${EMPTY}            ${EMPTY}  
Invalid Username                 invalid_user        mode  
Invalid Password                 demo                wrong_password
Invalid Username And Password    invalid_user        wrong_password
Special Characters               admin' OR '1'='1    mode  


*** Keywords ***

Verify That Error Page Is Visible
    Get Url    ==    ${URL}/error.html
    Get Title    ==    Error Page
    Get Text    h1    ==    Error Page


Error Page Is Visible When Using Incorrect Credentials
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Submit Login Form
    Verify That Error Page Is Visible  


*** Comments ***

Ex6
/*** Settings ***
Library    Browser
Resource    common.resource

/*** Test Cases ***
Error Page Should Be Visible After Incorrect Login
    Open Browser To Login Page
    Enter Username    invalid_user
    Enter Password    invalid_password
    Submit Login Form
    Verify That Error Page Is Visible

Invalid Password
    Open Browser To Login Page
    Enter Username    demo
    Enter Password    wrong
    Submit Login Form
    Verify That Error Page Is Visible

Empty Credentials
    Open Browser To Login Page
    Enter Username    ${EMPTY}
    Enter Password    ${EMPTY}
    Submit Login Form
    Verify That Error Page Is Visible

/*** Keywords ***
Verify That Error Page Is Visible
    Get Title    ==    Error Page
    Get Text    h1    ==    Error Page

----------------------
Ex5
/*** Variables ***
${URL}         http://localhost:7272
${VALID_USER}     demo
${VALID_PASS}     mode

/*** Test Cases ***

# 1. Valid username, invalid password
# 2. Invalid username, valid password
# 3. Invalid username, invalid password 
# 4. Empty username, empty password 
# 5. Valid username, empty password
# 6. Username contains special characters

# Implement 3 
Error Page Should Be Visible after Incorrect Login
    Open Browser To Login Page
    Enter Username    invalid_user
    Enter Password    invalid_password
    Submit Login Form
    Verify That Error Page Is Visible
/*** Keywords ***
Open Browser To Login Page
    New Browser    headless=${False}
    New Page    ${URL}

Enter Username
    [Arguments]    ${username}
    Fill Text    id=username_field    ${username}

Enter Password
    [Arguments]    ${password}
    Fill Secret    id=password_field    $password

Submit Login Form
    Click    id=login_button

Verify That Error Page Is Visible
    Get Title    ==    Error Page
    Get Text    h1    ==    Error Page