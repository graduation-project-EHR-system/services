#!/bin/bash

echo "Pulling changes from GitHub..."
git stash && git pull origin main --rebase && git stash apply

echo "Which service do you want to run?"
echo "1- Auth service"
echo "2- Staff management"
echo "-----------------------"
read -p "Enter the number of the service: " service_number
echo "-----------------------"

case $service_number in
  1)
    compose_file="authService.yml"
    service_name="Auth Service"
    ;;
  2)
    compose_file="staffMagementService.yml"
    service_name="Staff Management"
    ;;
  *)
    echo "Invalid selection. Exiting."
    exit 1
    ;;
esac

if [ -f "$compose_file" ]; then
  echo "Starting $service_name using $compose_file..."
  echo "---------------------------------------------"
  docker compose -f "$compose_file" up --pull always
else
  echo "Error: $compose_file not found. Exiting."
  echo "--------------------------------------------"
  exit 1
fi
