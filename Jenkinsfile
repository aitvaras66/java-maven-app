def gv

pipeline {
    agent any
    parameters{
        choice(name: 'BRANCH_NAME', choices: ['jenkins-job', 'main'], description: '')
    }
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
                    //gv.buildJar()
                }
            }
        }
        stage("build image") {
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
