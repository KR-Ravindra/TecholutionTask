pipeline {

      agent any
      stages {
            stage('Start Pipeline') {
              steps {
                 echo "This is the first step of the build"
                 echo "Start Build"
                }
           }

           stage('Lint HTML') {
               steps {
                   sh 'tidy -q -e *.html'
                }
          }


          stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build('krravindra/techolution')
                    docker.withRegistry('', 'dockerhub') {
                        dockerImage.push()
                    }
                }
            }
          }

          stage('Deploy App') {
            steps {
                      withAWS(credentials: 'aws-cred', region:'us-east-1') {
			sh '''
			aws eks --region us-east-1 update-kubeconfig --name ECRCluster
			kubectl apply -f ./kubernetes-config.yml
			'''
                      }
                  }
            }
            
        }
      }