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
        withCredentials([usernamePassword(credentialsId: 'jenkins-user', usernameVariable: 'UNAME', passwordVariable: 'PWORD'),
        string(credentialsId: 'ACLI_KEY', variable: 'ACLI_KEY')]) {
          sh "echo $UNAME $PWORD $ACLI_KEY > /home/jenkins/password"
        }
      }
    }
  }
}
