# robocop: disable=NAME18
# robocop: disable=NAME02

*** Settings ***
Library             RequestsLibrary

Suite Setup         Create Session
...                     alias=${SESSION_ALIAS}
...                     url=${BASE_URL}
...                     verify=True
...                     headers={"Content-Type": "application/json", "Accept": "application/json"}
Suite Teardown      Delete All Sessions


*** Variables ***
${BASE_URL}         https://jsonplaceholder.typicode.com
${SESSION_ALIAS}    API_SESSION
${POST_DATA}        None
${RESPONSE}         None


*** Test Cases ***
Create A New Post
    [Tags]    api    post
    Given I Have Post Data With Title="Test Title" Body="Test Body" And UserId=1
    When I send A POST Request To "/posts" With The Post Data
    Then The Response Status Code Should Be 201

*** Keywords ***
I Have Post Data With Title="${title}" Body="${body}" And UserId=${userId}
    [Documentation]    Creates a dictionary with the given title, body, and userId, and sets it as a suite variable.]
    &{data}=    Create Dictionary    title=${title}    body=${body}    userId=${userId}
    Set Suite Variable    ${POST_DATA}    &{data}

I send A POST Request To "${endpoint}" With The Post Data
    [Documentation]    Sends a POST request to the specified endpoint with the post data and stores the response as a suite variable.
    ${response}=    POST On Session    ${SESSION_ALIAS}    ${endpoint}    json=${POST_DATA}
    Set Suite Variable    ${RESPONSE}    ${response}

The Response Status Code Should Be ${status_code}
    [Documentation]    Asserts that the response status code matches the expected status code.
    Should Be Equal As Integers    ${RESPONSE.status_code}    ${status_code}
