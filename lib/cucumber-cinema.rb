BODY_HASHES=[]
SCREENSHOT_DIR_NAME="#{Time.new.strftime("%Y%m%d%H%M%S")}"

module Screenshots
  if Cucumber::OS_X
    def embed_screenshot()
      #remove model id's
      path = current_path.gsub(/\d+/, '') if current_path
      if !BODY_HASHES.include?(path)
        BODY_HASHES<<path
        require 'capybara/util/save_and_open_page'
        if !Dir.exist?("#{Rails.root}/tmp/capybara/#{SCREENSHOT_DIR_NAME}")
          Dir.mkdir("#{Rails.root}/tmp/capybara") if !Dir.exist?("#{Rails.root}/tmp/capybara")
          Dir.mkdir("#{Rails.root}/tmp/capybara/#{SCREENSHOT_DIR_NAME}")
        end
        filename="#{SCREENSHOT_DIR_NAME}/rentini-#{rand(10**10)}"
        Capybara.save_page(body, "#{filename}.html")
        `wkhtmltoimage #{Rails.root}/tmp/capybara/#{filename}.html #{Rails.root}/tmp/capybara/#{filename}.png`
      end

    end
  else
    def embed_screenshot()
    end
  end
end
World(Screenshots)