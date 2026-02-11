*** Settings ***
Library      SeleniumLibrary
Resource     ../variables/variables.robot
Resource     ../locators/checkout_locators.robot


*** Keywords ***
Remplir informations checkout
    Remplir informations checkout
    Input Text       ${FIRSTNAME_INPUT}    ${FIRSTNAME}
    Input Text       ${LASTNAME_INPUT}     ${LASTNAME}
    Input Text       ${ZIP_INPUT}          ${ZIP}
    Click Element    ${CONTINUE_BTN}

Finaliser commande
    Click Element    ${FINISH_BTN}

Verifier confirmation commande
    Wait Until Page Contains    ${CONFIRM_TEXT}
