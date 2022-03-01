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
    Create Session    Delete_Student_Details   ${Base_URL}                 # Session Name - Delete_Student_Details
    ${response}=    Delete Request    Delete_Student_Details    ${end_point}/10
    log to console    ${response.status_code}
    ${str_status_code}=   Convert to string   ${response.status_code}
    Should be equal   ${str_status_code}   200   
    log to console    ${response.content}

    ${json_res}=    to json   ${Response.content}
    @{status_list}=     get value from json     ${json_res}     status     # List in RobotFramework
    ${status}=    get from list   ${status_list}    0                      # First Record
    Should be equal     ${status}   false
  
  
TC03 POST Request - Create New Record
    Create Session    Post_Student_Details   ${Base_URL} 
    &{body}=    Create Dictionary     first_name=Testing    middle_name=S   last_name=TestingAPI    date_of_birth=12/12/1998
    &{header}=    Create Dictionary     Content-Type=application/json
    
    ${response}=    post request    Post_Student_Details   ${end_point}    data=${body}    headers=${header}
    log to console    ${response.status_code}
    ${str_status_code}=   Convert to string   ${response.status_code}
    Should be equal   ${str_status_code}   201   
    log to console    ${response.content}

    ${json_res}=    to json   ${Response.content}
    @{id_list}=     get value from json     ${json_res}     data.id     # List in RobotFramework
    ${id}=    get from list      ${id_list}     0                       # First Record
    Set Global Variable     ${id}
    log to console    ${id}

TC04 PUT Request - Update Record
    Create Session    Put_Student_Details   ${Base_URL} 
    &{body}=    Create Dictionary     id=${id}    first_name=Testing    middle_name=TestingMiddle   last_name=TestingAPI    date_of_birth=12/12/1998
    &{header}=    Create Dictionary     Content-Type=application/json
    
    ${response}=    put request    Put_Student_Details   ${end_point}/${id}    data=${body}    headers=${header}
    log to console    ${response.status_code}
    ${str_status_code}=   Convert to string   ${response.status_code}
    Should be equal   ${str_status_code}   201   
    log to console    ${response.content}
    
    ${updated_response}=    get request    Put_Student_Details   ${end_point}/${id}
    log to console    ${response.content}



  
  
  
  
  



