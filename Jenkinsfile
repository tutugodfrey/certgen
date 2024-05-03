pipeline {
  agent any
  parameters {

  }
  stages {
    stage('Checkout') {
      step {
        checkout scm
      }
    }

    stage('Echo Command') {
      step {
        sh 'echo Hello world'
      }
    }
  }
}
