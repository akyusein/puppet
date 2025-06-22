pipeline {
    agent any

    environment {
        GEM_HOME = "${WORKSPACE}/.gems"
        PATH = "${env.GEM_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Install puppet-lint') {
            steps {
                sh '''
                    gem install --no-document puppet-lint
                '''
            }
        }

        stage('Run puppet-lint') {
            steps {
                sh '''
                    echo "Linting Puppet code..."
                    puppet-lint --fail-on-warnings manifests/
                '''
            }
        }
    }

    post {
        always {
            echo "Build finished"
        }
        failure {
            echo "Lint failed! Please fix Puppet code style issues."
        }
    }
}

