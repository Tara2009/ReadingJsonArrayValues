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
    ${Per_City}=           Get Value From Json    ${json_obj}        $.address.city
    ${ptype}=              Get Value From Json    ${json_obj}        $.phoneNumber[0].type
    ${pNumber}=            Get Value From Json    ${json_obj}        $.phoneNumber[0].Number
    Sleep                  5s

    Log                    First Name of the person is : ${name_value[0]}
    Log                    City of the Person is : ${Per_City[0]}
    Log                    Person Phone Type is : ${ptype[0]}
    Log                    Person Phone Number is ; ${pNumber[0]} 
    Sleep                  5s