*** Settings ***
Documentation        Arquivo principal do projeto robot

Library        Browser
Library        ../../libs/Account.py
Library        ../../libs/Database.py
Library        JSONLibrary

Resource        ../resources/pages/Landing.resource
Resource        ../resources/pages/Welcome.resource
Resource        ../resources/pages/Login.resource
Resource        ../resources/pages/Accounts.resource
Resource        ../resources/pages/components/Toast.resource
Resource        ../resources/pages/components/BoxNotice.resource
Resource        ../resources/pages/Memberships.resource
Resource        ../resources/pages/components/Navbar.resource
Resource        ../resources/pages/components/Modal.resource

*** Variables ***

${ADMIN_EMAIL}       sac@smartbit.com   
${ADMIN_PASS}        pwd123
*** Keywords ***

Sign In Admin

    Go to login page
    Submit login form    ${ADMIN_EMAIL}     ${ADMIN_PASS}
    User is logged in    ${ADMIN_EMAIL} 

Start Session
    New Browser        browser=chromium    headless=False
    New Page        http://localhost:3000

Get JSON Fixture
    [Arguments]        ${file_name}        ${scenario}

    ${data}        Load Json From File    
    ...        ${EXECDIR}/resources/fixtures/${file_name}.json
    ...        encoding=utf-8

    RETURN       ${data}[${scenario}]


