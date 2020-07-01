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
                    dockerImage = docker.build('446589149068.dkr.ecr.us-east-2.amazonaws.com')
                }
            }
          }
          stage('Push Image') {
              steps {
                  script {
                     sh'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 446589149068.dkr.ecr.us-east-2.amazonaws.com'
                     docker.withRegistry('https://446589149068.dkr.ecr.us-east-2.amazonaws.com', 'ecr:us-east-2:aws'){
                      dockerImage.push("latest")
                  }
              }
          }
        }
      }
}