pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'cd scripts'
                sh  'chmod +x code_deploy.sh'
                sh  'sudo ./code_deploy.sh'
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

