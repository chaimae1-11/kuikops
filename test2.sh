#!/bin/bash


# Root directory
root_dir="root"

# Vérifiez si le nom du script créateur est fourni
creating_script_name=$1

if [ -z "$creating_script_name" ]; then
    echo "Le nom du script créateur doit être fourni en premier argument."
    exit 1
fi


# Vérifiez si au moins un répertoire source est fourni
if [ "$#" -lt 1 ]; then
    echo "Vous devez fournir au moins un répertoire source."
    exit 1
fi

# Créez le répertoire root
mkdir -p "$root_dir"

# Parcourez chaque répertoire source fourni en argument
for source_dir in "$@"; do
    # Vérifiez si le répertoire source existe
    if [ ! -d "$source_dir" ]; then
        echo "Le répertoire source '$source_dir' n'existe pas."
        continue
    fi

    # Récupérez le nom du répertoire source
    repo_name=$(basename "$source_dir")

    # Créez un répertoire sous le répertoire root pour chaque répertoire source
    repo_dir="$root_dir/$repo_name"
    mkdir -p "$repo_dir"

    # Parcourez chaque fichier dans le répertoire source
    for filepath in "$source_dir"/*; do
        # Vérifiez que c'est bien un fichier
        if [ -f "$filepath" ]; then
            # Récupérez le nom du fichier sans le chemin
            filename=$(basename "$filepath")

            # Récupérez les informations temporelles du fichier
            year=$(date -r "$filepath" +"%Y")
            month=$(date -r "$filepath" +"%m")
            day=$(date -r "$filepath" +"%d")
            hour=$(date -r "$filepath" +"%H")
            minute=$(date -r "$filepath" +"%M")
            second=$(date -r "$filepath" +"%S")
            millisecond=$(date -r "$filepath" +"%3N")

            # Récupérez le préfixe du fichier (partie avant le premier underscore)
            prefix=$(echo "$filename" | cut -d'_' -f1)

            # Créez la structure de répertoires hiérarchique
            prefix_dir="$repo_dir/$prefix"
            year_dir="$prefix_dir/$year"
            month_dir="$year_dir/$month"
            day_dir="$month_dir/$day"
            hour_dir="$day_dir/$hour"
            minute_dir="$hour_dir/$minute"
            second_dir="$minute_dir/$second"
            millisecond_dir="$second_dir/$millisecond"
            mkdir -p "$millisecond_dir"

            # Déplacez le fichier dans le répertoire correspondant
            new_filepath="$millisecond_dir/$filename"
             mv $new_file_path $millisecond_dir

            # Créez le nouveau fichier .dat avec les informations demandées
            new_filename="${minute}${second}${millisecond}.dat"
            new_file_path="$millisecond_dir/"$new_filename""
          
            echo "Old Filename: $filename" > "$new_file_path"
            echo "Old Path: $new_filepath" >> "$new_file_path"
            echo "Creating Script: $creating_script_name" >> "$new_file_path"
            chmod  600 "$new_file_path"
        fi
    done
done

echo "Organisation terminée."
