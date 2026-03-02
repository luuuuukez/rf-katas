*** Settings ***
Library    Browser

*** Variables ***
${URL}         http://localhost:7272
${VALID_USER}     demo
${VALID_PASS}     mode

*** Test Cases ***

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

*** Keywords ***
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
