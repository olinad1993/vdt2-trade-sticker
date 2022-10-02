*** Settings ***
Documentation    Login Testes

Resource   ../resources/main.resource

Test Setup       Start Test
Test Teardown    Finish Test

*** Test Cases ***
Deve logar com sucesso
    [Tags]        login_sucesso
    
    Go To Login Page
    Submit Credentials    papito@gmail.com    vaibrasil
    User logged in


Não Deve logar com senha incorreta
    [Tags]    senha_incorreta

    Go To Login Page
    Submit Credentials    papito@gmail.com    abc123 
    Toast Message Shold be    Credenciais inválidas, tente novamente!
    
    