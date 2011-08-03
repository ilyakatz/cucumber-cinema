module CucumberCinema

  BODY_HASHES=[]
  SCREENSHOT_DIR_NAME=["#{Time.new.strftime("%Y%m%d%H%M%S")}"]

  if Cucumber::OS_X
    def embed_screenshot(scenario=nil)

      if take_screenshot?(scenario)
        BODY_HASHES<<path
        require 'capybara/util/save_and_open_page'
        take_screenshot
      end

    end
  else
    def embed_screenshot()
    end
  end


  def self.new_movie
    BODY_HASHES.clear
    SCREENSHOT_DIR_NAME.clear
    SCREENSHOT_DIR_NAME<<"#{Time.new.strftime("%Y%m%d%H%M%S")}"
  end

  protected

  def take_screenshot
    screenshot_dir_name = SCREENSHOT_DIR_NAME.first
    if !Dir.exist?("#{Rails.root}/tmp/capybara/#{screenshot_dir_name}")
      Dir.mkdir("#{Rails.root}/tmp/capybara") if !Dir.exist?("#{Rails.root}/tmp/capybara")
      Dir.mkdir("#{Rails.root}/tmp/capybara/#{screenshot_dir_name}")
    end
    filename="#{screenshot_dir_name}/rentini-#{rand(10**10)}"
    Capybara.save_page(body, "#{filename}.html")
    `wkhtmltoimage #{Rails.root}/tmp/capybara/#{filename}.html #{Rails.root}/tmp/capybara/#{filename}.png`
  end

  #determines whether or not to take a screenshot
  def take_screenshot?(scenario)
    #always take screenshots of scenario's with tag @action
    if scenario and scenario.source_tag_names.include?("@action")
      return true
    end
    #remove model id's
    if current_path
      path = current_path.gsub(/\d+/, '')
      return !BODY_HASHES.include?(path)
    end
  end

end
World(CucumberCinema)