*** Settings ***
Documentation       Cenário de pre-cadastros

Resource        ../resources/Base.resource

Test Setup       Start Session
Test Teardown        Take Screenshot  

*** Test Cases ***
# Deve inicar o cadasro do cliente
#     ${account}     Get Fake Account

#     Submit signup form    ${account}

#     Verify welcome message
  
Deve inicar o cadasro do cliente
    [Tags]        smoke
    ${account}     Create Dictionary
    ...        name=Fred
    ...        email=fred@fred.com
    ...        cpf=43707398021
    
    Delete Account By Email    ${account}[email]
    Submit signup form    ${account}

    Verify welcome message

# Campo nome deve ser obrigatório
#     [Tags]    required

#     ${account}        Create Dictionary
#     ...    name=${EMPTY}
#     ...    email=email@valido.com
#     ...    cpf=67734287000

#     Submit signup form    ${account}

#     Notice should be    Por favor informe o seu nome completo
 

# Campo email deve ser obrigatório
#     [Tags]    required
#     ${account}        Create Dictionary
#     ...    name=Testador
#     ...    email=${EMPTY}
#     ...    cpf=67734287000

#     Submit signup form    ${account}

#     Notice should be    Por favor, informe o seu melhor e-mail
 
    

# Campo CPF deve ser obrigatório
#     [Tags]    required
#     ${account}        Create Dictionary
#     ...    name= Testador
#     ...    email=email@valido.com
#     ...    cpf=${EMPTY}
    
#     Submit signup form    ${account}

#     Notice should be    Por favor, informe o seu CPF
  

# Email invalido
#     [Tags]    inv
#     ${account}        Create Dictionary
#     ...    name= Testador
#     ...    email=email*invalido.com
#     ...    cpf=43548390080

#     Submit signup form    ${account}

#     Notice should be    Oops! O email informado é inválido 

# CPF invalido
#     [Tags]    inv
#     ${account}        Create Dictionary
#     ...    name= Testador
#     ...    email=email@valido.com
#     ...    cpf=cpfinvalido
    
#     Submit signup form    ${account}
    
#     Notice should be    Oops! O CPF informado é inválido

Tentativa de pre-cadastro
    [Template]        Attempt signup
    ${EMPTY}        email@valido.com        67734287000        Por favor informe o seu nome completo
    Testador        ${EMPTY}                67734287000        Por favor, informe o seu melhor e-mail
    Testador        email@valido.com        ${EMPTY}           Por favor, informe o seu CPF
    Testador        email*invalido.com      67734287000        Oops! O email informado é inválido 
    Testador        email&invalido.com      67734287000        Oops! O email informado é inválido
    Testador        12334234435454          67734287000        Oops! O email informado é inválido
    Testador        email@valido.com        cpfinvalido        Oops! O CPF informado é inválido
    Testador        email@valido.com        123                Oops! O CPF informado é inválido

*** Keywords ***
Attempt signup
    [Arguments]        ${name}        ${email}        ${cpf}        ${output_message}

    ${account}        Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}
    
    Submit signup form    ${account}
    
    Notice should be    ${output_message}




