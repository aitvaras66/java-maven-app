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
            input{
                message "Select the env to deploy to"
                ok "Done"
                parameters{
                    choice(name: 'ENV', choices: ['dev', 'staging', 'prod'], description: '')
                }
            }
            steps {
                script {
                    echo "deploying"
                    echo "Deploying to ${ENV}"
                    gv.deployApp()
                }
            }
        }
    }   
}
