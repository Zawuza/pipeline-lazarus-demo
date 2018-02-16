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
        bat 'lazbuild .\\test\\fpcunitproject.lpi'
      }
    }
    stage('Test') {
      steps {
        powershell '.\\test\\fpcunitproject.exe -a > results.xml'
        step([$class: 'XUnitPublisher', testTimeMargin: '3000', thresholdMode: 1, 
          thresholds: [[$class: 'FailedThreshold', failureNewThreshold: '1', failureThreshold: '1', 
          unstableNewThreshold: '1', unstableThreshold: '1'], [$class: 'SkippedThreshold', 
          failureNewThreshold: '1', failureThreshold: '1', unstableNewThreshold: '1', 
          unstableThreshold: '1']], tools: [[$class: 'FPCUnitJunitHudsonTestType', deleteOutputFiles: true, 
          failIfNotNew: true, pattern: '.\\test\\results.xml', skipNoTestFiles: false, stopProcessingIfError: true]]])
      }
    }
  }
}