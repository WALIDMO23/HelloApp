pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                echo '\u001B[36m=== Running Terraform Init ===\u001B[0m'
                sh 'terraform init -input=false'
            }
        }

        stage('Terraform Plan') {
            steps {
                echo '\u001B[33m=== Running Terraform Plan ===\u001B[0m'
                sh 'terraform plan -input=false -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                echo '\u001B[32m=== Applying Terraform Changes ===\u001B[0m'
                sh 'terraform apply -input=false -auto-approve tfplan'
            }
        }
    }

    post {
        success {
            echo '\u001B[32m✔ Terraform completed successfully!\u001B[0m'
        }
        failure {
            echo '\u001B[31m✖ Terraform failed! Check logs.\u001B[0m'
        }
    }
}
