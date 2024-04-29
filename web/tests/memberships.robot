*** Settings ***
Documentation        Suite de teste de adesão de planos

Resource        ../resources/Base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot  

*** Test Cases ***

Deve poder realizar uma nova adesão

    # ${account}        Create Dictionary
    # ...        name=Frederico
    # ...        email=frederico@frederico.com
    # ...        cpf=97650549046

    # ${credit_card}        Create Dictionary
    # ...        number=4242424242424242 
    # ...        holder=Frederico
    # ...        month=12
    # ...        year=2030
    # ...        cvv=123
    
    # ${plan}        Set Variable        Plano Black


    ${data}       Get JSON Fixture    memberships    create
    Delete Account By Email    ${data}[account][email]
    Insert Account    ${data}[account]
    Sign In Admin
    Go to Memberships
    Create new membership    ${data}        
    Toast shoul be    Matrícula cadastrada com sucesso.


Não deve aceitar adesão duplicada
    [Tags]        dup
    ${data}       Get JSON Fixture    memberships    duplicated

    Insert Memberships        ${data}
    Sign In Admin
    Go to Memberships
    Create new membership    ${data}
    Toast shoul be    O usuário já possui matrícula.

Deve buscar por nome
    [Tags]        search
    ${data}       Get JSON Fixture    memberships    search
    Insert Memberships    ${data}
    Sign In Admin
    Go to Memberships
    Search by name    ${data}[account][name]
    Should filter by name    ${data}[account][name]

Deve excluir uma matricula
    [Tags]        rmv
    ${data}       Get JSON Fixture    memberships    remove
    Insert Memberships    ${data}
    Sign In Admin
    Go to Memberships
    Request removal    ${data}[account][name]
    Confirm removal
    Membership shold not be visible    ${data}[account][name]
    