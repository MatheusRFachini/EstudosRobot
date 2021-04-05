*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          http:\\automationpractice.com

###Setup e TearDown ###
*** Keywords ***
Abrir Navegador
    Open Browser   about:blank   ${browser}

Fechar Navegador
    Capture Page Screenshot
    Close Browser         

### Passo a Passo ###
Acessar a párgina home do site
    Go To               http:\\automationpractice.com
    Title Should Be     My Store

Digitar o nome do produto ${produto} no campo de Pesquisar
    Input Text          name=search_query        ${produto}    

Clicar no botão Pesquisar
    Click Element       name=submit_search

Conferir se o produto ${produto} foi listado no site
    Wait Until Element Is Visible               css=#center_column > h1
    Title Should Be                             Search - My Store
    Page Should Contain Image                   xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Page Should Contain Link                    xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${produto}")]

Conferir mensagem de erro ${mensagemAlerta}
    Wait Until Element is Visible               xpath=//*[@id="center_column"]/p[@class="alert alert-warning"]
    Element Text Should Be                      xpath=//*[@id="center_column"]/p[@class="alert alert-warning"]  ${mensagemAlerta}
