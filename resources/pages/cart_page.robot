*** Settings ***
Library    SeleniumLibrary
Resource   ../locators/cart_locators.robot

*** Keywords ***
Verifier produit dans panier
    Wait Until Page Contains    ${PRODUCT_TEXT}

Aller au checkout
    Click Element    ${CHECKOUT_BTN}
