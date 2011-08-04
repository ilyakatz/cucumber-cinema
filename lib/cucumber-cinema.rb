require 'capybara/util/save_and_open_page'
require 'cucumber_cinema/camera'
require 'cucumber_cinema/path_strategy'
module CucumberCinema

  BODY_HASHES=[]
  SCREENSHOT_DIR_NAME=["#{Time.new.strftime("%Y%m%d%H%M%S")}"]
  EMAILS={}

  def embed_screenshot(scenario=nil, options={})

    if take_screenshot?(scenario, :url=>current_url)
      BODY_HASHES<<path
      CucumberCinema::Camera.new(options).take_screenshot(body)
    end

    collect_emails(options)
    
  end

  def self.new_movie
    BODY_HASHES.clear
    SCREENSHOT_DIR_NAME.clear
    SCREENSHOT_DIR_NAME<<"#{Time.new.strftime("%Y%m%d%H%M%S")}"
    EMAILS.clear
  end

  protected


  #determines whether or not to take a screenshot
  def take_screenshot?(scenario, options)
    CucumberCinema::PathStrategy.new.take_screenshot?(scenario, options)
  end

  def collect_emails(options)
    current_emails = ActionMailer::Base.deliveries.uniq{|x|x.subject}
    new_emails = current_emails.select { |k, v| !EMAILS.key?(k.subject) }
    new_emails.each { |k, v| EMAILS[k.subject]=v }
    new_emails.each_with_index do |e, i|
      CucumberCinema::Camera.new(options).take_screenshot("<h1>#{e.subject}</h1><pre>#{e}</pre><hr />")
    end
  end

end
