*** Settings ***
Resource        ../variables/variables.robot
Resource        ../pages/login_page.robot
Resource        ../pages/product_page.robot
Test Setup      Open Browser    ${URL}    ${BROWSER}
Test Teardown   Close Browser

*** Test Cases ***

Connexion valide
    [Tags]    POEI2-638   
    Connexion utilisateur    ${VALID_USER}    ${VALID_PASS}
    Verifier page produits affichee

Connexion invalide
    [Tags]    POEI2-643   
    Connexion utilisateur    ${VALID_USER}    ${INVALID_PASS}
    Verifier message erreur login
