*** Settings ***
Documentation        Arquivo para valida o consumo da api

Resource    ../services/Service.resource
Resource    ../services/resources/GetByName.resource

*** Tasks ***
Testando api
    Set user token
    Get Account by name    Black Panter