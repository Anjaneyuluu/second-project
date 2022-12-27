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
                sh " docker build -t mrofficialnah/second-project:0.0.4 ."
                }
            }
        stage ('Docker push') {
            steps {
               withCredentials([string(credentialsId: 'docker-hub', variable: 'hubPwd')]) {
                   sh "docker login -u mrofficialnah -p ${hubPwd}"
                   sh "docker push mrofficialnah/second-project:0.0.4"
                
               }    
            }
        }
        
        stage('Docker Deploy') {
            steps {
               sshagent(['docker-host']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.45.121 docker run -d -p 8083:8080 --name second-project1 mrofficialnah/thirdproject:0.0.3"
                }
            }
            
        }
        
    }
}
