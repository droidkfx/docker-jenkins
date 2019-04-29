JENKINS_VERSION=2.175;
DOCKER_VERSION=18.06.3-ce;

JENKINS_VERSION=${JENKINS_VERSION//-/_};
DOCKER_VERSION=${DOCKER_VERSION//-/_};

docker build -t droidkfx94/docker-jenkins:j${JENKINS_VERSION}_d${DOCKER_VERSION} -t droidkfx94/docker-jenkins:latest .;
docker push droidkfx94/docker-jenkins;
docker image prune -f;