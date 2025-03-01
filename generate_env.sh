#!/bin/bash

echo "# Staff management service" >> .env
echo "staff_management_DB_CONNECTION=${{ secrets.staff_management_DB_CONNECTION }}" >> .env
echo "staff_management_DB_HOST=${{ secrets.staff_management_DB_HOST }}" >> .env
echo "staff_management_DB_PORT=${{ secrets.staff_management_DB_PORT }}" >> .env
echo "staff_management_DB_DATABASE=${{ secrets.staff_management_DB_DATABASE }}" >> .env
echo "staff_management_DB_USERNAME=${{ secrets.staff_management_DB_USERNAME  }}" >> .env
echo "staff_management_DB_PASSWORD=${{ secrets.staff_management_DB_PASSWORD }}" >> .env
echo -e "\n" >> .env
echo "# User management service" >> .env
echo "user_management_CONNECTION_STRING=${{ secrets.user_management_CONNECTION_STRING }}" >> .env
