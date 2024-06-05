*** Settings ***
# configuração, lib, setup e teardown
Library   RequestsLibrary
Library   String
Resource  ./Endpoints.robot

*** Keywords ***
Buscar todos os produtos
    GET   url=${HOST}/${GET_ALL_PRODUCTS}    expected_status=200

Buscar um único produto por id
    [Arguments]  ${id}
    ${GET_SINGLE_PRODUCT}=   Replace String    ${GET_SINGLE_PRODUCT}   {id}  ${id}
    ${response}=   GET    url=${HOST}/${GET_SINGLE_PRODUCT}
    ${product}=    Set Variable  ${response.json()}
    Should Be Equal As Strings  ${product['id']}    ${id}

Buscar produto por query de busca
    [Arguments]  ${query}
    ${GET_SEARCH_PRODUCTS}=  Replace String    ${GET_SEARCH_PRODUCTS}   {query}   ${query}
    GET  url=${HOST}/${GET_SEARCH_PRODUCTS}    expected_status=200