*** Settings ***
Library    JSONLibrary
Library    OperatingSystem
Library    Collections

*** Test Cases ***
ReadingPersonalDetails
    [Tags]        Rperdet
    [Documentation]        Reading Personal Details from Json file using array and display the fetched values in Log file and console
    ${json_obj}=           Load Json From File    D:\Workingfolder\Copado\API-Automation\PersonalDet.json
    ${name_value}=         Get Value From Json    ${json_obj}        $.firstName
    Log                    ${name_value}