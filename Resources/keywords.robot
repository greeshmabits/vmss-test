*** Settings ***
Library    SeleniumLibrary
Library  String
Variables    ${EXECDIR}/WebElements/locators.py

*** Variables ***
${long_wait_time}  20
${short_wait_time}  5

*** Keywords ***
startBrowserAndAccessSpecifiedPage
    [Arguments]  ${url}
    open browser    ${url}    ${browser}    options=add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors"); add_argument("--no-sandbox"); add_argument("--disable-extensions"); add_argument("--disable-dev-shm-usage"); add_argument("--window-size=1200,1100"); add_argument("--allow-running-insecure-content")
    maximize browser window
    set browser implicit wait    ${short_wait_time}
    log to console    Accessed VMSS

verifyTitle
    [Arguments]  ${title}
    title should be    ${title}
    log to console    Title-${title} verified---!

checkWebElementIsVisibleAndIsEnabled
    [Arguments]    ${webElement}
    set selenium timeout  ${long_wait_time}
    wait until element is visible  ${webElement}
    wait until element is enabled  ${webElement}
    set selenium timeout  ${short_wait_time}

waitUntilElementIsEnabledAndClick
    [Arguments]    ${element_locator}  ${output_msg}
    checkWebElementIsVisibleAndIsEnabled    ${element_locator}
    element should be enabled  ${element_locator}
    click element    ${element_locator}
    log to console  '${output_msg}' Clicked
    set selenium timeout    ${short_wait_time}

fillTheStudentRegistrationForm
    [Arguments]  @{student_details}
    waitUntilElementIsEnabledAndClick  ${student_registration_btn}  New Registration
    ${random_data}=  generate random string  6  [UPPER]
    input text  ${student_id}  ${random_data}
    input text  ${student_first_name}  ${student_details}[1]
    input text  ${student_last_name}  ${student_details}[2]
    input text  ${student_dob}  ${student_details}[3]
    select radio button  ${student_gov_id_type}  ${student_details}[4]
    input text  ${student_gov_id_no}  ${student_details}[5]
    input text  ${student_mobile}  ${student_details}[6]
    input text  ${student_emal}  ${student_details}[7]
    select radio button  ${vaccine_type}  ${student_details}[8]
    log to console  !-----Student details filled suucessfully-----!

clickResetAndVerifyTheFormCleared
    click button  Reset
    log to console  !-----Reset Clicked-----!
    page should contain textfield  ${student_id}
    log to console  !--Form reset successful-----!

clickSubmitAndConfirmRegistration
    click button  Submit
    log to console  !-----Submit Clicked-----!
    alert should be present  'Student registered successfully'
    log to console  !--Student registration successful-----!

clickAndFillVaccinationDriveRequest
    [Arguments]  @{vaccination_drive_details}
    waitUntilElementIsEnabledAndClick  ${vaccination_drive_request_btn}  Request button
    input text  ${vacc_date}  ${vaccination_drive_details}[0]
    ${random_no}=  generate random string  2  [NUMBERS]
    input text  ${covaxin_count}  ${random_no}
    ${random_no2}=  generate random string  2  [NUMBERS]
    input text  ${covishield_count}  ${random_no2}

clickSubmitAndConfirmVacDriveRequestAdded
    click button  Submit
    log to console  !-----Submit Clicked-----!
    alert should be present  'Drive added successfully'
    log to console  !--Drive added successfully-----!
