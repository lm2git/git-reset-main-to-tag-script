#!/bin/bash

# Function to reset to a tag
reset_to_tag() {
  # Ask for the pre-release tag name
  echo "Enter the pre-release tag name (e.g., v1.0.0): "
  read tag_name

  # Check if the tag exists in the repository
  if git rev-parse "$tag_name" >/dev/null 2>&1; then
    echo "The tag $tag_name exists. Proceeding with the reset..."
  else
    echo "Error: The tag $tag_name does not exist in the repository. Exiting..."
    exit 1
  fi

  # Ask if you want to create a new 'main' branch based on the tag
  echo "Do you want to create a new 'main' branch based on $tag_name? (y/n)"
  read create_new_main

  if [ "$create_new_main" == "y" ]; then
    echo "Creating a new 'main' branch from the tag $tag_name..."
    git checkout -b main "$tag_name"
    git push origin main --force
    echo "New 'main' branch created and pushed to the remote."
  else
    # If you don't want to create a new branch, reset the existing 'main' branch
    echo "Switching to the 'main' branch and resetting to the tag $tag_name..."
    git checkout main
    git reset --hard "$tag_name"
    git push origin main --force
    echo "The 'main' branch has been reset to the tag $tag_name and pushed to the remote."
  fi
}

# Main script

# Ask if you want to reset 'main' to a tag
echo "Do you want to make a tag the new version of the 'main' branch? (y/n)"
read proceed

if [ "$proceed" == "y" ]; then
  reset_to_tag
else
  echo "Operation canceled."
  exit 0
fi
