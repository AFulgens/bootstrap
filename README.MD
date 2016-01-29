Because I got tired...

# Bootstrap Ubuntu servers
sudo sh -c 'curl -s https://raw.githubusercontent.com/AFulgens/bootstrap/master/server/bootstrap.sh | bash'

# Bootstrap Ubuntu clients
sudo apt-get install -y curl
sudo sh -c 'curl -s https://raw.githubusercontent.com/AFulgens/bootstrap/master/client/bootstrap.sh | bash'
