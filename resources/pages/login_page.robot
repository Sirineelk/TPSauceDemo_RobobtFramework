*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/variables.robot
Resource   ../locators/login_locators.robot

*** Keywords ***
Ouvrir navigateur sur page login
    Open Browser    ${URL}    ${BROWSER}

Entrer username
    [Arguments]    ${username}
    Input Text    ${USERNAME_INPUT}    ${username}

Entrer password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Cliquer login
    Click Element    ${LOGIN_BTN}

Connexion utilisateur
    [Arguments]    ${username}    ${password}
    Ouvrir navigateur sur page login
    Entrer username    ${username}
    Entrer password    ${password}
    Cliquer login

Verifier message erreur login
    Wait Until Page Contains    ${ERROR_MESSAGE}
