pipeline {
    agent any
    stages {
        
        stage('Maven Build package'){
            steps {
                sh " mvn clean package"
            }
        }
        
        stage('Docker Build '){
            steps{
                sh " docker build -t mrofficialnah/second-project:0.0.2 ."
                }
            }
        stage ('Docker push') {
            steps {
                sh "docker login -u mrofficialnah-p xxxx"
                sh "docker push mrofficialnah/second-project:0.0.2"
            }
        }
        
    }
}
