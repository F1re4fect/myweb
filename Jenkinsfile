pipeline {

  environment {
    registry = "778557655318.dkr.ecr.us-west-1.amazonaws.com/myweb:$BUILD_NUMBER"
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/F1re4fect/myweb.git'
      }
    }

    stage('Build image') {
      steps {
        container('docker') {
          sh "#!/bin/sh -e\ndocker build -t 778557655318.dkr.ecr.us-west-1.amazonaws.com/myweb:${BUILD_NUMBER} ."
        }
      }
    }

    stage('Push Image') {
      steps{
        container('docker') {
	      script {
		    docker.withRegistry('https://778557655318.dkr.ecr.us-west-1.amazonaws.com', 'ecr:us-west-1:carter-ecr') {
    		docker.image("778557655318.dkr.ecr.us-west-1.amazonaws.com/myweb:${BUILD_NUMBER}").push()
  		}
	  }     
     }
    }
   }

    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "myweb.yaml", dockerCredentials: [[credentialsId: 'ecr:us-west-1:carter-ecr', url: 'http://778557655318.dkr.ecr.us-west-1.amazonaws.com/myweb']], kubeconfigId: "mykubeconfig")
        }
      }
    }

  }
}
