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
    stage('Test fmibase') {
      agent {
        docker {
          image 'fmibase'
          args '-v /tmp/shared-ccache:/ccache -v /tmp/shared-yum-cache:/var/cache/yum'
        }

      }
      steps {
        sh '''yum makecache
'''
      }
    }
    stage('Test fmidev') {
      agent {
        docker {
          image 'fmidev'
          args '-v /tmp/shared-ccache:/ccache -v /tmp/shared-yum-cache:/var/cache/yum'
        }

      }
      steps {
        sh '''yum makecache
yum update -y
yum install -y make
ccache -s'''
      }
    }
    stage('Test fmidev') {
      steps {
        sh '''ls -la /tmp/shared-ccache
ls -la /tmp/shared-yum-cache
test `find /tmp/shared-yum-cache -name \*.rpm | wc -l` -gt 0 
      }
    }    
  }
}