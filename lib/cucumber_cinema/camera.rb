module CucumberCinema
  class Camera

    def take_screenshot(body, options={})
      create_directory($cucumber_cinema_dir_name)
      name = options[:name] || rand(10**10)
      filename="#{$cucumber_cinema_dir_name}/#{$cucumber_cinema_prefix}-#{name}"
      Capybara.save_page(body.to_str, "#{filename}.html")
      screenshot_name="#{$cucumber_cinema_location}/#{filename}.png"
      $cucumber_cinema_all_screenshots<<
          {"thumbnail_url"=>screenshot_name, "url"=>screenshot_name, "name"=>name}
      `wkhtmltoimage #{Capybara.save_and_open_page_path}/#{filename}.html #{screenshot_name}`
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