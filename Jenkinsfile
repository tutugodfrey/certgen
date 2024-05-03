pipeline {
  agent {
    label 'docker-agent'
  }
  parameters {
    string(name: 'DOMAINS', defaultValue: 'example.com', description: 'Domains to generate cert for')
    string(name: 'LOCAL_DIR', defaultValue: '/certs', description: 'dir for cert generation')
  }
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
        string(credentialsId: 'ACLI_KEY', variable: 'ACLI_KEY'), string(credentialsId: 'ACLI_SECRET', variable: 'ACLI_SECRET'),
        sshUserPrivateKey(credentialsId: 'AC_SSH_KEY', usernameVariable: 'AppID', keyFileVariable: 'AppKeyFile')]) {
          sh "echo $UNAME $PWORD $ACLI_KEY $ACLI_SECRET $AppID  ${params.LOCAL_DIR} acq-ssh-key ${params.DOMAINS} > /home/jenkins/password"

          sh """
            cd generate-cert
            ls -al
            cat $AppKeyFile > acq-ssh-key
            ./generateCert.sh ${params.LOCAL_DIR} $AppKeyFile 54.234.190.123 ${params.DOMAINS}
          """
        }
      }
    }
  }
}
