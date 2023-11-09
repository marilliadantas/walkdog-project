*** Settings ***
Documentation        Ações, steps e elementos da funcionalidade de cadastro

Library        Browser

*** Keywords ***
Go to signup page
    Click       css=a[href="/signup"]

    Wait For Elements State    form h1    visible    5000
    Get Text    form h1     equal    Faça seu cadastro

Fill signup form
    [Arguments]    ${name}    ${email}    ${cpf}    ${cep}    ${addressStreet}     ${addressDistrict}     ${addressCityUf}    ${addressNumber}    ${addressDetails}    ${cnh}
    Fill Text    css=input[name=name]                            ${name}
    Fill Text    css=input[name=email]                           ${email}
    Fill Text    css=input[name=cpf]                             ${cpf}
    Fill Text    css=input[name=cep]                             ${cep}

    Click        css=input[type=button][value$=CEP]    

    Get Property    css=input[name=addressStreet]       value    equal    ${addressStreet}
    Get Property    css=input[name=addressDistrict]     value    equal    ${addressDistrict}
    Get Property    css=input[name=addressCityUf]       value    equal    ${addressCityUf}

    Fill Text    css=input[name=addressNumber]                   ${addressNumber}
    Fill Text    css=input[name=addressDetails]                  ${addressDetails}  

    Upload File By Selector    css=input[type=file]              ${EXECDIR}/resources/fixtures/${cnh}

Submit signup form
    Click                      css=.button-register  

Popup should be
    [Arguments]        ${expected_text}
    Wait For Elements State    css=.swal2-html-container     visible    5
    Get Text                   css=.swal2-html-container     equal    Recebemos o seu cadastro e em breve retornaremos o contato.

    # Sleep    5

Alert should be
    [Arguments]        ${expetecd_text}

    Wait For Elements State        css=.alert-error >> text=${expetecd_text}
    ...    visible        5