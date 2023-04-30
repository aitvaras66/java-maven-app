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
                    choice(name: 'ONE', choices: ['dev', 'staging', 'prod'], description: '')
                    choice(name: 'TWO', choices: ['dev', 'staging', 'prod'], description: '')
                }
            }
            steps {
                script {
                    echo "deploying"
                    echo "Deploying to ${ONE}"
                    echo "Deploying to ${TWO}"
                    gv.deployApp()
                }
            }
        }
    }   
}
