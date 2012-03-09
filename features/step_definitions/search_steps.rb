When /^searching for "(.*)" on bing$/ do |search_term|

  @driver = open_browser(@environment.os, @environment.browser, @environment.browser_version)
  @driver.navigate.to "http://www.bing.com/"

  search_box = @driver.find_element(:css, "input#sb_form_q")
  search_button = @driver.find_element(:css, "input#sb_form_go")
  
  search_box.click
  search_box.send_keys search_term
  search_button.click

  sleep 2

  @search_results_elements = @driver.find_elements(:css, "div#results a[onmousedown]")

  @search_results_labels = Array.new
  @search_results_elements.each do |ele|
    @search_results_labels << ele.text
  end
end

Then /^the results should contain "([^"]*)"$/ do |expected_result|
  @search_results_labels.should include(expected_result)
end

After do |scenario|
  close_browser(@driver)
end
