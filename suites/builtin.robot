*** Settings ***
Documentation       Hello World Documentation


*** Test Cases ***
Toplama emeliyyati duz islemelidir
    [Documentation]   toplama emeliyyati apar
    VAR    ${a}=    5
    VAR    ${b}=    3
    VAR    ${c}=    ${${a} + ${b}}
    Should Be Equal As Integers    ${c}    8

Cixma emeliyyati duz islemelidir
    [Documentation]   cixma emeliyyati apar
    VAR    ${a}=    5
    VAR    ${b}=    3
    VAR    ${c}=    ${${a} - ${b}}
    Should Be Equal As Integers    ${c}    2

Vurma emeliyyati duz islemelidir
    [Documentation]   vurma emeliyyati apar
    VAR    ${a}=    5
    VAR    ${b}=    3
    VAR    ${c}=    ${${a} * ${b}}
    Should Be Equal As Integers    ${c}    15

Bolme emeliyyati duz islemelidir
    [Documentation]   vurma emeliyyati apar
    VAR    ${a}=    6
    VAR    ${b}=    2
    VAR    ${c}=    ${${a} / ${b}}
    Should Be Equal As Integers    ${c}    3

Eger A Bden Boyukdurse Ekrana Boyukdur Yaz
    [Documentation]   serti emeliyyat apar
    VAR    ${a}=    5
    VAR    ${b}=    3
    IF    ${a} > ${b}    Log To Console    Boyukdur

Eger A Bden Kicikdirse Ekrana Kicikdir Yaz
    [Documentation]   serti emeliyyat apar
    VAR    ${a}=    2
    VAR    ${b}=    3
    IF    ${a} < ${b}    Log To Console    Kicikdir
