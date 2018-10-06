*** Settings ***
Library           Selenium2Library
Test Template     PageScreenshot

*** Keywords ***
PhantomjsOpen
    [Arguments]    ${url}
    Open Browser    ${url}    phantomjs

PageScreenshot
    [Arguments]    ${url}
    PhantomjsOpen    ${url}
    Capture Page Screenshot
    [Teardown]    Close Browser

*** Test Cases ***    URL
Baidu             http://www.baidu.com
QQ                 http://www.qq.com
