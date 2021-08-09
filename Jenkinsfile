pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker build --no-cache -t dragas/isso .'
      }
    }

    stage('Push to DockerHub') {
      steps {
        sh 'docker push dragas/isso'
      }
    }

    stage('Cleanup') {
      steps {
        sh 'yes | docker volume prune'
      }
    }
    
    
  }
}
