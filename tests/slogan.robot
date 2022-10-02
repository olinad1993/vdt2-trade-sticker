*** Settings ***
Library   Browser
Documentation    Verificar se o site é acessado

Resource    ../resources/main.resource

Test Setup    Start Test
Test Teardown    Finish Test

*** Variables ***
${SLOGAN}    Conectando colecionadores de figurinhas da copa.

*** Test Cases ***
Deve validar o slogan da home page
    New Browser     chromium    headless=false
    New Page        https://trade-sticker-dev.vercel.app/
    Get Text        .logo-container h2    contains    ${SLOGAN}     