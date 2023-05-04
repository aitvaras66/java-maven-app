#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@main', retriever: modernSCM(
    [$class: 'GitSCMSource',
     remote: 'https://github.com/aitvaras66/jenkins-shared-library.git',
     credentialsId: 'github-creds	'
    ]
)

pipeline {
    agent any
    tools {
        maven 'maven-3.9'
    }
    environment {
        IMAGE_NAME = 'aitvaras/demo-app:jma-1.0'
    }
    stages {
        stage('build app') {
            steps {
               script {
                  echo 'building application jar...'
                  buildJar()
               }
            }
        }
//        stage('build image') {
//            steps {
//                script {
//                   echo 'building docker image...'
//                   buildImage(env.IMAGE_NAME)
//                   dockerLogin()
//                   dockerPush(env.IMAGE_NAME)
//                }
//            }
//        }
        stage('deploy') {
            steps {
                script {
                   echo 'deploying docker image to EC2...'

                //    def shellCmd = "bash ./server-cmds.sh ${IMAGE_NAME}"
                    def dockerComposeCmd = "docker-compose -f docker-compose.yaml up --detach"
                    def ec2Instance = "ec2-user@13.53.235.77"

                   sshagent(['ec2-server-key']) {
                    //    sh "scp -o StrictHostKeyChecking=no server-cmds.sh ${ec2Instance}:/home/ec2-user"
                       sh "scp docker-compose.yaml ${ec2Instance}:/home/ec2-user"
                       sh "ssh -o StrictHostKeyChecking=no ${ec2Instance} ${dockerComposeCmd}"
                   }
                }
            }
        }
    }
}

