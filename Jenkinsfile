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
        stage('Activate GCP Service Account and Set Project') {
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
        stage('Activator Terraform init validate plan') {
            steps {
                sh '''
                    terraform init 
                    terraform validate 
                    terraform plan -out bastion-plan 
                '''
           }
        }
        stage('Activator Infra Deploy') {
            steps {
                sh '''
                    terraform apply  --auto-approve bastion-plan
                '''
           }
        }
    }
        post {
        always {
            script {
                deleteDir()
            }
        }
    }
}
