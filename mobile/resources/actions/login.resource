*** Settings ***
Documentation        Ações e elementos da tela de login

Library        AppiumLibrary

*** Keywords ***
Sign in with document
    [Arguments]        ${cpf}
    Input Text    xpath=//android.widget.EditText[@resource-id="ipAddress"]     NetworkAppWebIp
    Input Text    xpath=//android.widget.EditText[@resource-id="cpf"]    ${cpf}
    Click Element    xpath=//android.view.ViewGroup[@resource-id="btnLogin"]

