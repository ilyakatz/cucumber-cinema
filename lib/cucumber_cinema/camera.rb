module CucumberCinema
  class Camera

    def initialize(options={})
      if options[:location]
        @location=options[:location]
      else
        @location="#{Rails.root}/tmp/screenshots/"
      end
    end

    def take_screenshot(body)
      screenshot_dir_name = SCREENSHOT_DIR_NAME.first
      create_directory(screenshot_dir_name)
      filename="#{screenshot_dir_name}/rentini-#{rand(10**10)}"
      Capybara.save_page(body, "#{filename}.html")
      `wkhtmltoimage #{Capybara.save_and_open_page_path}/#{filename}.html #{@location}/#{filename}.png`
    end

    protected

    def create_directory(screenshot_dir_name)
      Dir.mkdir(Capybara.save_and_open_page_path) if !Dir.exist?(Capybara.save_and_open_page_path)
      if !Dir.exist?("#{Capybara.save_and_open_page_path}/#{screenshot_dir_name}")
        Dir.mkdir("#{Capybara.save_and_open_page_path}/#{screenshot_dir_name}")
      end
      Dir.mkdir("#{@location}") if !Dir.exist?(@location)
      Dir.mkdir("#{@location}/#{screenshot_dir_name}") if !Dir.exist?("#{@location}/#{screenshot_dir_name}")
    end

  end
end