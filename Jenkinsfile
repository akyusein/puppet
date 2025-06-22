pipeline {
    agent any

    stages {
        stage('Validate Puppet Syntax') {
            steps {
                sh 'find manifests/ -name "*.pp" -exec puppet parser validate {} \\;'
            }
        }

        stage('Lint Puppet Code') {
            steps {
                sh 'puppet-lint manifests/ modules/'
            }
        }

        stage('Dry Run Apply (noop)') {
            steps {
                sh 'puppet apply --noop manifests/site.pp'
            }
        }
    }
}
