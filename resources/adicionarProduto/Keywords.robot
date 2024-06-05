*** Settings ***
# configuração, lib, setup e teardown
Library   RequestsLibrary
Library   String
Resource  ./Endpoint.robot

*** Keywords ***
Adicionar um novo produto
    [Arguments]  ${tittle}    ${description}    ${price}    ${brand}

    &{headers}    Create Dictionary    Content-type=application-json
    &{body}    Create Dictionary    tittle=${tittle}  description=${description}  price=${price}  brand=${brand}

    POST    url=${HOST}/${ADD_NEW_PRODUCT}    headers=&{headers}    json=&{body}    expected_status=201