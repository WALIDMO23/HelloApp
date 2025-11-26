pipeline {
    agent any

    // هنا بنعرّف Parameter تختار منه قبل ما تعمل Build
    parameters {
        choice(
            name: 'ACTION',
            choices: ['apply', 'destroy'],
            description: 'Choose Terraform action to run'
        )
    }

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

        stage('Terraform Plan') {
            when {
                expression { params.ACTION == 'apply' }   // نعمل Plan بس في حالة apply
            }
            steps {
                echo "🔹 Creating Terraform plan..."
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply / Destroy') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        echo "🔹 Applying Terraform plan..."
                        sh 'terraform apply -auto-approve tfplan'
                        echo "✅ Terraform infrastructure deployed successfully!"
                    } else if (params.ACTION == 'destroy') {
                        echo "⚠️ Destroying Terraform infrastructure..."
                        sh 'terraform destroy -auto-approve'
                        echo "✅ Terraform infrastructure destroyed successfully!"
                    } else {
                        error "Unknown ACTION: ${params.ACTION}"
                    }
                }
            }
        }
    }

    post {
        success {
            echo "🎉 Pipeline executed successfully! ACTION = ${params.ACTION}"
        }
        failure {
            echo "❌ Pipeline failed. Please check the console output for details."
        }
    }
}
