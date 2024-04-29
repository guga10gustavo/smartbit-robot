*** Settings ***
Documentation        Principal arquivo para automação mobile

Library        AppiumLibrary
Library        ../../libs/Account.py
Library        ../../libs/Database.py
Library        JSONLibrary
Resource       ../resources/actions/login.resource
Resource        ../resources/actions/components/menu.resource
Resource        ../resources/actions/mybody.resource
Resource        ../resources/actions/account.resource
Resource        ../resources/actions/components/popup.resource
Resource        ../../services/Service.resource
Resource        ../../services/resources/GetByName.resource

*** Keywords ***

Start session
    Open Application    http://localhost:4723
    ...        platformName=Android
    ...        automationName=UIAutomator2
    ...        deviceName=Emulator
    ...        udid=emulator-5554
    ...        app=${EXECDIR}/app/smartbit-beta.apk
    ...        autoGrantPermissions=true
    
    Wait Until Page Contains   IP da API    30

Finish session
    Capture Page Screenshot
    Close Application

Get JSON Fixture
    [Arguments]          ${scenario}

    ${data}        Load Json From File    
    ...        ${EXECDIR}/resources/fixtures/data.json
    ...        encoding=utf-8

    RETURN       ${data}[${scenario}]
