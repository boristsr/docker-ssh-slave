pipeline {
    //Run only on docker agents compatible with jekyll
    agent { label 'docker' }

    options {
        timeout(time: 1, unit: 'HOURS') 
    }

    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-accesstoken')
        IMAGE_NAME='boristsr/jenkins-ssh-slave'
	}

    stages {
        stage('Build Image') {
            steps {
                //Execute build
                sh 'docker build --no-cache -t $IMAGE_NAME:$BUILD_NUMBER -t $IMAGE_NAME:latest .'
            }
        }
        stage('Login') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_NAME:$BUILD_NUMBER'
                sh 'docker push $IMAGE_NAME:latest'
            }
        }
    }

    post {
		always {
			sh 'docker logout'
		}
	}
}
