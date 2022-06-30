*** Settings ***
Library    SeleniumLibrary
Variables    ${EXECDIR}/WebElements/locators.py


*** Variables ***
${url}    https://demo.guru99.com/test/newtours/
${browser}    headlesschrome
${wait_time}    5
${ui_username}    admin
${ui_password}    admin

*** Keywords ***
startBrowserAndAccessVMSS
        open browser    ${url}    ${browser}    options=add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors"); add_argument("--no-sandbox"); add_argument("--disable-extensions"); add_argument("--disable-dev-shm-usage"); add_argument("--window-size=1200,1100"); add_argument("--allow-running-insecure-content")
        maximize browser window
        set browser implicit wait    ${wait_time}
        log to console    Accessed VMSS

verifyTitle
        title should be    ${page_title}
        log to console    Title verified---!

checkForAcceptAllPresenceAndClickIt
    ${status}    run keyword and return status    page should contain  ${cookie_msg}
    IF    ${status}
        click element    ${accept_all}
        log to console    Accepted
    END

loginByEnteringUsernameAndPassword
    log to console    Entering user name and password
    set selenium speed    2
    input text    ${username_textbox}    ${ui_username}
    input text    ${password_textbox}    ${ui_password}
    click element    ${login_button}
    wait until page contains element   ${welcome_msg_box}
    log to console    Logged in successfully

*** Test Cases ***
Test1_TitleTest
    startBrowserAndAccessVMSS
    verifyTitle
Test2_LoginTest
    checkForAcceptAllPresenceAndClickIt
    #loginByEnteringUsernameAndPassword
Test_Cleanup
    log to console    Tests finished
    [Teardown]    close all browsers