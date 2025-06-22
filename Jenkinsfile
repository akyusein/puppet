pipeline {
    agent any

    stages {
        stage('Validate Puppet Syntax') {
            steps {
                sh 'find /etc/puppetlabs/code/environments/production/manifests/ -name "*.pp" -exec puppet parser validate {} \\;'
            }
        }

        stage('Lint Puppet Code') {
            steps {
                sh 'puppet-lint /etc/puppetlabs/code/environments/production/modules/'
            }
        }
    }
}
