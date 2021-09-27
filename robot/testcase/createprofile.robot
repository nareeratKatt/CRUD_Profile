*** Settings ***
Resource    ${CURDIR}/../resources/imports.robot


*** Test Cases ***
Create profile - case_1
    ${response}=    Create profile  ${DATA.user_profile.firstname}  ${DATA.user_profile.lastname}
    Result Should Be Success Of case_1  ${response}

Get profile - case_2
    ${response}=   Get profile
    Result Should Be Success Of case_2  ${response}

Update profile - case_3
    ${response}=    Update profile  ${DATA.user_profile.id}     ${DATA.user_profile.firstname}  ${DATA.user_profile.lastname}
    Result Should Be Success Of case_3  ${response}

Delete profile - case_4
    ${response}=    Delete profile
    Result Should Be Success Of case_4  ${response}