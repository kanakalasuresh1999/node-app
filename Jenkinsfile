pipeline {
    agent any

    environment {
        IMAGE_REPO = 'suresh4927/node-app'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                echo "🐳 Building Docker image..."
                sh 'docker build -t $IMAGE_REPO:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo "📤 Logging in and pushing image to Docker Hub..."
                withCredentials([usernamePassword(credentialsId: 'NCL', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    docker push $IMAGE_REPO:latest
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo "🚀 Deploying to Kubernetes..."
                sh 'kubectl apply -f k8s/'
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful!'
        }
        failure {
            echo '❌ Deployment failed!'
        }
    }
}
