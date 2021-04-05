*** Settings ****
Resource        ../resource/Resource.robot


Test Setup      Abrir Navegador
Test Teardown   Fechar Navegador 

*** Test Cases ***

Cenário 01: Pesquisar produto existente
    Dado que estou na pagina home
    Quando eu pesquisar pelo produto Blouse
    Então o produto Blouse deve ser listado na página de resultado da busca

Cenário 02: Pesquisar produto não existente
    Dado que estou na pagina home
    Quando eu pesquisar pelo produto ItemNaoExistente
    Então a página deve exibir a mensagem No results were found for your search "ItemNaoExistente"

*** Keywords ***

Dado que estou na pagina home
    Acessar a párgina home do site

Quando eu pesquisar pelo produto ${produto}
   Digitar o nome do produto ${produto} no campo de Pesquisar
   Clicar no botão Pesquisar

Então o produto ${produto} deve ser listado na página de resultado da busca
    Conferir se o produto ${produto} foi listado no site

Então a página deve exibir a mensagem ${mensagemAlerta}
    Conferir mensagem de erro ${mensagemAlerta}

