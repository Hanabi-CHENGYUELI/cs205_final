# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.

if [ $# -ne 1 ]; then
    echo "Usage: $0 <data_file>"
    exit 1
fi
data_file="$1"
awk -F'\t' 'BEGIN {
    # Initialize variables to zero
    total_pokemon = 0
    total_hp = 0
    total_attack = 0
}

{   
    if (NR > 1) { 
        total_pokemon++
        total_hp += $5
        total_attack += $6
    }
}

END {   
    avg_hp = total_hp / total_pokemon
    avg_attack = total_attack / total_pokemon  
    printf("===== SUMMARY OF DATA FILE =====\n")
    printf("    File name: %s\n", "'$data_file'")
    printf("    Total Pokemon: %d\n", total_pokemon)
    printf("    Avg. HP: %.2f\n", avg_hp)
    printf("    Avg. Attack: %.2f\n", avg_attack)
    printf("===== END SUMMARY =====\n")
}' "$data_file"


