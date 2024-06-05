*** Settings ***
Resource  ../resources/alterarProduto/Keywords.robot

*** Test Cases ***
TC01- Deverá atualizar um produto existente
    Atualizar um produto existente    id=4    price=5000