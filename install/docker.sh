# Function to display messages with gum
gum_message() {
  gum style --foreground 212 --bold --padding "1 1" "$1"
}

# Update the package list and install Docker
gum_message "Updating package list and installing Docker..."
sudo pacman -Syu --noconfirm docker

# Enable and start the Docker service
gum_message "Enabling and starting the Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

# Give this user privileged Docker access
gum_message "Adding the current user to the Docker group..."
sudo usermod -aG docker ${USER}

# Create Docker daemon configuration directory if it doesn't exist
sudo mkdir -p /etc/docker

# Use local logging driver - it's more efficient and uses compression by default.
gum_message "Configuring Docker to use the local logging driver..."
echo '{"log-driver":"local","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json >/dev/null

# Restart Docker to apply the new configuration
gum_message "Restarting Docker to apply the new configuration..."
sudo systemctl restart docker

# Print success message
gum_message "Docker installation and configuration completed successfully."
gum_message "You need to log out and log back in for the group changes to take effect."

# Optionally, you can add this at the end to automatically restart the shell
# exec su -l $USER
