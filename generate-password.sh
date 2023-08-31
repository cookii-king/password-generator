#!/bin/bash

read -p "What type of password would you like to generate?
1. Random password
2. Password for JKS
Enter your choice: " choice

read -p "Enter the password length (default: 16): " password_length

# Set default password length to 16 if no input provided
password_length=${password_length:-16}

case $choice in
    1)
        # Generate a random password
        RANDOM_PASSWORD=$(LC_ALL=C </dev/urandom tr -dc 'a-zA-Z0-9!@%^&*_-+=' | fold -w "$password_length" | head -n 1)
        echo "Random Password: $RANDOM_PASSWORD"
        ;;
    2)
        # Generate a password for JKS with supported special characters
        JKS_PASSWORD=$(LC_ALL=C </dev/urandom tr -dc 'a-zA-Z0-9!@%^&*_-+=' | fold -w "$password_length" | head -n 1)
        echo "JKS Password: $JKS_PASSWORD"
        ;;
    *)
        echo "Invalid choice"
        ;;
esac
