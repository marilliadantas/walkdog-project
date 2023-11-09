*** Settings ***
Documentation    Suite de testes de cadastro de dog walker

Resource        ../resources/base.resource

*** Test Cases ***
Deve poder cadastrar um novo dog walker
    # Massa de dados:
    ${name}             Set Variable    Fernando Papito
    ${email}            Set Variable    papito@gmail.com
    ${cpf}              Set Variable    00000014141
    ${cep}              Set Variable    04534011
    ${addressNumber}    Set Variable    1000
    ${addressDetails}   Set Variable    Apto 28
    ${addressStreet}    Set Variable    Rua Joaquim Floriano
    ${addressDistrict}  Set Variable    Itaim Bibi
    ${addressCityUf}    Set Variable    São Paulo/SP
    ${cnh}              Set Variable    toretto.jpg

    Go to signup page
    Fill signup form    ${name}    ${email}    ${cpf}    ${cep}    ${addressStreet}     ${addressDistrict}     ${addressCityUf}    ${addressNumber}    ${addressDetails}    ${cnh}
    Sleep      10
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.


