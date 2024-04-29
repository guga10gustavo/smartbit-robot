*** Settings ***
Documentation        Ações do elemento Toast

Library        Browser

*** Keywords ***
Toast shoul be
    [Arguments]        ${expected_text}

    
    Wait For Elements State    css=.Toastify__toast-body    visible    5
    Get Text    css=.Toastify__toast-body    
    ...    equal    
    ...    ${expected_text}
    Take Screenshot    selector=.Toastify__toast-body