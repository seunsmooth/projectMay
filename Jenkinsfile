pipeline {
    stages {
        stage('Build') {
            parallel {
                stage('Build bluebox node and redbox node'){
                    steps {
                        sh 'git clone https://github.com/seunsmooth/projectMay.git '
                        sh 'cd script'
                        sh 'sudo chmod +x./code_deploy.sh'
                        sh 'sudo ./code_deploy.sh'
                    }
                }
            }
        }
    }
}
