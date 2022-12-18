pipeline {
    agent any
    stages {
        stage("git checkout") {
            steps{
                git credentialsId: 'SCM-creds', url: 'https://github.com/Anjaneyuluu/second-project'
            }
        }
        
        stage('Maven Build package'){
            steps {
                sh " mvn clean package"
            }
        }
        
        stage('Tomcat Deploy'){
            steps{
                sshagent(['My-Tomcat-creds']) {
                   sh "scp -o StrictHostKeyChecking=no target/*.war ec2-user@172.31.22.1:/opt/tomcat9/webapps"
                   sh "ssh ec2-user@172.31.22.1 /opt/tomcat9/bin/shutdown.sh"
                   sh "ssh ec2-user@172.31.22.1 /opt/tomcat9/bin/startup.sh"
                }
            }
        }
    }
}
