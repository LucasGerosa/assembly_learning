#!/bin/bash

readonly storing_file_name=stored_path.txt
readonly stored_path=$(cat $storing_file_name)
# Prompt user for input if stored path is empty
if [ -s "$storing_file_name" ]; then

	# echo "Please enter the path to your assembly file (without .asm extension), or press enter to assemble and run :"
	# read full_path
		#Is the same as 
	read -r -p "Please enter the path to your assembly file (without .asm extension), or press enter to assemble and run 
$stored_path
" full_path
	
	if [ -z "$full_path" ]; then
		full_path=$stored_path

	fi

else 
    read -p "Please enter the full path of your program: " full_path
fi

file_name=$(basename $full_path)
if [[ $file_name == *.asm ]]; then
    file_name=${file_name%.*}
else
    file_name=$file_name
fi
directory=$(dirname $full_path)
full_path=$directory/$file_name
echo "$full_path" > $storing_file_name #stores the full_path in $storing_file_name

# Assemble and link the file
if nasm -f elf32 "$full_path.asm" -o "$directory/bin/$file_name.o" && ld -m elf_i386 "$directory/bin/$file_name.o" -o "$directory/bin/$file_name"; then
    # Print success message
    echo "$file_name has been assembled and linked successfully!"
    # Remove object file
    rm "$directory/bin/$file_name.o"
    # Run executable
    "$directory/bin/$file_name"
    echo $?
else
    # Print error message
    echo "Error assembling or linking $file_name."
fi
