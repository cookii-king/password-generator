#!/bin/bash

read -p "What type of password would you like to generate?
1. Random password
2. Password for JKS
Enter your choice: " choice

case $choice in
    1)
        # Generate a random password
        RANDOM_PASSWORD=$(LC_ALL=C </dev/urandom tr -dc 'a-zA-Z0-9!@#$%^&*()_-+=' | fold -w 16 | head -n 1)
        echo "Random Password: $RANDOM_PASSWORD"
        ;;
    2)
        read -p "Enter the password length for JKS: " password_length
        # Generate a password for JKS with valid characters
        JKS_PASSWORD=$(LC_ALL=C </dev/urandom tr -dc 'a-zA-Z0-9' | fold -w "$password_length" | head -n 1)
        echo "JKS Password: $JKS_PASSWORD"
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

