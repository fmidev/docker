pipeline {
  agent {
    node {
      label 'master'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh '''ls -la
./build.sh
mkdir -m 777 -p /tmp/shared-ccache
mkdir -m 777 -p /tmp/shared-yum-cache'''
      }
    }
    stage('Test') {
      steps {
        sh './test.sh'
      }
    }
    stage('Final test') {
      agent {
        docker {
          image 'fmidev'
          args '--mount type=tmpfs,destination=/ccache -v /tmp/shared-yum-cache:/var/cache/yum -v ${PWD}:/work -w /work'
        }

      }
      steps {
        sh './test-inside-container.sh'
      }
    }
  }
}