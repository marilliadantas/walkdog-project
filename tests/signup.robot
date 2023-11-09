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

    Start session    
    Go to signup page
    Fill signup form    ${name}    ${email}    ${cpf}    ${cep}    ${addressStreet}     ${addressDistrict}     ${addressCityUf}    ${addressNumber}    ${addressDetails}    ${cnh}
    # Sleep      10
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.
    Finish session

Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]                required

    # ${dog_walker}       Create Dictionary
    # ${name}             Set Variable    Fernando Papito
    # ${email}            Set Variable    papito@gmail.com
    # ${cpf}              Set Variable    00000014141
    # ${cep}              Set Variable    04534011
    # ${addressNumber}    Set Variable    1000
    # ${addressDetails}   Set Variable    Apto 28
    # ${addressStreet}    Set Variable    Rua Joaquim Floriano
    # ${addressDistrict}  Set Variable    Itaim Bibi
    # ${addressCityUf}    Set Variable    São Paulo/SP
    # ${cnh}              Set Variable    toretto.jpg

    Start session    
    Go to signup page
    # Fill signup form    ${name}    ${email}    ${cpf}    ${cep}    ${addressStreet}     ${addressDistrict}     ${addressCityUf}    ${addressNumber}    ${addressDetails}    ${cnh}
    # Fill signup form    ${dog_walker}
    # Sleep      10

    Submit signup form

    Alert should be         Informe o seu nome completo
    Alert should be         Informe o seu melhor email
    Alert should be         Informe o seu CPF
    Alert should be         Informe o seu CEP
    Alert should be         Informe um número maior que zero
    Alert should be         Adcione um documento com foto (RG ou CHN)

    Finish session

Não deve cadastrar se o cpf for incorreto
    [Tags]        cpf_invalido
    # Massa de dados:
    ${name}             Set Variable    Fernando Papito
    ${email}            Set Variable    papito@gmail.com
    ${cpf}              Set Variable    000000141aa
    ${cep}              Set Variable    04534011
    ${addressNumber}    Set Variable    1000
    ${addressDetails}   Set Variable    Apto 28
    ${addressStreet}    Set Variable    Rua Joaquim Floriano
    ${addressDistrict}  Set Variable    Itaim Bibi
    ${addressCityUf}    Set Variable    São Paulo/SP
    ${cnh}              Set Variable    toretto.jpg

    Start session    
    Go to signup page
    Fill signup form    ${name}    ${email}    ${cpf}    ${cep}    ${addressStreet}     ${addressDistrict}     ${addressCityUf}    ${addressNumber}    ${addressDetails}    ${cnh}
    # Sleep      10
    Submit signup form
    Alert should be           CPF inválido    
    Finish session

    


