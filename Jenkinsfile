pipeline {
    agent any

    stages {

        stage('Run Robot Tests') {
            steps {
                bat '''
                dir resources/tests
                robot --output RBF/results/output.xml resources/tests/ || exit 0
                '''
            }
        }

        stage('Get Xray Token') {
            steps {
                bat '''
                @echo off
                echo Recuperation du token Xray...
                curl -s -H "Content-Type: application/json" -X POST ^
                     --data "{\\"client_id\\":\\"AE8CFFEBED9D442D90AC19F872B22D79\\",\\"client_secret\\":\\"42a7a7d70520a256f83e069ca96c4eb3a05e59a41a1f2cd168f2c03efa181d25\\"}" ^
                     https://xray.cloud.getxray.app/api/v1/authenticate > raw_token.txt

                REM Nettoyage du token (enlever les guillemets)
                set /p RAW_TOKEN=<raw_token.txt
                set TOKEN=%RAW_TOKEN:"=%
                echo %TOKEN% > token.txt
                echo Token recupere et nettoye.
                '''
            }
        }

        stage('Upload Results to Xray') {
            steps {
                bat '''
                set /p TOKEN=<token.txt
                curl -H "Authorization: Bearer %TOKEN%" ^
                     -F "file=@RBF/results/output.xml" ^
                     https://xray.cloud.getxray.app/api/v2/import/execution/robot
                '''
            }
        }
    }
}
