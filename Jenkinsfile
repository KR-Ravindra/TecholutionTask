pipeline {

      agent any
      stages {
            stage('Start Pipeline') {
              steps {
                 echo "This is the first step of the build"
                 echo "Start Build"
                }
           }
          stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build('446589149068.dkr.ecr.us-east-2.amazonaws.com/mytask')
                }
            }
          }
          stage('Push Image') {
              steps {
                  script {
                     docker.withRegistry('https://446589149068.dkr.ecr.us-east-2.amazonaws.com', 'ecr:us-east-2:aws'){
                      dockerImage.push("latest")
                  }
                }
              }
          }
      }
}