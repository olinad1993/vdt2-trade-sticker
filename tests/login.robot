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
    Submit Credentials        papito@gmail.com    abc123 
    Toast Message Shold be    Credenciais inválidas, tente novamente!

# Deve exibir notificacao toaster se a senha nao for preenchida    
Não Deve logar sem a senha preenchida
    [Tags]    senha_nao_preenchida

    Go To Login Page  
    Do not send password credentials          papito@gmail.com  
    Toast message shold be secret password    Por favor, informe a sua senha secreta!

# Deve exibir notificacao toaster se o email nao for preenchido
Não Deve logar sem o email preenchido
    [Tags]    email_nao_preenchido

    Go To Login Page
    Do not send without email credentials     vaibrasil
    Toast message inform email should be      Por favor, informe o seu email!

# Deve exibir notiticacao toaster se email e senha nao forem preenchidos
Não deve logar sem as credenciais preenchidas
    [Tags]    credenciais

    Go To Login Page
    Do not send without credentials
    Shold Be all Credentials    Por favor, informe suas credenciais!