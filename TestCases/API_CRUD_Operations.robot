*** Settings ***
Library   RequestsLibrary
Library   JSONLibrary
Library   Collections

*** Variables ***
${Base_URL}=    http://thetestingworldapi.com/        # Variable in RobotFramework
${end_point}=    api/studentsDetails
${UpdatedName}=     TestingUpdatedName

*** Test Cases ***
TC01 CRUD Operations - Request Chaining
    Create Session    CRUD_Operation   ${Base_URL} 
    &{header}=    Create Dictionary     Content-Type=application/json
    &{body}=    Create Dictionary     first_name=Testing    middle_name=S   last_name=TestingAPI    date_of_birth=12/12/1998
    
    ${response}=    post request    CRUD_Operation   ${end_point}    headers=${header}    data=${body}    
    log to console    ${response.status_code}
    ${str_status_code}=   Convert to string   ${response.status_code}
    Should be equal   ${str_status_code}   201   
    log to console    ${response.content}

    ${json_res}=    to json   ${Response.content}
    @{id_list}=     get value from json     ${json_res}     data.id     # List in RobotFramework
    ${id}=    get from list      ${id_list}     0                       # First Record
    Set Global Variable     ${id}
    log to console    ${id}

    &{body2}=    Create Dictionary     id=${id}     first_name=${UpdatedName}    middle_name=S   last_name=TestingAPI    date_of_birth=12/12/1998  
    ${put_response}=    put request    CRUD_Operation   ${end_point}/${id}    headers=${header}    data=${body2} 
    log to console    ${put_response.status_code}
    ${str_status_code}=   Convert to string   ${put_response.status_code}
    Should be equal   ${str_status_code}   201   
    log to console    ${put_response.content}


    ${get_response}=    get request    CRUD_Operation   ${end_point}/${id}
    ${json_res}=    to json   ${get_response.content}
    log to console    ${json_res}
    log to console    ${get_response.status_code}
  #  log to console    ${get_response.content}
    @{lname}=   get value from json   ${json_res}     data.first_name
    ${first_name}=    get value from list   ${lname}    0
    Should be equal     ${first_name}      ${UpdatedName}
    

    ${delete_response}=    Delete Request    CRUD_Operation    ${end_point}/${id}
    ${json_delete}=    to json   ${delete_response.content}
    log to console    ${delete_response.status_code}
    ${str_status_code}=   Convert to string   ${delete_response.status_code}
    Should be equal   ${str_status_code}   200   
    log to console    ${delete_response.content}
    @{msg}=   get value from json   ${json_delete}    status
    ${msgstatus}=   get from list   ${msg}    0
    Should be equal     ${msgstatus}    true

