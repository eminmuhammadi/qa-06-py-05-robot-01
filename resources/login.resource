*** Settings ***
Library     Browser


*** Keywords ***
Username Xanasina ${username} Yaz
    [Documentation]  x
    Fill Text    css=#user-name    ${username}

Sifre Xanasina ${password} Yaz
    [Documentation]  x
    Fill Text    css=#password    ${password}

Login Duymesine Bas
    [Documentation]  x
    Click    css=#login-button
