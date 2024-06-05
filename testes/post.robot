*** Settings ***
Library    RequestsLibrary
Library    String

*** Variables ***
${HOST}     https://dummyjson.com
${ADD_NEW_PRODUCT}    products/add

*** Keywords ***
Adicionar um novo produto
    [Arguments]  ${tittle}    ${description}    ${price}    ${brand}

    &{headers}    Create Dictionary    Content-type=application-json
    &{body}    Create Dictionary    tittle=${tittle}  description=${description}  price=${price}  brand=${brand}

    POST    url=${HOST}/${ADD_NEW_PRODUCT}    headers=&{headers}    json=&{body}    expected_status=201

*** Test Cases ***
TC01- Criar um novo produto
    Adicionar um novo produto    tittle=Iphone 14    description=Lançamento Apple    price=7000  brand=Apple