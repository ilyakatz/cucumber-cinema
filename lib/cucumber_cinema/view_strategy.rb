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
      $cucumber_cinema_screenshots = {}
      $cucumber_cinema_dir_name = "#{Time.new.strftime("%Y%m%d%H%M%S")}"
      $cucumber_cinema_emails = {}
      $cucumber_cinema_location=options[:location] || "#{Rails.root}/tmp/screenshots/"
      $cucumber_cinema_prefix = options[:prefix].present? ? options[:prefix] : "take"
      $cucumber_cinema_action_shots=[]
    end

  end
end
