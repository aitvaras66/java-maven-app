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
            // input{
            //     message "Select the env to deploy to"
            //     ok "Done"
            //     parameters{
            //         choice(name: 'ONE', choices: ['dev', 'staging', 'prod'], description: '')
            //         choice(name: 'TWO', choices: ['dev', 'staging', 'prod'], description: '')
            //     }
            // }
            steps {
                script {
                    echo "deploying"
                    // echo "Deploying to ${ONE}"
                    // echo "Deploying to ${TWO}"
                    def dockerCmd = 'docker run -p 3080:3080 -d aitvaras/demo-app:1.0'
                    sshagent(['ec2-server-key']) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@13.53.235.77 ${dockerCmd}"
                    }
                    gv.deployApp()
                }
            }
        }
    }   
}
