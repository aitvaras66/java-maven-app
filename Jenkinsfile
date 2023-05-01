#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@main', retriever: modernSCM(
    [$class: 'GitSCMSource',
     remote: 'https://github.com/aitvaras66/jenkins-shared-library.git',
     credentialsId: 'github-creds']
)

def gv

pipeline {
    agent any
    stages {
        stage("init") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }
        stage("build jar") {
            steps {
                script {
                    echo "building jar"
                    buildJar()
                }
            }
        }
        stage("build image") {
            steps {
                script {
                    echo "building image"
                    buildImage 'image name and tag'
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    echo "deploying wtf"
                    gv.deployApp()
                }
            }
        }
    }   
}
