pipeline {
    agent any

    stages {

        stage('Cleanup') {
            steps {
                sh '''
                docker rm -f flask-app nginx-proxy || true
                docker network rm app-network || true
                '''
            }
        }

        stage('Setup Network') {
            steps {
                sh '''
                docker network create app-network || true
                '''
            }
        }

        stage('Build Images') {
            steps {
                sh '''
                docker build -t flask-app .
                docker build -t nginx-proxy -f Dockerfile.nginx .
                '''
            }
        }

        stage('Run Containers') {
            steps {
                sh '''
                docker run -d --name flask-app --network app-network flask-app

                docker run -d --name nginx-proxy \
                    --network app-network \
                    -p 80:80 \
                    nginx-proxy
                '''
            }
        }
    }
}