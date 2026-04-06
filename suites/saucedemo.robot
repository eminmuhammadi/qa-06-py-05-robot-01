*** Settings ***
Documentation       SauceDemo Auth Test Suite

Library             Browser  # https://marketsquare.github.io/robotframework-browser/Browser.html


*** Variables ***
${START_URL}                            https://www.saucedemo.com/
${BASE_URL}                             https://www.saucedemo.com
${SAUCEDEMO_STANDARD_USER}              standard_user
${SAUCEDEMO_PROBLEM_USER}               problem_user
${SAUCEDEMO_LOCKED_OUT_USER}            locked_out_user
${SAUCEDEMO_PERFORMANCE_GLITCH_USER}    performance_glitch_user
${SAUCEDEMO_ERROR_USER}                 error_user
${SAUCEDEMO_VISUAL_USER}                visual_user
${SAUCEDEMO_PASSWORD}                   secret_sauce
${PRODUCTS_PAGE_URL}                    ${BASE_URL}/inventory.html


*** Test Cases ***
Standard Users Should Be Able To See Products
    [Tags]    saucedemo    auth    standard_user
    [Setup]    Open SauceDemo On Browser
    Log In As ${SAUCEDEMO_STANDARD_USER}
    User Should Be Able To See Products
    [Teardown]    Close Browser

Problem User Should Be Able To See Products
    [Tags]    saucedemo    auth    problem_user
    [Setup]    Run Keywords    Open SauceDemo On Browser
    ...    AND    Log In As ${SAUCEDEMO_PROBLEM_USER}
    ...    AND    User Should Be Able To See Products
    Log    Hello World
    [Teardown]    Close Browser

Locked Out User Should Not Be Able To See Products
    [Tags]    saucedemo    auth    locked_out_user
    [Setup]    Open SauceDemo On Browser
    Log In As ${SAUCEDEMO_LOCKED_OUT_USER}
    Lockout Error Should Be Shown
    [Teardown]    Close Browser

Performance Glitch User Should Be Able To See Products
    [Tags]    saucedemo    auth    performance_glitch_user
    [Setup]    Open SauceDemo On Browser
    Log In As ${SAUCEDEMO_PERFORMANCE_GLITCH_USER}
    User Should Be Able To See Products
    [Teardown]    Close Browser

Error User Should Be Able To See Products
    [Tags]    saucedemo    auth    error_user
    [Setup]    Open SauceDemo On Browser
    Log In As ${SAUCEDEMO_ERROR_USER}
    User Should Be Able To See Products
    [Teardown]    Close Browser

Visual User Should Be Able To See Products
    [Tags]    saucedemo    auth    visual_user
    [Setup]    Open SauceDemo On Browser
    Log In As ${SAUCEDEMO_VISUAL_USER}
    User Should Be Able To See Products
    [Teardown]    Close Browser


*** Keywords ***
Open SauceDemo On Browser
    New Browser    browser=chromium
    ...    headless=False
    ...    slowMo=1s
    ...    timeout=30s
    New Context    tracing=True
    ...    viewport={"width": 1280, "height": 720}
    ...    defaultBrowserType=chromium
    New Page    ${START_URL}

Log In As ${username}
    [Arguments]    ${password}=${SAUCEDEMO_PASSWORD}
    Fill Text    css=input#user-name    ${username}
    Fill Text    css=input#password    ${password}
    Click    css=input#login-button

User Should Be Able To See Products
    Wait For Elements State    css=span[data-test=\"title\"]    visible    5000
    ${PRODUCTS_TITLE}=    Get Text    css=span[data-test=\"title\"]
    Should Be Equal As Strings    ${PRODUCTS_TITLE}    Products
    ${URL}=    Get Url
    Should Be Equal As Strings    ${URL}    ${PRODUCTS_PAGE_URL}

Lockout Error Should Be Shown
    Wait For Elements State    css=h3[data-test=\"error\"]    visible    5000
    ${ERROR_MESSAGE}=    Get Text    css=h3[data-test=\"error\"]
    Should Be Equal As Strings    ${ERROR_MESSAGE}    Epic sadface: Sorry, this user has been locked out.
