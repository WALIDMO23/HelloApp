pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out repository...'
                checkout scm
            }
        }

        stage('Test Terraform') {
            steps {
                echo 'Simulating Terraform commands...'
                sh 'echo terraform init'
                sh 'echo terraform plan'
                sh 'echo terraform apply'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
    }
}
