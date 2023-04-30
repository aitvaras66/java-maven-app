def gv

pipeline {
    agent any
    tools{
        maven 'maven-3.9'
    }
    stages {
        stage("build image") {
            steps {
                script {
                    echo "building docker image"
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]){
                        sh 'docker-build -t aitvaras/demo-app:jma-2.0 .'
                        sh "echo $PASS | docker login -u $USER --pasword-stdin"
                        sh 'docker push  aitvaras/demo-app:jma-2.0'
                        }
                    //gv.buildJar()
                }
            }
        }
        stage("build images") {
            steps {
                script {
                    echo "building image"
                    //gv.buildImage()
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    echo "deploying"
                    gv.deployApp()
                }
            }
        }
    }   
}
