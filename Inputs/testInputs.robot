*** Settings ***
Library    Collections
Library    SeleniumLibrary


*** Variables ***
${page_title}  VMSS
${home_page_url}    http://localhost:3001/
${student_page_url}  http://localhost:3001/Student
${vaccination_drive_page_url}  http://localhost:3001/VacDrive
${browser}    headlesschrome
#New student registration input
@{student_details1}  STUD010  Ashwin  Rupesh  12/07/2012  1  ABCD1234  12341234  gg@gmail.com  1
@{student_details2}  STUD011  Arun  Reyan  15/06/2010  1  ABCD12004  12341034  gg2@gmail.com  2
@{student_details3}  STUD012  Manu  Manoj  21/07/2012  2  ABCD1994  12341294  gg3@gmail.com  2
#Vaccination drive request
@{vaccination_drive_details}  25/07/2022  20 20

