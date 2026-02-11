*** Settings ***
Library    SeleniumLibrary
Resource   ../locators/product_locators.robot

*** Keywords ***
Verifier page produits affichee
    Wait Until Page Contains Element    ${PRODUCTS_TITLE}

Ajouter produit au panier
    Click Element                      ${ADD_BIKE_LIGHT_BTN}

Verifier panier contient 1 article
    Element Text Should Be              ${CART_BADGE}    ${EXPECTED_CART_COUNT}

Aller au panier
    Click Element                        ${CART_LINK}
