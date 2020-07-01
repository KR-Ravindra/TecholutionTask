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
                      withAWS(credentials: 'aws-cred', region:'us-west-2') {
			sh '''
      aws eks create-cluster --name ECRCluster \
      --role-arn arn:aws:iam::446589149068:role/eksClusterRole \
      --resources-vpc-config subnetIds=subnet-6782e71e,subnet-e7e761ac,securityGroupIds=sg-6979fe18
			aws eks --region us-west-2 update-kubeconfig --name ECRCluster
			kubectl apply -f ./kubernetes-config.yml
			'''
                      }
                  }
            }
            
        }
      }