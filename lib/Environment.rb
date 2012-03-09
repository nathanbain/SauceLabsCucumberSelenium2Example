class Environment
  
  attr_accessor :os, :browser, :browser_version
    
  def initialize(os,browser,browser_version)
      @os, @browser, @browser_version = os, browser, browser_version
    end
end
