*** Settings ***
Resource        ../variables/variables.robot
Resource        ../pages/cart_page.robot
Resource        ../pages/login_page.robot
Resource        ../pages/product_page.robot
Resource        ../pages/checkout_page.robot
Test Setup      Open Browser    ${URL}    ${BROWSER}
Test Teardown   Close Browser

*** Test Cases ***
Finalisation commande
    Connexion utilisateur    ${VALID_USER}    ${VALID_PASS}
    Ajouter produit au panier
    Aller au panier
    Verifier produit dans panier
    Aller au checkout
    Remplir informations checkout
    Finaliser commande
    Verifier confirmation commande
