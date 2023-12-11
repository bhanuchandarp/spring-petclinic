pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                // Replace <GITHUB_REPO_URL> with the URL of your GitHub repository
                script {
                    checkout([$class: 'GitSCM', branches: [[name: 'main']], userRemoteConfigs: [[url: 'https://github.com/bhanuchandarp/spring-petclinic.git']]])
                }
            }
        }

        stage('Build and Package') {
            steps {
                // Execute Maven build
                sh './mvnw package'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Replace <DOCKER_IMAGE_NAME> with the desired name for your Docker image
                script {
                    sh 'docker build -t  bhanuchandar6/spring-petclic:latest .'
                }
            }
        }

        stage('Push to Docker Hub') {

            steps {
                script {
                    // Log in to Docker Hub
                   // sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}"

                    // Replace <DOCKER_IMAGE_NAME> with the name of your Docker image
                    sh "docker push bhanuchandar6/spring-petclic:latest "
                }
            }
        }
         stage('deploy in kubernets ') {

            steps {
                script {

                    sh "kubectl apply -f spring-petclic-deployment.yaml"
                }
            }
        }
    }
}
