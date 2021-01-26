pipeline {
    agent {
        dockerfile {
            dir 'docker'
        }
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('google')
        TF_IN_AUTOMATION = 1
    }
    parameters {
        string( name: 'activator_params',
                description: 'json string'
        )
    }
    stages {
        stage('Initialise') {
            steps {
                sh '''
                    echo Setup activator_params
                    echo $activator_params | jq > ./terraform.auto.tfvars.json
                    echo Activate service account
                    gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS
                    gcloud config set project $projectid
                '''
           }
        }
