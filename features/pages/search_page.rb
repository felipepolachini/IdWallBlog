require_relative 'subscription_iframe.rb'

class SearchPage < SitePrism::Page

     set_url "/?s="

     element :titleBar,:xpath, "//h1[contains(text(),'#{$articleTitle}')]"

     element :articleTitle,:xpath, "//a[contains(text(),'#{$articleTitle}')]"

     iframe :subscription , Subscription, '.mailmunch-popover-iframe'

     def closeIframe
        subscription do |button|
          button.closeIcon.click
        end  
     end

     def checkTitleBar
        return has_titleBar?
     end

     def checkArticleTitle
        return has_articleTitle?
     end   
    
end