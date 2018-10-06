*** Settings ***
Library           Selenium2Library
Test Template     PageScreenshot

*** Variables ***
@{firefox_arguments}     -headless

*** Keywords ***
SetFirefoxOptions
    ${options}=    Evaluate     sys.modules['selenium.webdriver'].firefox.webdriver.Options()    sys, selenium.webdriver
    : FOR    ${option}    IN    @{firefox_arguments}
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}

FirefoxOpen
    [Arguments]    ${url}
    ${firefox_options}=    SetFirefoxOptions
    Create WebDriver    Firefox    firefox_options=${firefox_options}
    Go To    ${url}

PageScreenshot
    [Arguments]    ${url}
    FirefoxOpen    ${url}
    Capture Page Screenshot
    [Teardown]    Close Browser

*** Test Cases ***    URL
Baidu             http://www.baidu.com
QQ                 http://www.qq.com
