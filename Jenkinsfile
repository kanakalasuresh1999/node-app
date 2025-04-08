pipeline {
    agent any

    environment {
        IMAGE_NAME = 'suresh4927/node-app'
        DOCKER_HUB_CREDS = credentials('NCL') // use the ID you saved
    }

    stages {
        stage('Clone Code') {
            steps {
                git 'https://github.com/kanakalasuresh1999/node-app.git' // replace with your repo URL
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $suresh4927/node-app:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([ credentialsId: "$DOCKER_HUB_CREDS", url: "" ]) {
                    sh 'docker push $suresh4927/node-app:latest'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/'  // Make sure your manifests are in a "k8s/" folder
            }
        }
    }

    post {
        success {
            echo '🚀 Deployment successful!'
        }
        failure {
            echo '❌ Deployment failed!'
        }
    }
}
