*** Settings ***
Resource    ${CURDIR}/../resources/imports.robot

*** Keywords ***
Create profile
    [arguments]     ${firstname}    ${lastname}
    Create Session  createprofileSession   ${COMMON.base_url}
    ${body}=    Create Dictionary   firstname=${firstname}  lastname=${lastname}
    ${header}=  Create Dictionary   Content-Type=application/json
    ${response}=    POST On Session     createprofileSession    /v1/user/create     json=${body}    headers=${header}
    ${status_code}=     convert to string   ${response.status_code}
    Set Test Variable       ${status_code}
    [Return]    ${response}

Get profile
   Create Session  getprofileSession   ${COMMON.base_url}
    ${header}=  Create Dictionary   Content-Type=application/json
    ${response}=    GET On Session     getprofileSession    /v1/user/1    headers=${header}
    ${status_code}=     convert to string   ${response.status_code}
    Set Test Variable       ${status_code}
    [Return]    ${response}

Update profile
    [arguments]     ${userid}   ${firstname}    ${lastname}
    Create Session  updateprofileSession   ${COMMON.base_url}
    ${body}=    Create Dictionary   userid=${userid}    firstname=${firstname}    lastname=${lastname}
    ${header}=  Create Dictionary   Content-Type=application/json
    ${response}=    PUT On Session     updateprofileSession    /v1/user     json=${body}    headers=${header}
    ${status_code}=     convert to string   ${response.status_code}
    Set Test Variable       ${status_code}
    [Return]    ${response}

Delete profile
   Create Session  deleteprofileSession   ${COMMON.base_url}
    ${header}=  Create Dictionary   Content-Type=application/json
    ${response}=    DELETE On Session     deleteprofileSession      /v1/user/1      headers=${header}
    ${status_code}=     convert to string   ${response.status_code}
    Set Test Variable       ${status_code}
    [Return]    ${response}

Result Should Be Success Of case_1
    [arguments]     ${response}
    ${res_body}=    Set Variable    ${response.json()}
    should be equal     ${status_code}     201
    should contain  ${res_body['status']}     ${DATA.response_success}

Result Should Be Success Of case_2
    [arguments]     ${response}
    ${convert_json}=   Set Variable     ${response.json()}
    should be equal     ${status_code}     200
    should contain  ${convert_json['userId']}     ${DATA.user_profile.id}
    should contain  ${convert_json['firstname']}     ${DATA.user_profile.firstname}
    should contain  ${convert_json['lastname']}     ${DATA.user_profile.lastname}

Result Should Be Success Of case_3
    [arguments]     ${response}
    ${res_body}=    Set Variable    ${response.json()}
    should be equal     ${status_code}     200
    should contain  ${res_body['status']}     ${DATA.response_success}

Result Should Be Success Of case_4
    [arguments]     ${response}
    ${convert_json}=    Set Variable    ${response.json()}
    should be equal     ${status_code}     200
    should contain      ${convert_json['status']}    ${DATA.response_success}