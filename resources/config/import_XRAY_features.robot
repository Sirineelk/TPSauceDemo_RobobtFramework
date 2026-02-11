*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem

*** Variables ***
${XRAY_BASE}    https://xray.cloud.getxray.app/api/v2
${CLIENT_ID}    AE8CFFEBED9D442D90AC19F872B22D79
${CLIENT_SECRET}    42a7a7d70520a256f83e069ca96c4eb3a05e59a41a1f2cd168f2c03efa181d25
${KEYS}         POEI2-974
${DEST}         exported_features

*** Test Cases ***
Exporter Features depuis Xray
    ${body}=    Create Dictionary    client_id=${CLIENT_ID}    client_secret=${CLIENT_SECRET}
    ${response}=    POST    ${XRAY_BASE}/authenticate    json=${body}
    Should Be Equal As Strings    ${response.status_code}    200
    ${token}=    Set Variable    ${response.json()}

    Log    Token: ${token}

    ${headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET    ${XRAY_BASE}/export/cucumber?keys=${KEYS}    headers=${headers}
    Should Be Equal As Numbers    ${response.status_code}    200

    Create File    exported_features.zip    ${response.content}    binary=True

