require 'capybara/util/save_and_open_page'
require 'cucumber_cinema/camera'
require 'cucumber_cinema/view_strategy'
require 'mini_magick'
module CucumberCinema

  def screenshot_emails(options)
    if ENV['CUCUMBER_CINEMA']
      current_emails = ActionMailer::Base.deliveries.uniq { |x| x.subject }
      new_emails = current_emails.select { |k, v| !$cucumber_cinema_emails.key?(k.subject) }
      new_emails.each { |k, v| $cucumber_cinema_emails[k.subject]=v }
      new_emails.each_with_index do |e, i|
        CucumberCinema::Camera.new(options).take_screenshot("<h1>#{e.subject}</h1><pre>#{e}</pre><hr />")
      end
    end
  end

end

#DOESN' WORK WITH Spork Yet
if ENV['CUCUMBER_CINEMA']
  module ActionView
    module Rendering

      alias_method :render_old, :render

      def render(options = {}, locals = {}, &block)
        if CucumberCinema::ViewSelectStrategy.take_screenshot?(request)
          body = render_old(options, locals, &block)
          ::CucumberCinema::Camera.new.take_screenshot(body, :name=>screenshot_name)
        end
        render_old(options, locals, &block)
      end

      protected

      def screenshot_name
        name = "#{request.filtered_parameters["controller"]}-#{request.filtered_parameters["action"]}-#{request.method}"
        name.gsub!(/[^0-9a-z\-]/i, '-')
        name.downcase!
        name
      end

    end
  end
end