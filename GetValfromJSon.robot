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
    ${opp_ref}=            Get Value From Json    ${json_obj}        $.PR_opp_ref_JSON__C
    ${opp_str_json}=       Convert Json To String                    ${opp_ref}
    ${opp_ref_normal}=            Get Value From Json    ${json_obj}        $.PR_opp_ref_JSON__C[0]
    ${opp_str_json_index}=        Convert Json To String                    ${opp_ref_normal}
    Should Be Equal        ${name_value[0]}       Tara
    Sleep                  5s

    Log                    First Name of the person is : ${name_value[0]}
    Log                    City of the Person is : ${Per_City[0]}
    Log                    Person Phone Type is : ${ptype[0]}
    Log                    Person Phone Number is ; ${pNumber[0]} 
    Log                    Opp Reference Json is : ${opp_ref[0]}
    Log                    Opp Reference Json is : ${opp_ref_normal[0]}
    Log                    Opp Reference without Json output is : ${opp_ref_normal}
    Log                    Opp Reference without index convert : ${opp_str_json}
    Log                    Opp Reference with index convert : ${opp_str_json_index}
    Sleep                  5s