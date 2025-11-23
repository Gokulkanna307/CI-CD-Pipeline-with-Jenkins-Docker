pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "my-node-app"
        DOCKER_TAG = "${BUILD_NUMBER}"
        CONTAINER_NAME = "node-app-container"
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                checkout scm
            }
        }
        
        stage('Install Dependencies') {
            steps {
                echo 'Installing dependencies...'
                sh 'npm install'
            }
        }
        
        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                sh 'npm test'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
            }
        }
        
        stage('Stop Old Container') {
            steps {
                echo 'Stopping old container if exists...'
                sh """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                """
            }
        }
        
        stage('Run Docker Container') {
            steps {
                echo 'Running new Docker container...'
                sh """
                    docker run -d \
                    --name ${CONTAINER_NAME} \
                    -p 3000:3000 \
                    ${DOCKER_IMAGE}:latest
                """
            }
        }
        
        stage('Verify Deployment') {
            steps {
                echo 'Verifying deployment...'
                sh 'sleep 5'
                sh '''
                    echo "Checking if container is running..."
                    docker ps | grep node-app-container
                    echo "Checking application health..."
                    docker exec node-app-container curl -f http://localhost:3000/health || exit 1
                '''
            }
        }
    
    post {
        success {
            echo 'Pipeline completed successfully!'
            // Email notification will be added here
        }
        failure {
            echo 'Pipeline failed!'
            // Email notification will be added here
        }
        always {
            echo 'Cleaning up workspace...'
            cleanWs()
        }
    }
}
