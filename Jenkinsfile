pipeline {
  agent any
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

    stage('Echo Command 2') {
      steps {
        sh 'echo Hello world 2'
      }
    }
  }
}
