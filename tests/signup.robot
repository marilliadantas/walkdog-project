*** Settings ***
Documentation    Suite de testes de cadastro de dog walker

Resource        ../resources/base.resource

Test Setup           Start session
Test Teardown        Finish session

*** Test Cases ***
Deve poder cadastrar um novo dog walker
    [Tags]        smoke

    ${dog_walker}            Create Dictionary
    ...    name=Fernando Papito
    ...    email=papito@gmail.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    number=1000
    ...    details=Apto 28
    ...    cnh=toretto.jpg
 
    Go to signup page
    Fill signup form     ${dog_walker}
    # Sleep      10
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]                required

    ${dog_walker}            Create Dictionary
    # ...    name=Fernando Papito
    # ...    email=papito@gmail.com
    # ...    cpf=00000014141
    # ...    cep=04534011
    # ...    street=Rua Joaquim Floriano
    # ...    district=Itaim Bibi
    # ...    city_uf=São Paulo/SP
    # ...    number=1000
    # ...    details=Apto 28
    # ...    cnh=toretto.jpg

    Go to signup page
    # Fill signup form     ${dog_walker}
    # Sleep      10
    Submit signup form

    Alert should be         Informe o seu nome completo
    Alert should be         Informe o seu melhor email
    Alert should be         Informe o seu CPF
    Alert should be         Informe o seu CEP
    Alert should be         Informe um número maior que zero
    Alert should be         Adcione um documento com foto (RG ou CHN)

Não deve cadastrar se o cpf for incorreto
    [Tags]        cpf_invalid
    
    ${dog_walker}            Create Dictionary
    ...    name=Fernando Papito
    ...    email=papito@gmail.com
    ...    cpf=000000141aaa
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    number=1000
    ...    details=Apto 28
    ...    cnh=toretto.jpg
  
    Go to signup page
    Fill signup form     ${dog_walker}
    # Sleep      10
    Submit signup form
    Alert should be           CPF inválido

Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    [Tags]        aservice
    
    ${dog_walker}            Create Dictionary
    ...    name=Dominic Toretto
    ...    email=toretto@gmail.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    number=1000
    ...    details=Apto 28
    ...    cnh=toretto.jpg
    
    Go to signup page
    Fill signup form     ${dog_walker}
    # Sleep      5
    Additional Service    Cuidar
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo dog walker que sabe adestrar pets
    [Tags]        aservice
    
    ${dog_walker}            Create Dictionary
    ...    name=Papito Fernando
    ...    email=papito@yahoo.com
    ...    cpf=00000014141
    ...    cep=04534011
    ...    street=Rua Joaquim Floriano
    ...    district=Itaim Bibi
    ...    city_uf=São Paulo/SP
    ...    number=1000
    ...    details=Apto 28
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form     ${dog_walker}
    # Sleep      5
    Additional Service    Adestrar
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.



