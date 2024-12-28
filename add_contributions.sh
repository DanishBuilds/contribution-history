#!/bin/bash

# Script to add contributions on specific past dates

# Repository Setup
REPO_NAME="contribution-history"
REPO_URL="https://github.com/DanishBuilds/contribution-history.git"

# Clone or pull the repository
if [ ! -d "$REPO_NAME" ]; then
  git clone $REPO_URL
  cd $REPO_NAME
else
  cd $REPO_NAME
  git pull origin main
fi

# Configure Git User (ensure this matches your GitHub email)
git config user.name "Muhammad Danish Nawaz"
git config user.email "danishlashari3@gmail.com"

# Dates for contributions (Edit this array with your desired dates)
DATES=("2024-01-01" "2024-02-14" "2024-03-20" "2024-04-15")

# Add Contributions on each date
for DATE in "${DATES[@]}"; do
  echo "Contribution on $DATE" >> contributions.txt
  git add contributions.txt
  GIT_AUTHOR_DATE="$DATE 12:00:00" GIT_COMMITTER_DATE="$DATE 12:00:00" git commit -m "Contribution on $DATE"
done

# Push changes
git push origin main
