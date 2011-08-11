module CucumberCinema
  class Camera

    def take_screenshot(body)
      create_directory($cucumber_cinema_dir_name)
      filename="#{$cucumber_cinema_dir_name}/#{$cucumber_cinema_prefix}-#{rand(10**10)}"
      Capybara.save_page(body.to_str, "#{filename}.html")
      `wkhtmltoimage #{Capybara.save_and_open_page_path}/#{filename}.html #{$cucumber_cinema_location}/#{filename}.png`
    end

    protected

    def create_directory(screenshot_dir_name)
      Dir.mkdir(Capybara.save_and_open_page_path) if !Dir.exist?(Capybara.save_and_open_page_path)
      if !Dir.exist?("#{Capybara.save_and_open_page_path}/#{screenshot_dir_name}")
        Dir.mkdir("#{Capybara.save_and_open_page_path}/#{screenshot_dir_name}")
      end
      Dir.mkdir("#{$cucumber_cinema_location}") if !Dir.exist?($cucumber_cinema_location)
      if !Dir.exist?("#{$cucumber_cinema_location}/#{screenshot_dir_name}")
        Dir.mkdir("#{$cucumber_cinema_location}/#{screenshot_dir_name}")
      end
    end

  end
end