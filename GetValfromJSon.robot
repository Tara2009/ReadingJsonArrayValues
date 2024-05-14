*** Settings ***
Library    JSONLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${JSONFile_Path}        ${CURDIR}/Jsonfile/PersonalDet.json 

*** Test Cases ***
ReadingPersonalDetails
    [Tags]        Rperdet
    [Documentation]        Reading Personal Details from Json file using array and display the fetched values in Log file and console
    ${json_obj}=           Load Json From File    ${JSONFile_Path}
    ${name_value}=         Get Value From Json    ${json_obj}        $.firstName
    Log                    First Name of the person is : ${name_value}