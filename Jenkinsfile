pipeline {
  agent {
    label 'docker-agent'
  }
  // parameters {

  // }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Echo Command') {
      steps {
        sh 'echo Hello world'
      }
    }

    stage('Check docker images') {
      steps {
        sh 'whoami'
        sh 'hostname'
        sh 'docker images'
        
      }
    }

    stage('Check Jenkins user') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'jenkins-user', usernameVariable: 'UNAME', passwordVariable: 'PWORD')])
        sh "echo $UNAME $PWORD"
      }
    }
  }
}
