#!/bin/bash

echo "🚀 GitHub Multiple Account SSH Setup"

# Ask for the number of GitHub accounts
read -p "How many GitHub accounts do you want to add? " count

# Ensure user provides a valid number
if ! [[ "$count" =~ ^[0-9]+$ ]] || [ "$count" -le 0 ]; then
    echo "❌ Invalid number. Please enter a valid number."
    exit 1
fi

# SSH directory setup
mkdir -p ~/.ssh
ssh_config_file=~/.ssh/config

# Backup existing SSH config if exists
if [ -f "$ssh_config_file" ]; then
    mv "$ssh_config_file" "$ssh_config_file.bak"
    echo "🔄 Existing SSH config backed up to ~/.ssh/config.bak"
fi

# Create a new SSH config file
touch "$ssh_config_file"

# Store account details
declare -A accounts

# Loop through each account setup
for ((i=1; i<=count; i++)); do
    echo ""
    echo "➡️ Setting up GitHub account #$i"

    # Get account details
    read -p "Enter email for this GitHub account: " email
    read -p "Enter a unique key name (e.g., personal, work): " keyname

    # Define SSH key paths
    key_path="~/.ssh/id_rsa_github_$keyname"

    # Generate SSH key
    ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/id_rsa_github_$keyname -N ""

    # Add SSH key to agent
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa_github_$keyname

    # Add SSH config entry
    echo -e "\n# $keyname GitHub Account" >> "$ssh_config_file"
    echo "Host github-$keyname" >> "$ssh_config_file"
    echo "    HostName github.com" >> "$ssh_config_file"
    echo "    User git" >> "$ssh_config_file"
    echo "    IdentityFile ~/.ssh/id_rsa_github_$keyname" >> "$ssh_config_file"

    # Store account details for final display
    accounts[$email]="~/.ssh/id_rsa_github_$keyname.pub"
done

echo ""
echo "✅ All GitHub accounts have been set up!"
echo ""
echo "📌 **Add the following SSH keys to GitHub:**"

# Display details for adding to GitHub
for email in "${!accounts[@]}"; do
    echo ""
    echo "📧 **Email:** $email"
    echo "🔑 **SSH Key:**"
    cat ${accounts[$email]}
    echo "--------------------------------------"
done

echo "📝 Go to https://github.com/settings/keys and add these keys."
echo "🚀 You can now use 'git clone git@github-<keyname>:your-username/repo.git' to switch between accounts."

