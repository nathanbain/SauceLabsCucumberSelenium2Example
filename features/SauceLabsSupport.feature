@complete
Feature: Test Sauce Labs Browser Support
  In order to run my tests on various browsers and operating systems
  As a tester
  I want to run my tests on sauce labs
  
Scenario Outline: search for cheese
    Given the environment setup of <OS> and <Browser> <BrowserVersion>
    When searching for "cheese" on bing
    Then the results should contain "CHEESE.COM - All about cheese!."

Examples: Valid Browser and OS Combinations
  | OS    | Browser | BrowserVersion |
  | XP    | Firefox | 3.0            |
  | XP    | Firefox | 3.5            |
  | XP    | Firefox | 3.6            |
  | XP    | Firefox | 4              |
  | XP    | Firefox | 5              |
  | XP    | Firefox | 6              |
  | XP    | Firefox | 7              |
  | XP    | Firefox | 8              |
  | XP    | Firefox | 9              |
  | XP    | Firefox | 10             |
  | Win7  | Firefox | 4              |
  | Win7  | Firefox | 5              |
  | Win7  | Firefox | 6              |
  | Win7  | Firefox | 7              |
  | Win7  | Firefox | 8              |
  | Win7  | Firefox | 9              |
  | Win7  | Firefox | 10             |
  | Linux | Firefox | 3.0            |
  | Linux | Firefox | 3.6            |
  | Linux | Firefox | 4              |
  | Linux | Firefox | 5              |
  | Linux | Firefox | 6              |
  | Linux | Firefox | 7              |
  | Linux | Firefox | 8              |
  | Linux | Firefox | 9              |
  | Linux | Firefox | 10             |
  | XP    | Chrome  |                |
  | Win7  | Chrome  |                |
  | Linux | Chrome  |                |
  | XP    | IE      | 6              |
  | XP    | IE      | 7              |
  | XP    | IE      | 8              |
  | Win7  | IE      | 9              |

  # Supported OS/Browsers: http://saucelabs.com/docs/ondemand/browsers//env/ruby/se2/mac
