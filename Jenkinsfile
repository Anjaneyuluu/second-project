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
                sh " docker build -t mrofficialnah/second-project:0.0.3 ."
                }
            }
        stage ('Docker push') {
            steps {
               withCredentials([string(credentialsId: 'docker-hub', variable: 'hubPwd')]) {
                   sh "docker login -u mrofficialnah -p ${hubPwd}"
                   sh "docker push mrofficialnah/second-project:0.0.3"
                
               }    
            }
        }
        
        stage('Docker Deploy') {
            steps {
               sshagent(['docker-host']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.33.135 docker run -d -p 8082:8080 --name second-project mrofficialnah/thirdproject:0.0.3"
                }
            }
            
        }
        
    }
}
