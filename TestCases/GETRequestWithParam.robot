*** Settings ***
Library   RequestsLibrary
Library   JSONLibrary
Library   Collections

"""
JSON Formatter =>
# https://jsonpath.com/
# https://jsonformatter.org/ 

https://reqres.in/api/users?page=2&name=Michael
"""

*** Variables ***
${Base_URL}=    https://reqres.in/        # Variable in RobotFramework
${end_point}=    api/users


*** Test Cases ***
TC01 GET Request with Parameters
  Create Session    Get_Param   ${Base_URL}                 # Session Name - Get_Param
  &{params}=      Creare Dictionary     page=2              # Dictionary &
  ${response}=    get request    Get_Param   ${end_point}   params=${params}
  log to console    ${response.status_code}
#  log to console    ${response.content}
  ${str_status_code}=   Convert to String   ${response.status_code}
  Should be equal      ${str_status_code}   200
  
  ${json_res}=    to json   ${response.content}
  @{first_name_list}=   get value from json   ${json_res}   data[0].first_name        # Name List
  ${fname}=    get from list   ${first_name_list}
  Should be equal   ${fname}     Michael
  
  @{last_name_list}=   get value from json   ${json_res}   data[0].last_name        # Name List
  ${lname}=    get from list   ${last_name_list}
  Should be equal   ${lname}     Lawson
