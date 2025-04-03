*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Test All Https Methods
    Post Request Test
    Get Request Test
    Put Request Test
    Set Test Message    API Testing




*** Keywords ***
Get Request Test
    [Documentation]    Validate GET request to fetch a post.
    Create Session    jsonplaceholder    ${BASE_URL}
    ${response}    GET On Session    jsonplaceholder    /posts/2
    Should Be Equal As Numbers    ${response.status_code}    200 
    Log    Status Code: ${response.status_code}
    Log    Response: ${response.json()}         

Post Request Test
    [Documentation]    Validate POST request to create a post.
    Create Session    jsonplaceholder    ${BASE_URL}
    ${data}    Create Dictionary    title=test    body=bar    userId=2
    ${response}    POST On Session    jsonplaceholder    /posts    json=${data}  
    Should Be Equal As Numbers    ${response.status_code}    201    
    Log    Status Code: ${response.status_code}
    Log    Response: ${response.json()}     
    

Put Request Test
    [Documentation]    Validate PUT request to update a data
    Create Session    jsonplaceholder    ${BASE_URL}
    ${data}    Create Dictionary    title=what1    body=what1   
    ${response}    PUT On Session    jsonplaceholder    /posts/2    json=${data}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    Status Code: ${response.status_code}
    Log    Response: ${response.json()}          


Delete Request Test
    [Documentation]    Validate DELTE request to delete a data
    Create Session    jsonplaceholder    ${BASE_URL} 
    ${response}    DELETE On Session   jsonplaceholder    /posts/1    
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    Status Code: ${response.status_code}
    Log    Response: ${response.json()}          