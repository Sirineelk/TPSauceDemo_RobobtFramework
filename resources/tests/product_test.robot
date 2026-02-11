*** Settings ***
Resource        ../variables/variables.robot
Resource        ../pages/cart_page.robot
Resource        ../pages/login_page.robot
Resource        ../pages/product_page.robot
Test Setup      Open Browser    ${URL}    ${BROWSER}
Test Teardown   Close Browser

*** Test Cases ***

Ajout produit panier
    Connexion utilisateur    ${VALID_USER}    ${VALID_PASS}
    Verifier page produits affichee
    Ajouter produit au panier
    Verifier panier contient 1 article