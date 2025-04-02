*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://practicetestautomation.com/practice-test-login/
${Username}    student
${Password}    Password123


*** Test Cases ***
Automation Login
    Login User
    Validation of Login
    
  



*** Keywords ***
Login User

    [Documentation]    This test will automate the login of the users
    [Tags]    Login
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Input Text    id=username    ${Username} 
    Input Password    id=password        ${Password}
    ${LoginButton}    Set Variable    id=submit
    Scroll Element Into View    ${LoginButton}
    Click Button    ${LoginButton}
    Sleep    3s

Validation of Login

    [Documentation]    This test will validate the successful login
    [Tags]    Login Validation
    ${Message1}    Set Variable    xpath://h1[@class='post-title' and text()='Logged In Successfully']
    Element Should Be Visible    ${Message1}
 
   

