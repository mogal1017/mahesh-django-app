pipeline {
    agent any
    stages {
        stage("code checkout") {
            steps {
                git url: "https://github.com/mogal1017/react_django_demo_app.git", branch: "main"
            }
        }
        stage("code build") {
            steps {
                sh "docker build -t react-app ."
            }
        }
        stage("code push") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                    sh "docker tag react-app ${env.dockerHubUser}/react-app:latest"
                    sh "docker push ${env.dockerHubUser}/react-app:latest"
                }
            }
        }
        stage("code deploy") {
            steps {
                sh "docker-compose down -d && docker-compose up -d"
            }
        }
    }
}
