*** Settings ****
Resource        ../resource/Resource.robot


Test Setup      Abrir Navegador
Test Teardown   Fechar Navegador 

*** Test Cases ***

Caso de Teste 01: Pesquisar produto existente
    Acessar a párgina home do site
    Digitar o nome do produto Blouse no campo de Pesquisar
    Clicar no botão Pesquisar
    Conferir se o produto Blouse foi listado no site



Caso de Teste 02: Pesquisar produto não existente
    Acessar a párgina home do site
    Digitar o nome do produto ItemNaoExistente no campo de Pesquisar
    Clicar no botão Pesquisar
    Conferir mensagem de erro No results were found for your search "ItemNaoExistente"

    
*** Keywords ***