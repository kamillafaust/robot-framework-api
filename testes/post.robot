*** Settings ***
Resource  ../resources/adicionarProduto/Keywords.robot

*** Test Cases ***
TC01- Criar um novo produto
    Adicionar um novo produto    tittle=Iphone 14    description=Lançamento Apple    price=7000  brand=Apple