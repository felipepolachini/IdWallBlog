#language: pt

Funcionalidade: Pesquisar um post no blog da Idwall

@searchPost
Esquema do Cenario: Pesquisar um post no blog da Idwall pelo titulo
    Quando acesso o blog da Idwall
    E pesquiso um post informando um título existente "<article>"
    Então deve exibir o post pesquisado em uma página de resultados

    Exemplos: 
    
    |article|
    |Blockchain continua crescendo e investimentos devem triplicar até 2022|