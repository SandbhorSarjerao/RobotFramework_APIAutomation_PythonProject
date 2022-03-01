*** Settings ***
Library   RequestsLibrary


*** Variables ***
${Base_URL}=    http://thetestingworldapi.com/
${end_point}=    api/studentsDetails


*** Test Cases ***
TC01 GET Request
  Create Session    Get_Student_Details   ${Base_URL}
  ${response}=    get request    Get_Student_Details   ${end_point}
  log to console    ${response}
  log to console    ${response.status_code}
#  log to console    ${response.content}
  
  
  
