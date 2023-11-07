*** Settings ***
Library        RequestsLibrary

*** Variables ***
${link}        https://reqres.in/api/users?page\=2


*** Keywords ***
keywordssss
    ${response}=        GET    ${link}
    ${kahitano}=    Set Variable    ${response.json()["data"][0]["first_name"]}
    Log To Console    ${response.json()}
    [Return]        ${kahitano}

*** Test Cases ***
Test GET
    ${response}=        GET    ${link}
    Log To Console    ${response.json()}

Test POST
    ${kahitanongname}        keywordssss
    ${kahitano}        Create Dictionary
    ...                name=${kahitanongname}
    ...                job=QA
    ${response}=        POST    https://reqres.in/api/users
    ...                data=${kahitano}
    Log To Console    ${response.json()}

Test PUT
    ${kahitano}        Create Dictionary
    ...                name=Longcop
    ...                job=Manager
    ${response}        PUT    https://reqres.in/api/users/2
    ...                data=${kahitano}
    Log To Console    ${response.json()}

# Test PUT Verify
#     ${response}        GET    https://reqres.in/api/users/2
#     Log To Console    ${response.json()}