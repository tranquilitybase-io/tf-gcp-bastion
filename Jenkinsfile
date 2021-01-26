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
                    gcloud config set project $TG_PROJECT
                    PROJECT_NUMBER=$(gcloud projects describe $TG_PROJECT --format="value(projectNumber)")
                    echo "citrix-tfstate-${PROJECT_NUMBER}" > $WORKSPACE/.tg_bucket
                    export TG_BUCKET=`cat $WORKSPACE/.tg_bucket`
                    echo Validate TG_BUCKET variable
                    [[ -z "$TG_BUCKET" ]] && exit 1 || true
                '''
           }
        }
