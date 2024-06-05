*** Settings ***
Resource  ../resources/buscarProduto/Keywords.robot

*** Test Cases ***
TC01- Realizar a busca de todos os produtos
    Buscar todos os produtos

TC02- Realizar a busca de um único produto por id
    Buscar um único produto por id     4
  
TC03- Realizar a busca de um produto por query de busca
    Buscar produto por query de busca    mobile-accessories