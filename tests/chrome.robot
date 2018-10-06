*** Settings ***
Library           Selenium2Library
Test Template     PageScreenshot

*** Variables ***
@{chrome_arguments}    --no-sandbox    --headless    --disable-gpu

*** Keywords ***
SetChromeOptions
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR    ${option}    IN    @{chrome_arguments}
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}

ChromeOpen
    [Arguments]    ${url}
    ${chrome_options}=    SetChromeOptions
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${url}

PageScreenshot
    [Arguments]    ${url}
    ChromeOpen    ${url}
    Capture Page Screenshot
    [Teardown]    Close Browser

*** Test Cases ***    URL
Baidu             http://www.baidu.com
QQ                 http://www.qq.com
