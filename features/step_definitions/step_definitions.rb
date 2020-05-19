Quando("acesso o blog da Idwall") do
  home.load
  raise "Não foi possível acessar o blog" unless expect(page).to have_current_path(CONFIG['URL'], url: true)
  end
  
  Quando("pesquiso um post informando um título existente {string}") do |article|
    home.searchArticle(article)
  end
  
  Então("deve exibir o post pesquisado em uma página de resultados") do
   searchPage.closeIframe
   raise "Resultado não encontrado" unless searchPage.checkTitleBar == true
   raise "Resultado não encontrado" unless searchPage.checkArticleTitle == true
  end