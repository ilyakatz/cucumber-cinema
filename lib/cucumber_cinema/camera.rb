module CucumberCinema
  class Camera

    def store_image(png_filename, html_filename, destination_dir)
      `wkhtmltoimage #{Capybara.save_and_open_page_path}/#{$cucumber_cinema_dir_name}/#{html_filename} #{destination_dir}/#{png_filename}`
    end

    def take_screenshot(body, options={})
      prepare($cucumber_cinema_dir_name)

      name = options[:name] || rand(10**10)
      html_filename="#{$cucumber_cinema_prefix}-#{name}.html"
      png_filename = "#{$cucumber_cinema_prefix}-#{name}.png"

      Capybara.save_page(body.to_str, "#{$cucumber_cinema_dir_name}/#{html_filename}")

      destination_dir ="#{$cucumber_cinema_location}/#{$cucumber_cinema_dir_name}"
      store_image(png_filename, html_filename, destination_dir)
      thumb = thumbnail(destination_dir, png_filename)

      store_hash(png_filename, name, thumb)
    end

    protected

    def prepare(screenshot_dir_name)
      Dir.mkdir(Capybara.save_and_open_page_path) if !Dir.exist?(Capybara.save_and_open_page_path)
      if !Dir.exist?("#{Capybara.save_and_open_page_path}/#{screenshot_dir_name}")
        Dir.mkdir("#{Capybara.save_and_open_page_path}/#{screenshot_dir_name}")
      end
      Dir.mkdir("#{$cucumber_cinema_location}") if !Dir.exist?($cucumber_cinema_location)
      if !Dir.exist?("#{$cucumber_cinema_location}/#{screenshot_dir_name}")
        Dir.mkdir("#{$cucumber_cinema_location}/#{screenshot_dir_name}")
      end
    end

    def thumbnail(dir, filename)
      thumbnail_name = "#{dir}/thumb_#{filename}"
      image = MiniMagick::Image.open("#{dir}/#{filename}")
      image.resize "100x100"
      image.write thumbnail_name
      "thumb_#{filename}"
    end

    def store_hash(file, name, thumb)
      $cucumber_cinema_all_screenshots<<
          {"thumbnail_url"=>"./#{thumb}", "url"=>"./#{file}", "name"=>name}
    end

  end
end