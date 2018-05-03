stage('test'){
    node('docker-jenkins-slave'){
        checkout scm
        sh 'chmod a+x ./run_test.sh'
        sh './run_test.sh'
    }
}

node('docker-image-builder'){
    stage('build the image'){
        checkout scm
        withDockerServer([credentialsId: 'cava-docker-host', uri: "tcp://${DOCKERHOST}:2376"]) {
            docker.build "${DOCKER_REGISTRY_USER}/rsvpapp:mooc"
        }
    }
    
    stage('push the image to DockerHub'){
        withDockerServer([credentialsId: 'cava-docker-host', uri: "tcp://${DOCKERHOST}:2376"]) {
            withDockerRegistry([credentialsId: 'dockerhub_auth']) {
                docker.image("${DOCKER_REGISTRY_USER}/rsvpapp:mooc").push()
            }
        }
    }
    
    stage('deploy in production'){
        withDockerServer([credentialsId: 'production', uri: "tcp://${PRODUCTION}:2376"]) {
            sh 'docker stack deploy -c docker-stack.yml myrsvpapp'
        }
    }
}
//stage('deploy the image to staging server')
