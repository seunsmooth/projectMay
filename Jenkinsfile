pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh ' rm -rf app'
                sh 'git clone https://github.com/seunsmooth/projectMay.git app'
                sh "cd app/scripts && chmod 755 code_deploy.sh && ./code_deploy.sh"
                
            }
        }
        stage('build weather app Infrastructure') {
            steps {
                echo 'build Terraform infrastructure on AWS..'
                sh  'cd app &&  terraform init && terraform apply -auto-approve'
            }
        }
         stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}


