pipeline {
    agent any

    environment {
        // Terraform workspace (اختياري)
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
                // Terraform سيستخدم IAM Role تلقائيًا من الـ EC2 instance
                sh 'terraform init -reconfigure'
            }
        }

        stage('Terraform Plan') {
            steps {
                echo "🔹 Creating Terraform plan..."
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                echo "🔹 Applying Terraform plan..."
                sh 'terraform apply -auto-approve tfplan'
                echo "✅ Terraform infrastructure deployed successfully!"
            }
        }
    }

    post {
        success {
            echo "🎉 Pipeline executed successfully! Infrastructure is ready."
        }
        failure {
            echo "❌ Pipeline failed. Please check the console output for details."
        }
    }
}
