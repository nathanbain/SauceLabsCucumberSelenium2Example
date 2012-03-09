#!/usr/bin/env ruby

require 'rubygems'
require 'selenium-webdriver'

def open_browser(operating_system, browser, browser_version)

  case browser.downcase
    when "ie"
      if operating_system.downcase == "linux"
        puts "Linux does not support IE. Defaulting to Firefox"
        caps_browser = Selenium::WebDriver::Remote::Capabilities.firefox
        caps_version = "7"
      else
        caps_browser = Selenium::WebDriver::Remote::Capabilities.ie
        caps_version = browser_version
      end
    when "firefox"
      caps_browser = Selenium::WebDriver::Remote::Capabilities.firefox
      caps_version = browser_version
    when "chrome"
      caps_browser = Selenium::WebDriver::Remote::Capabilities.chrome
      caps_version = ""
    else
      puts "Unknown Browser #{browser}. Defaulting to Firefox"
      caps_browser = Selenium::WebDriver::Remote::Capabilities.firefox
      caps_version = "7"
  end
    
  case operating_system.downcase
    when "xp"
      caps_platform = :XP
    when "win7"
      caps_platform = :VISTA
    when "linux"
      caps_platform = :LINUX
    else
      puts "Unknown OS #{operating_system}. Defaulting to XP"
      caps_platform = :XP
  end

  caps = caps_browser
  caps.version = caps_version
  caps.platform = caps_platform
  caps[:name] = "Testing Selenium 2 with Ruby on Sauce - OS: #{operating_system} - BROWSER: #{browser}"
  caps[:build] = "0"
  caps[:tags] = ["TestingSaucelabs"]
  caps["selenium-version"] = "2.12.0" # default 2.6.0
  caps["max-duration"] = 300 # The maximum duration per test
  caps["command-timeout"] = 180 # The maximum duration of a single command
  caps["idle-timeout"] = 180 # The maximum duration the browser should sit idle
  caps["custom-data"] = { "user"=>"Nathan" }
  
  caps["record-video"] = true # default true - Disables video recording to save time (but not much!)
  caps["record-screenshots"] = true # default true - Disables the step by step screenshot capture to save time (but not much!)
  caps["capture-html"] = true # default false - captures the html from each step
  caps["strip-se2-screenshots"] = true # default true - strips selelenium 2 automatic image capture of failing commands 
  caps["sauce-advisor"] = true # default true - offers advice on how to make your tests better
  
  caps["public"] = false # default false - Makes results available to everyone via saucelabs dashboard
  caps["restricted-public-info"] = false # If public is true, this hides the debug log if true
  
  driver = Selenium::WebDriver.for(
    :remote,
    :url => "http://<enter-your-saucelabs-details-here>@ondemand.saucelabs.com:80/wd/hub",
    :desired_capabilities => caps,
    )

  return driver
end

def close_browser(driver)
  driver.quit
end
