pipeline {
    agent any

    environment {
        IMAGE_NAME = 'suresh4927/node-app'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                echo "🐳 Building Docker image..."
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo "📤 Logging in and pushing image to Docker Hub..."
                withCredentials([usernamePassword(credentialsId: 'NCL', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    docker push $IMAGE_NAME:latest
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
    steps {
        echo "🚀 Deploying to Kubernetes..."

        // Ensure kubectl is available and kubeconfig is set
        sh '''
        echo "🔍 Verifying kubectl version and context..."
        which kubectl
        kubectl version --client
        kubectl config current-context

        echo "📦 Applying Kubernetes manifests..."
        set -e  # fail the script if any command fails
        kubectl apply -f k8s/deployment.yaml
        kubectl apply -f k8s/service.yaml

        echo "✅ Deployment applied successfully."
        '''
    }
}

                '''
            }
        }
    }
}

