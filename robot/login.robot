*** Settings ***
Library     Browser



*** Test Cases ***
Welcome Page Should Be Visible After Successful Login
    New Browser    headless=${FALSE}
    New Page    http://localhost:7272
    Fill Text    id=username_field    demo
    Fill Text    id=password_field    mode
    Click    id=login_button
    Get Title    ==    Welcome Page
