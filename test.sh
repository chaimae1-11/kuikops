#!/bin/bash


repo=$1
prefix=$2
num_files=$3
ms=$4

# Debug: Print the arguments received
echo "Arguments reçus :"
echo "repo = $repo"
echo "prefix = $prefix"
echo "num_files = $num_files"
echo "ms = $ms"

# Check if the correct number of arguments are passed
if [ -z "$repo" ] || [ -z "$prefix" ] || [ -z "$num_files" ] || [ -z "$ms" ]; then
    echo "Usage: $0 <repo> <prefix> <num_files> <ms>"
    exit 1
fi

echo "Creating directory: $repo"
# Create the directory if it does not exist
mkdir -p "$repo"

echo "Répertoire $repo créé avec succès."

for ((i=1; i<=$num_files; i++)); do
    echo "Itération $i de la boucle"
    
    # Format the filename with date, milliseconds, and a zero-padded counter
    filename="$repo/${prefix}_$(date +'%Y_%m_%d_%H_%M_%S_%3N').txt"
    echo "Creating file: $filename"
    
    # Create the file in the specified directory
    touch "$filename"
    
    # Check if the file was created
    if [ -f "$filename" ]; then
        echo "File $filename created successfully."
    else
        echo "Failed to create file $filename."
    fi
    
    # Sleep for the specified milliseconds
    sleep $(bc <<< "scale=3; $ms/1000")
done

echo "Fin de la boucle"
