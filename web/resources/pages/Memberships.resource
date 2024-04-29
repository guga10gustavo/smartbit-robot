*** Settings ***
Documentation        Ações e elementos da pagina de Memberships

Library        Browser

*** Keywords *** 
Go to Memberships form
    Click    css=a[href="/memberships/new"]
    Wait For Elements State    css=h1 >> text=Nova matrícula
    ...    visible        5

Create new membership
    [Arguments]        ${data}
    
    Go to Memberships form
    Select Account   ${data}[account][name]    ${data}[account][cpf]
    Select Plan    ${data}[plan][name]
    Fill payment card        ${data}[credit_card]



Select Account
    [Arguments]        ${name}        ${cpf}
    Fill Text    css=input[aria-label=select_account]   ${name}
    Click    css=[data-testid="${cpf}"]

Select Plan
    [Arguments]        ${plan_name}
    Fill Text    css=input[aria-label=select_plan]    ${plan_name}
    Click    css=div[class$=option] >> text=${plan_name}
            # css=div[id*=option] >> text=Plano Black
             
Fill payment card
    [Arguments]        ${credit_card}        

    Fill Text    css=input[name=card_number]     ${credit_card}[number]
    Fill Text    css=input[name=card_holder]     ${credit_card}[holder]
    Fill Text    css=input[name=card_month]      ${credit_card}[month]
    Fill Text    css=input[name=card_year]       ${credit_card}[year]
    Fill Text    css=input[name=card_cvv]        ${credit_card}[cvv]
    Click    css=button[type=submit] >> text=Cadastrar

Search by name
    [Arguments]        ${name}
    Fill Text    css=input[placeholder^=Busque]    ${name}
    Wait For Elements State    css=strong >> text=Total: 1
    ...    visible    5

Should filter by name
    [Arguments]        ${name}
    Wait For Elements State    css=table tbody tr >> text=${name}
    ...    visible        5

Request removal
    [Arguments]        ${name}
    Click    xpath=//td[text()="${name}"]/..//button

Membership shold not be visible
    [Arguments]        ${name}

    Wait For Elements State    css=table tbody tr >> ${name}
    ...    detached        5

