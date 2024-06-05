*** Settings ***
Library    RequestsLibrary
Library    String

*** Variables ***
${HOST}     https://dummyjson.com
${UPDATE_PRODUCT}    products/id-product


*** Keywords ***
Atualizar um produto existente
    [Arguments]  ${id}  ${price}

    &{headers}    Create Dictionary    Content-type=application-json
    &{body}    Create Dictionary    price=${price}

    ${UPDATE_PRODUCT}    Replace String    ${UPDATE_PRODUCT}    id-product  ${id}

    PUT  url=${HOST}/${UPDATE_PRODUCT}  headers=&{headers}   json=&{body}    expected_status=200

*** Test Cases ***
TC01- Deverá atualizar um produto existente
    Atualizar um produto existente    id=4    price=5000