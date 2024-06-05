*** Settings ***
# configuração, lib, setup e teardown
Library   RequestsLibrary
Library   String

*** Variables ***
${HOST}   https://dummyjson.com

#Rotas
${GET_ALL_PRODUCTS}  products
${GET_SINGLE_PRODUCT}   products/id-produto
${GET_SEARCH_PRODUCTS}  products/search?q=phone

*** Keywords ***
Buscar todos os produtos
    GET   url=${HOST}/${GET_ALL_PRODUCTS}    expected_status=200

Buscar um único produto por id ${id}
    ${GET_SINGLE_PRODUCT}=   Replace String    ${GET_SINGLE_PRODUCT}   id-produto  ${id}
    ${response}=   GET    url=${HOST}/${GET_SINGLE_PRODUCT}
    ${product}=    Set Variable  ${response.json()}
    Should Be Equal As Strings  ${product['id']}    ${id}


Buscar produto por query de busca ${query}
    ${GET_SEARCH_PRODUCTS}=  Replace String    ${GET_SEARCH_PRODUCTS}   phone   ${query}
    GET  url=${HOST}/${GET_SEARCH_PRODUCTS}    expected_status=200

*** Test Cases ***
TC01- Realizar a busca de todos os produtos
    Buscar todos os produtos

TC02- Realizar a busca de um único produto por id
    Buscar um único produto por id 4
  
TC03- Realizar a busca de um produto por query de busca
    Buscar produto por query de busca mobile-accessories