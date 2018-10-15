# Restore Jenkins from Archive

Just so I don't forget, this is how you start Jenkins from an archived `JENKINS_HOME`. This is necessary when you need to move the configuration for an existing Jenkins server to a new host.

## Usage

1. Create an image: `docker build . -t jenkins`
2. Create and start the container with port 8080 exposed: `docker run -p 8080:8080 jenkins`
3. Wait for Jenkins to start up.
4. Visit `localhost:8080` in your browser.

You should see a login page. This means that Jenkins started from an existing configuration. :tada:

If you want to log in, the username is "admin" and the password is located at `/var/new_jenkins_home/secrets/initialAdminPassword` on the container filesystem.

## Caveat

This example does not use the default `JENKINS_HOME` (`/var/jenkins_home`) because it is mounted as a volume in the official Jenkins image, and Docker cannot overwrite a directory on the host. In a real-world scenario, you would shut down Jenkins, replace `/var/jenkins_home` on the host with the unzipped archive, and restart Jenkins.

