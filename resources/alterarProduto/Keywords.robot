*** Settings ***
# configuração, lib, setup e teardown
Library   RequestsLibrary
Library   String
Resource  ./Endpoint.robot

*** Keywords ***
Atualizar um produto existente
    [Arguments]  ${id}  ${price}

    &{headers}    Create Dictionary    Content-type=application-json
    &{body}    Create Dictionary    price=${price}

    ${UPDATE_PRODUCT}    Replace String    ${UPDATE_PRODUCT}    id-product  ${id}

    PUT  url=${HOST}/${UPDATE_PRODUCT}  headers=&{headers}   json=&{body}    expected_status=200
