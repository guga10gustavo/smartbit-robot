*** Settings ***
Documentation        Suite de testes de login

Resource        ../resources/Base.resource

Test Setup           Start session
Test Teardown        Finish session

*** Test Cases ***
Deve logar com o CPF e IP
    ${data}        Get JSON Fixture    login
    Insert Memberships    ${data}
    Sign in with document    00000014141
    User is logged in

Nao deve logar com CPF nao cadastrado
    Sign in with document    37483156007
    Popup have text    Acesso não autorizado! Entre em contato com a central de atendimento

Nao deve logar com CPF com digito invalido
    [Tags]        invcpf
    Sign in with document    00000014144
    Popup have text    CPF inválido, tente novamente