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

Do not send password credentials
    [Arguments]    ${email}

    Fill Text     input[name=email]        ${email}
    Click         css=button >> text=Entrar

Do not send without email credentials
    [Arguments]    ${senha}

    Fill Text     input[name=password]    ${senha}
    Click         css=button >> text=Entrar

Do not send without credentials
    Click         css=button >> text=Entrar


Toast Message Shold be
    [Arguments]    ${expect_message}

    ${LOCATOR}    
    ...            Set Variable
    ...            css=.Toastify__toast-body div >> text=${expect_message}
    Wait For Elements State    ${LOCATOR}    visible    1 


Toast message shold be secret password
    [Arguments]    ${not_passoword}

    ${LOCATOR}    Set Variable
    ...           css=.Toastify__toast-body div >> text=${not_passoword} 
    Wait For Elements State    ${LOCATOR}     visible    1        

Toast message inform email should be   
     [Arguments]    ${not_email}

     ${LOCATOR}    Set Variable
     ...           css=.Toastify__toast-body div >> text=${not_email}           
     Wait For Elements State    ${LOCATOR}    visible    1   


Shold Be all Credentials
    [Arguments]    ${credentials}

    ${LOCATOR}    Set Variable
    ...           css=.Toastify__toast-body div >> text=${credentials}  
    Wait For Elements State    ${LOCATOR}   visible    1    