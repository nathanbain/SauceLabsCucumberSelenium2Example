Given /^the environment setup of (.*) and (\w*) (.*)$/ do |os, browser, browserversion|
  @environment = Environment.new(os, browser, browserversion)
  puts "OS: #{os} Browser: #{browser} Version: #{browserversion}"
end
