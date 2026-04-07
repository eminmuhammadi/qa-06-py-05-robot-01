*** Settings ***
Documentation       Example Test Suite

Library             Browser
Resource            ./../resources/login.resource

Suite Setup         Open Chromium
Suite Teardown      Close Chromium


*** Test Cases ***
Users should be abto to login
    [Documentation]  Login as secret user
    [Tags]    login
    Username Xanasina standard_user Yaz
    Sifre Xanasina secret_sauce Yaz
    Login Duymesine Bas
    ${title}=    Get Text    css=span[data-test="title"]
    Should Be Equal As Strings    ${title}    Products


*** Keywords ***
Open Chromium
    New Browser    browser=chromium
    ...    headless=False
    ...    slowMo=1s
    ...    timeout=30s
    New Context    tracing=True
    ...    viewport={"width": 1280, "height": 720}
    ...    defaultBrowserType=chromium
    New Page    https://www.saucedemo.com/

Close Chromium
    Close Browser
