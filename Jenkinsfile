pipeline {
    agent any

    environment {
        IMAGE_NAME = "1ms24mc048/react-swarm"
        DOCKERHUB_CREDENTIALS = credentials('dockerhubID')
    }

    stages {

        stage('Checkout Code') {
            steps {
                git(
                    url: 'https://github.com/1ms24mc048/react-swarm',
                    branch: 'main'
                )
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhubID') {
                        dockerImage.push()
                    }
                }
            }
        }

        
    }

    post {
        always {
            deleteDir()
        }
        success {
            echo "React app deployed successfully using Vagrant-based Docker Swarm"
        }
        failure {
            echo "Pipeline failed"
        }
    }
}
