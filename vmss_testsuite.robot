*** Settings ***
Library    SeleniumLibrary
Resource  ${EXECDIR}/Resources/keywords.robot
Resource  ${EXECDIR}/Inputs/testInputs.robot
Test Teardown  close all browsers

*** Test Cases ***
Test1_TitleTest
   startBrowserAndAccessSpecifiedPage  ${home_page_url}
    verifyTitle  ${page_title}

Test2_StudentRegistrationFormReset
    startBrowserAndAccessSpecifiedPage  ${student_page_url}
    fillTheStudentRegistrationForm  @{student_details1}
    clickResetAndVerifyTheFormCleared

Test3_StudentRegistrationSuccessful
    startBrowserAndAccessSpecifiedPage  ${student_page_url}
    fillTheStudentRegistrationForm  @{student_details1}
    clickSubmitAndConfirmRegistration

Test4_VaccinationDriveRequest
    startBrowserAndAccessSpecifiedPage  ${vaccination_drive_page_url}
    clickAndFillVaccinationDriveRequest  @{vaccination_drive_details}
    clickSubmitAndConfirmVacDriveRequestAdded

Test_Cleanup
    log to console    Tests finished
    [Teardown]    close all browsers