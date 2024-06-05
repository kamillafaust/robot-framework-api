*** Settings ***
Resource  ../host.robot

*** Variables ***
#Rotas
${GET_ALL_PRODUCTS}  products
${GET_SINGLE_PRODUCT}   products/{id}
${GET_SEARCH_PRODUCTS}  products/search?q={query}