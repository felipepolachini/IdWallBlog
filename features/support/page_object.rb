Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file }

module PageObjects

    def home
        @home ||= IdWallHomePage.new
    end

    def searchPage
        @searchPage ||= SearchPage.new
    end    
    
end