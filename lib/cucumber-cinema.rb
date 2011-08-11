require 'capybara/util/save_and_open_page'
require 'cucumber_cinema/camera'
require 'cucumber_cinema/view_strategy'
module CucumberCinema

  def screenshot_emails(options)
    current_emails = ActionMailer::Base.deliveries.uniq { |x| x.subject }
    new_emails = current_emails.select { |k, v| !$cucumber_cinema_emails.key?(k.subject) }
    new_emails.each { |k, v| $cucumber_cinema_emails[k.subject]=v }
    new_emails.each_with_index do |e, i|
      CucumberCinema::Camera.new(options).take_screenshot("<h1>#{e.subject}</h1><pre>#{e}</pre><hr />")
    end
  end

end

#DOESN' WORK WITH Spork Yet
module ActionView
  module Rendering

    alias_method :render_old, :render

    def render(options = {}, locals = {}, &block)
      if CucumberCinema::ViewSelectStrategy.take_screenshot?(request)
        body = render_old(options, locals, &block)
        ::CucumberCinema::Camera.new.take_screenshot(body)
      end
      render_old(options, locals, &block)
    end
  end
end

