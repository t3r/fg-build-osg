node('master') {
    stage ("SCM") {
        checkout scm
    }

    stage ("Build Image") {
      docker. build("flightgear/cpp-builder.opensuse:${BUILD_ID}")
    }

    stage( "Checkout") {
        git branch: 'OpenSceneGraph-3.4', changelog: true, poll: true, url: 'https://github.com/openscenegraph/OpenSceneGraph.git'
    }

    stage( "Build") {
        dir('build') {
            docker.image('flightgear/cpp-builder.opensuse:${BUILD_ID}').inside {
                sh '''
                    cmake -G "Unix Makefiles" \
                          -D CMAKE_BUILD_TYPE=Release \
                          -D CMAKE_PREFIX_PATH="$WORKSPACE/dist" \
                          -D CMAKE_CXX_FLAGS="-pipe" \
                          -D CMAKE_INSTALL_PREFIX:PATH=$WORKSPACE/dist \
                          .. \
                    && make && make install
                '''
            }
        }
    }

    stage("archive") {
        archiveArtifacts artifacts: 'dist/**', onlyIfSuccessful: true
    }

}

