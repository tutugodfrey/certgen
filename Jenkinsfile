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

    stage('Check docker images') {
      steps {
        sh 'docker images'
      }
    }
  }
}
