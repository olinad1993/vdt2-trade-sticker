*** Settings ***
Documentation    Arquivo principal do Projeto

Library    Browser

Resource    pages/login.resource
Resource    pages/dash.resource

*** Keywords ***
Do Login
   
    Go To Login Page
    Submit Credentials    papito@gmail.com    vaibrasil
    User logged in

Start Test
    New Browser     headless=False

Finish Test
    Sleep    1 
    Take Screenshot 
      