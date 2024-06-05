*** Settings ***
Resource  ../resources/deletarProduto/Keywords.robot

*** Test Cases ***
TC01- Deverá deletar um produto existente
    Deletar um produto existente    id=4