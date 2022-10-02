*** Settings ***
Documentation    Dashboard Pages

Library    Browser

*** Keywords ***
User logged in
    ${TITULO_CABECALHO}    Set Variable
    ...                    Aquela figurinha incrível a um clique de distância.
   Get Text    
   ...                     css=.header-content strong     equal    ${TITULO_CABECALHO}

Search User
    [Arguments]    ${target}

    Fill Text    //input[@placeholder='Busque aqui...']    ${target}   
    Click        css=button >> text=Buscar
   
   

Select Sticker 
    [Arguments]    ${name}

     Click        //img[contains(@alt,'${name}')]

 Get in touch

    Click        css=button >> text=Entrar em Contato

Whatsapp Sticker Message
    [Arguments]    ${sticker_name}    
    
    ${expected_message}    Set Variable     
    ...    Oi, achei o seu contato no Trade Sticker. Estou interessado(a) na figurinha do ${sticker_name}, bora negociar?

    Switch Page    NEW

    Wait For Elements State
    ...    css=p >> text=${expected_message}
    ...    visible
    ...    5000