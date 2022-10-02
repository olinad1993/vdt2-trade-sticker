*** Settings ***
Documentation    Login Page

Library    Browser


*** Keywords ***
Go To Login Page
    New Browser     chromium    headless=false
    New Page        https://trade-sticker-dev.vercel.app
    
Submit Credentials
    [Arguments]    ${email}    ${senha}

    Fill Text        input[name=email]        ${email}
    Fill Text        input[name=password]     ${senha}
    Click            css=button >> text=Entrar

Toast Message Shold be
    [Arguments]    ${expect_message}   

    ${LOCATOR}    
    ...            Set Variable
    ...            css=.Toastify__toast-body div >> text=${expect_message}
    Wait For Elements State    ${LOCATOR}    visible    1              
