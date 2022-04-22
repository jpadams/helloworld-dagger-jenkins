docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword

docker exec jenkins-docker cat /certs/client/key.pem
docker exec jenkins-docker cat /certs/client/cert.pem
docker exec jenkins-docker cat /certs/server/ca.pem

