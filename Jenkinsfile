def gv
// CODE_CHANGES = getGitChanges()
pipeline {
    agent any
    tools {
        maven 'maven-3.9'
    }
    parameters{
        // string(name: 'VERSION', defaultValue: '', description: 'version to deplopy')
        choice(name: 'VERSION', choices: ['1.0', '1.1', '1.2'], description: '')
        booleanParam(name: 'executeTests', defaultValue: true, description: '')
    }
    environment {
        NEW_VERSION = '1.3.0'
        SERVER_CREDENTIALS = credentials('server-cred')
    }
    stages {
        stage("init") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }
        stage("test") {
            // when {
            //     expression {
            //         env.BRANCH_NAME == 'dev' || BRANCH_NAME == 'main' && CODE_CHANGES == true
            //     }
            // }
            steps {
                when{
                    expression{
                        params.executeTests // == true
                    }
                }
                script {
                    echo "testing the app"
                    echo "building version ${NEW_VERSION}"
                    echo "deploying version ${params.VERSION}"
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
                    echo "deploying with ${SERVER_CREDENTIALS}"
                    sh "${SERVER_CREDENTIALS}"
                    withCredentials([
                        usernamePassword(credentials: 'server-cred', usernameVariable: USER, passwordVariable: PWD)
                    ]){
                        sh "some script ${USER} ${PWD}"
                    }
                    //gv.deployApp()
                }
            }
        }
    }   
    post{
        always {
            // executes always
        }
        success {
            // or failure depends what you want to use
        }
    }
}
