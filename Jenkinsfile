pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/Zawuza/pipeline-lazarus-demo'
      }
    }
    stage('Build') {
      steps {
        bat 'lazbuild onebutton.lpi'
      }
    }
  }
}