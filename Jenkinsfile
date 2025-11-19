pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                echo "🔹 Checking out repository..."
                git branch: 'master', url: 'https://github.com/Ahmedlebshten/Jenkins-Pipeline-Project'
                // لو الفرع عندك اسمه main بدل master غيّر السطر ده:
                // git branch: 'main', url: 'https://github.com/Ahmedlebshten/Jenkins-Pipeline-Project'
            }
        }

        stage('Terraform Init') {
            steps {
                echo "🔹 Initializing Terraform..."
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
