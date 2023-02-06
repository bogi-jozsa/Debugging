#!/bin/sh

#  delete_local_db_script.sh
#  Debugging
#
#  Created by Wolfpack Digital on 06.02.2023.
#  

fileName=$1

trimmed_string=${fileName#\"}
trimmed_string=${trimmed_string%\"}
echo "File location(shell): $trimmed_string"

[ -f $file ] && rm $trimmed_string
