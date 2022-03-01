*** Settings ***
Library               RequestsLibrary

*** Test Cases ***
TC01 Quick Get Request Test
    ${response}=    GET  https://www.google.com

TC02 Quick Get Request With Parameters Test
    ${response}=    GET  https://www.google.com/search  params=query=ciao  expected_status=200

TC03 Quick Get A JSON Body Test
    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
    Should Be Equal As Strings    1  ${response.json()}[id]
