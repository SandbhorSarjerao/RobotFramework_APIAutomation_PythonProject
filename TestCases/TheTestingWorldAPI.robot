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


TC02 GET Request - Student Details By ID
  Create Session    Get_Student_Details   ${Base_URL}  
  ${response}=    get request    Get_Student_Details   ${end_point}/15  
  log to console    ${response.status_code}
  ${str_status_code}=   Convert to string   ${response.status_code}
  Should be equal   ${str_status_code}   200






