require 'capybara/util/save_and_open_page'
require 'cucumber_cinema/camera'
require 'cucumber_cinema/path_strategy'
module CucumberCinema

  BODY_HASHES=[]
  SCREENSHOT_DIR_NAME=["#{Time.new.strftime("%Y%m%d%H%M%S")}"]

  def embed_screenshot(scenario=nil,options={})

    if take_screenshot?(scenario,:url=>current_url)
      BODY_HASHES<<path
      CucumberCinema::Camera.new(options).take_screenshot(body)
    end

  end

  def self.new_movie
    BODY_HASHES.clear
    SCREENSHOT_DIR_NAME.clear
    SCREENSHOT_DIR_NAME<<"#{Time.new.strftime("%Y%m%d%H%M%S")}"
  end

  protected


  #determines whether or not to take a screenshot
  def take_screenshot?(scenario,options)
    CucumberCinema::PathStrategy.new.take_screenshot?(scenario, options)
  end

end

World(CucumberCinema)