*** Settings ***
# configuração, lib, setup e teardown
Library   RequestsLibrary
Library   String
Resource  ./Endpoint.robot

*** Keywords ***
Deletar um produto existente
    [Arguments]  ${id}

    &{headers}    Create Dictionary    Content-type=application-json

    ${DELETE_PRODUCT}    Replace String    ${DELETE_PRODUCT}    id-product  ${id}

    DELETE  url=${HOST}/${DELETE_PRODUCT}  headers=&{headers}     expected_status=200