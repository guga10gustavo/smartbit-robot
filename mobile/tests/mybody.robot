*** Settings ***

Documentation        Sutite de testes da funcionalide de cadastro de medidas

Resource        ../resources/Base.resource

Test Setup           Start session
Test Teardown        Finish session

*** Test Cases ***
Deve poder cadastrar minhas medidas

    ${data}        Get JSON Fixture    update
    Insert Memberships    ${data}
    Sign in with document    ${data}[account][cpf]
    User is logged in
    Touch my body
    Send weight and height    ${data}[account]
    Popup have text    Seu cadastro foi atualizado com sucesso
    Set user token
    ${account}        Get Account by name    ${data}[account][name]
    Should Be Equal    ${account}[weight]    ${data}[account][weight]
    Should Be Equal    ${account}[height]    ${data}[account][height]
    