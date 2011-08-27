module CucumberCinema
  module ViewSelectStrategy

    def self.take_screenshot?(request)
      return false unless request
      current_shot = "#{request.filtered_parameters["controller"]}-#{request.filtered_parameters["action"]}-#{request.method}"
      if !$cucumber_cinema_screenshots[current_shot]
        $cucumber_cinema_screenshots[current_shot] = 1
        true
      else
        false
      end
    end

    def self.new_movie(options={})
      if ENV['CUCUMBER_CINEMA']
        $cucumber_cinema_screenshots = {}
        $cucumber_cinema_emails = {}
        create_screenhot_dir(options)
        $cucumber_cinema_prefix = options[:prefix].present? ? options[:prefix] : "take"
        $cucumber_cinema_action_shots=[]
        $cucumber_cinema_all_screenshots=[]
      end
    end

    protected

    def self.create_screenhot_dir(options)
      $cucumber_cinema_dir_name = "#{Time.new.strftime("%Y%m%d%H%M%S")}"
      $cucumber_cinema_location=options[:location] || "#{Rails.root}/tmp/screenshots/"
      $cucumber_cinema_link=options[:link_location] || "#{Rails.root}/tmp/latest_screenshots"
      Dir.mkdir("#{$cucumber_cinema_location}") unless Dir.exist?($cucumber_cinema_location)

      File.delete($cucumber_cinema_link) if File.exists?($cucumber_cinema_link)
      `ln -s #{$cucumber_cinema_location}/#{$cucumber_cinema_dir_name} #{$cucumber_cinema_link} `
    end

  end
end
