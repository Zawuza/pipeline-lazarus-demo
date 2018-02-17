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
        powershell '.\\tools\\encodingtool\\encode.ps1'
        step([$class: 'XUnitPublisher', testTimeMargin: '3000', thresholdMode: 1, 
          thresholds: [[$class: 'FailedThreshold', failureNewThreshold: '0', failureThreshold: '0', 
          unstableNewThreshold: '0', unstableThreshold: '0'], [$class: 'SkippedThreshold', 
          failureNewThreshold: '0', failureThreshold: '0', unstableNewThreshold: '0', 
          unstableThreshold: '0']], tools: [[$class: 'FPCUnitJunitHudsonTestType', deleteOutputFiles: true, 
          failIfNotNew: true, pattern: 'results2.xml', skipNoTestFiles: false, stopProcessingIfError: true]]])
      }
    }
  }
}