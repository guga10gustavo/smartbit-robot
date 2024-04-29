*** Settings ***
Documentation        Camada de integradação com Api

Library        RequestsLibrary

*** Keywords ***
Set user token
    ${payload}        Create Dictionary
    ...        email=sac@smartbit.com
    ...        password=pwd123
    ${response}        POST    
    ...    http://localhost:3333/sessions
    ...     json=${payload}

    ${token}     Set Variable    Bearer ${response.json()}[token]
    # Set Suite Variable    ${token}
    RETURN    ${token}

