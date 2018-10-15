# Restore Jenkins from Archive

Just so I don't forget, this is how you start Jenkins from an archived `JENKINS_HOME`.

## Usage

Create a container with Jenkins: 

```
docker build . -t jenkins
```

Start the container, exposing port 8080 to the host:

```
docker run -p 8080:8080 jenkins
```

Wait for Jenkins to start up. You can follow along with `docker logs jenkins -f`.

Visit `localhost:8080` in your browser. You should be able to log in with the username "admin" and the password at `/var/jenkins_home/secrets/initialAdminPassword`. This is evidence that you are restoring Jenkins from an archive, rather than configuring a fresh installation!

## Caveat

This example does not use the default `JENKINS_HOME` (`/var/jenkins_home`) because it is mounted as a volume in the official Jenkins image, and Docker cannot overwrite a directory on the host. In a real-world scenario, you would shut down Jenkins, replace `/var/jenkins_home` on the host with the unzipped archive, and restart Jenkins.

