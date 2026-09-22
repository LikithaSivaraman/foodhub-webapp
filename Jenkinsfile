pipeline {
    agent any
    
    environment {
        SCANNER_HOME= tool 'sonar-scanner'
    }

    stages {
        stage('Git-Checkout') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/LikithaSivaraman/foodhub-webapp.git'
            }
        }
        stage("Compile") {
            steps{
                sh 'mvn clean compile '
            }
        }
        stage("Test") {
            steps{
                sh 'mvn test'
            }
        }
        stage("Sonarqube Analysis"){
            steps{
                withSonarQubeEnv ("sonar-server01") {
                    sh ''' 
                    $Scanner_HOME/opt/sonar-scanner-6.2.1.4610-linux-x64/bin/sonar-scanner -Dsonar.projectName=foodhub-webapp \
                    -Dsonar.projectKey=foodhub-webapp ''' 
                    
                    
    
}
            }
        }
        stage("Build") {
            steps{
                sh 'mvn clean package -DskipTests=true'
            }
        }
        stage ( "Clean up all old Docker images .. containers"){
            steps{
                sh ' docker rm $(docker ps -aq) '
                sh ' docker stop $(docker ps -aq)'
            }
        }
        stage("Build Docker Image") {
            steps{
                script{
                    withDockerRegistry(credentialsId: 'dockerhub-creds', toolname: 'docker') {
                        sh ' cd /var/lib/jenkins/workspace/Pipeline_project '
                        sh ' docker build -t my-food-webapp -f Dockerfile .'
                        sh ' docker tag my-food-webapp likithas01/my-food-webapp:latest '
                    }        
}
                
            }
        }
        stage("Push Docker Image to dockerhub") {
            steps{
                script{
                    withDockerRegistry(credentialsId: 'dockerhub-creds', toolname: 'docker') {
                        sh ' docker push likithas01/my-food-webapp:latest '
                    }        
}
                
            }
        }
        stage("Deploy to a docker container") {
            steps{
                script{
                    withDockerRegistry(credentialsId: 'dockerhub-creds', toolname: 'docker') {
                        
                        sh ' docker run -d --name app-image -p 9090:8080 likithas01/my-food-webapp:latest '
                    }        
}
                
            }
        }
                
        
    }
}
