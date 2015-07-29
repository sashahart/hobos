require 'mechanize'
module Wanderers
  WANDERERS_URL = "http://www.e-hobo.com/hoboes/"
  class Api
    def initialize
      @browser = Browser.new.browser
    end

    def wanderer
      clean_name(try_wanderer(false))
    end

    def wanderer_by_id id
      begin
        clean_name(@browser.get("#{WANDERERS_URL}#{id}").at('span').children.last.to_s)
      rescue
        ''
      end
    end

    private
    def try_wanderer found_wanderer
      unless found_wanderer
        resp = @browser.get("#{WANDERERS_URL}#{rand(1..700)}").at('span').children.last.to_s
        if resp == ""
          try_wanderer false
        else
          found_wanderer = true
        end
      end
      resp
    end
    
    def clean_name wanderer_name
      wanderer_name.gsub!(/\d/, '')
      wanderer_name.gsub!('#', '')
      wanderer_name.gsub!(': ', '')
      wanderer_name
    end
  end

  class Browser
    attr_accessor :browser

    def initialize
      @browser = Mechanize.new
    end
  end
end

