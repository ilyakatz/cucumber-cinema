module CucumberCinema
  class PathStrategy

    #determines whether or not to take a screenshot
    def take_screenshot?(scenario, options={})
      debugger
      current_url=options[:url]
      #always take screenshots of scenario's with tag @action
      if scenario and scenario.source_tag_names.include?("@action")
        return true
      end
      if current_url
        #remove parameters and such
        path = URI.parse(current_url).path
        #remove model id's
        path = current_url.gsub(/\d+/, '')
        !BODY_HASHES.include?(path)
      else
        true
      end
    end

  end
end