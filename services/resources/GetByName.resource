*** Settings ***
Documentation        Camada de integradação com Api GET by name

Resource    ../Service.resource

*** Keywords ***

Get Account by name
    [Arguments]        ${name}

    ${token}        Set user token
    ${headers}        Create Dictionary
    ...        Authorization=${token}
    
    ${params}        Create Dictionary
    ...        name=${name}     

    ${response}        GET    
    ...    url=http://localhost:3333/accounts
    ...    params=${params}
    ...    headers=${headers}
    RETURN       ${response.json()}[data][0]