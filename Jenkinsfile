pipeline {
    agent any

    environment {
        TF_WORKSPACE = "default"
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo "🔹 Checking out repository..."
                git branch: 'main', url: 'https://github.com/WALIDMO23/HelloApp.git'
            }
        }

        stage('Terraform Init') {
            steps {
                echo "🔹 Initializing Terraform..."
                sh 'terraform init -reconfigure'
            }
        }

        stage('Terraform Plan Destroy') {
            steps {
                echo "🔹 Creating Terraform destroy plan..."
                sh 'terraform plan -destroy -out=tfplan'
            }
        }

        stage('Terraform Destroy') {
            steps {
                echo "🔹 Destroying infrastructure using plan..."
                sh 'terraform apply -auto-approve tfplan'
                echo "✅ Terraform infrastructure destroyed successfully!"
            }
        }
    }

    post {
        success {
            echo "🎉 Pipeline executed successfully! Infrastructure destroyed."
        }
        failure {
            echo "❌ Pipeline failed. Please check the console output for details."
        }
    }
}
