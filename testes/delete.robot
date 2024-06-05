*** Settings ***
Library    RequestsLibrary
Library    String

*** Variables ***
${HOST}     https://dummyjson.com
${DELETE_PRODUCT}    products/id-product


*** Keywords ***
Deletar um produto existente
    [Arguments]  ${id}

    &{headers}    Create Dictionary    Content-type=application-json

    ${DELETE_PRODUCT}    Replace String    ${DELETE_PRODUCT}    id-product  ${id}

    DELETE  url=${HOST}/${DELETE_PRODUCT}  headers=&{headers}     expected_status=200

*** Test Cases ***
TC01- Deverá deletar um produto existente
    Deletar um produto existente    id=4