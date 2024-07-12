pipeline {
    agent any

    environment {
        ANGULAR_APP_DIR = "${env.WORKSPACE}"
    }

    stages {
        stage('gitcheckout') {
            steps {
                // Checkout the code from the repository
                git branch: 'main', url: 'https://github.com/officalkalyan/CMRL-Admin-Portal.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    dir(ANGULAR_APP_DIR) {
                        // Install npm dependencies
                        sh 'npm install --legacy-peer-deps' || error 'npm install failed'
                    }
                }
            }
        }

        stage('Install Angular CLI') {
            steps {
                script {
                    dir(ANGULAR_APP_DIR) {
                        // Install Angular CLI locally within the project with legacy-peer-deps flag
                        sh 'npm install @angular/cli --legacy-peer-deps' || error 'npm install @angular/cli failed'
                    }
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    dir(ANGULAR_APP_DIR) {
                        // Build the Angular application using the locally installed Angular CLI
                        sh './node_modules/.bin/ng build' || error 'ng build failed'
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up or post-processing steps can go here
        }
    }
}
