Write-Host "Pulling changes from GitHub..."
git stash
git pull origin main --rebase
git stash apply

Write-Host "Which service do you want to run?"
Write-Host "1- Auth service"
Write-Host "2- Staff management"
Write-Host "-----------------------"
$service_number = Read-Host "Enter the number of the service"
Write-Host "-----------------------"

switch ($service_number) {
    1 {
        $compose_file = "authService.yml"
        $service_name = "Auth Service"
    }
    2 {
        $compose_file = "staffManagementService.yml"
        $service_name = "Staff Management"
    }
    default {
        Write-Host "Invalid selection. Exiting."
        exit 1
    }
}

if (Test-Path $compose_file) {
    Write-Host "Starting $service_name using $compose_file..."
    Write-Host "---------------------------------------------"
    docker compose -f $compose_file up --pull always
} else {
    Write-Host "Error: $compose_file not found. Exiting."
    Write-Host "--------------------------------------------"
    exit 1
}
