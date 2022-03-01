*** Settings ***
Library   RequestsLibrary
Library   JSONLibrary
Library   Collections

*** Variables ***
${Base_URL}=    http://thetestingworldapi.com/        # Variable in RobotFramework
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
  ${json_res}=    to json   ${Response.content}
  @{first_name_list}=     get value from json     ${json_res}     data.first_name     # List in RobotFramework
  ${first_name}=    get from list      ${first_name_list}     0                       # First Record
  log to console    ${first_name}
  Should be equal   ${first_name}   Test Student                          # This is the First Name of Student
  
  @{last_name_list}=     get value from json     ${json_res}     data.last_name     # List in RobotFramework
  ${last_name}=    get from list      ${last_name_list}     0                       # First Record
  log to console    ${last_name}
  Should be equal   ${last_name}   Automation                          # This is the First Name of Student
  
  
TC02 DELETE Request
  Create Session    Get_Student_Details   ${Base_URL}                 # Session Name - Get_Student_Details
  ${response}=    Delete Request    Get_Student_Details    ${end_point}/10
  log to console    ${response.status_code}
  ${str_status_code}=   Convert to string   ${response.status_code}
  Should be equal   ${str_status_code}   200   
  log to console    ${response.content}
  
  ${json_res}=    to json   ${Response.content}
  @{status_list}=     get value from json     ${json_res}     status     # List in RobotFramework
  ${status}=    get from list   ${status_list}    0                      # First Record
  Should be equal     ${status}   false
  
  
  
  



