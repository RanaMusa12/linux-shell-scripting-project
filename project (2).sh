#!/bin/bash
#Rana Musa 1210007
# Define the array of commands
commands=("cat" "chmod" "wc" "tr" "sed" "who"  "cut" "date" "ls" "rm" "cp" "head" "tail" "sort" "apropos" "arch" "id" "uname" "free" "cmp")  
bold=$(tput bold)
normal=$(tput sgr0)
# Loop through the commands
for i in "${commands[@]}"; do
   file_name="${i}".txt #creating files
  
  text=$i #
printf "%40s\n" "$text" >"$file_name"
 echo "-----------------------------------------------------------------------------------" >> "$file_name"

 echo >> "$file_name"
echo >> "$file_name"



  
des_text=$(man "$i" | awk '/^DESCRIPTION/,/^$/' | grep -v '^$' | sed '1d' | cut -c 8- | tr -s ' ')


ver_text=$("$i" --version | sed -n '1p' | tr -s ' '| tr '\n' ' ')







printf "DESCRIPTION:\t $des_text "  | column -s $'\t'  >> "$file_name"


  
echo   "____________" >> "$file_name"
echo >> "$file_name"
echo >> "$file_name"
echo "-----------------------------------------------------------------------------------" >> "$file_name"
printf "VERSION HISTORY:\t$ver_text" | column -W 2 -s $'\t' -t >> "$file_name"
echo   "________________" >> "$file_name"
echo >> "$file_name"
echo >> "$file_name"
echo "-----------------------------------------------------------------------------------" >> "$file_name"
  # Get an example
 
  touch test_file # to clearify examples
  echo this is a test file. will be used to showe examples on linux commands > test_file
  echo linux is good >> test_file
  echo this is a project >> test_file
  echo my id is 1210007 >> test_file
  echo this is line 5 >> test_file
  touch test_file2
  echo this is test file 2 > test_file2
  
  if [ $i == "cat" ]
  then
 example="cat test_file\n"

  
  elif [ $i == "chmod" ]
  then
  example="chmod 777 test_file \n" 

  elif [ $i == "wc" ]
  then
  example="cat test_file | wc -l\n" 

  elif [ $i == "tr" ]
  then
  example="cat test_file | tr [a-z] [A-Z] \n " 

  elif [ $i == "sed" ]
  then
  example="sed 's/linux/LINUX/g' test_file"
  

   elif [ $i == "cut" ]
  then
  
  example="cat test_file | cut -c1-10 \n"

  
   elif [ $i == "rm" ]
  then
  example="rm file.txt"
  
  elif [ $i == "cp" ]
  then
  example=" cp file1 file2"
 
 
   elif [ $i == "head" ]
  then
 example="head -n 3 test_file\n"

  elif [ $i == "tail" ]
  then
  example="tail -n 3 test_file\n"
 
    elif [ $i == "ls" ]
  then
 example="ls -l test_file\n"
  
  ls -l test_file >> "$file_name"
  
   elif [ $i == "sort" ]
  then
  example="sort test_file\n"

  
  elif [ $i == "apropos" ]
  then
  example="apropos '^list' \n"

 
   elif [ $i == "cmp" ]
  then
  example="cmp test_file test_file2 \n"
  

  
  
 else 
  
  example="$i \n"


  fi
  echo >> "$file_name"
echo >> "$file_name"
printf "EXAMPLE:\t$example" | column -W 2 -s $'\t' -t >> "$file_name"
echo   "________" >> "$file_name"


if [ $i == "cat" ]
  then  
  cat test_file >> "$file_name"
  
  elif [ $i == "chmod" ]
  then
  chmod +x test_file |   ls -l test_file >> "$file_name"
 
  
  elif [ $i == "wc" ]
  then

  cat test_file | wc -l >> "$file_name"
  
  elif [ $i == "tr" ]
  then
 
 
  cat test_file | tr [a-z] [A-Z] >> "$file_name"
  
  elif [ $i == "sed" ]
  then
  sed 's/linux/LINUX/g' test_file >> "$file_name"
  
   elif [ $i == "cut" ]
  then
  cat test_file | cut -c1-10  >> "$file_name"
  

 
   elif [ $i == "head" ]
  then

  
  head -n 3 test_file >> "$file_name"
  
  elif [ $i == "tail" ]
  then

 
  tail -n 3 test_file >> "$file_name"
  
  
    elif [ $i == "ls" ]
  then
  echo -e "ls -l test_file\n">> "$file_name"
    ls -l test_file >> "$file_name"
    
    
   elif [ $i == "sort" ]
  then
  sort test_file >> "$file_name"
  
  
  elif [ $i == "apropos" ]
  then
 apropos '^list' | sed -n '1p' >> "$file_name"
 
   elif [ $i == "cmp" ]
  then
   cmp test_file test_file2 >> "$file_name"
  
    elif [ $i == "cp" ]
  then
   true
   
     elif [ $i == "rm" ]
  then
  true
  
 else 
  

  
  $i  >> "$file_name"
 

  fi

echo >> "$file_name"
echo >> "$file_name"
echo "-----------------------------------------------------------------------------------" >> "$file_name"


  # Get related commands
  printf "RELATED COMMANDS:\t" | column -W 2 -s $'\t' -t >> "$file_name"
  echo "______________" >> "$file_name"
  

  
  case $i in
  "chmod") compgen -c | grep ^ch | head -n 5 >> "$file_name" ;;
  
  "rm") compgen -c | grep ^rm | head -n 5 >> "$file_name" ;;
  
  
  "head") compgen -c | grep he | head -n 5 >> "$file_name" ;;
  
   "apropos") compgen -c | grep pos | head -n 5 >> "$file_name" ;;
   
   "uname") compgen -c | grep name | head -n 5 >> "$file_name" ;;
   
   "sed") compgen -c | grep se[a-z] | head -n 5 >> "$file_name" ;;
   
   *) compgen -c | grep $i | head -n 5 >> "$file_name" ;;
  
  esac
  
echo >> "$file_name"
echo >> "$file_name"

echo "-----------------------------------------------------------------------------------" >> "$file_name"
 printf "NOTES:\t" | column -W 2 -s $'\t' -t >> "$file_name"
  
   echo -e " ______" >>"$file_name"
   
   echo >> "$file_name"
echo >> "$file_name"
echo "-----------------------------------------------------------------------------------" >> "$file_name"

done
echo "Finished generating Files !"
echo
echo "Do you want to see a spesific manual? (yes/no)"
read ans
if [ "$ans" == "yes" ]; then
echo "What command?"
        echo
        echo "This is the commands list:"
        echo
        echo "cat - chmod - wc - tr - sed - who - cut - date - ls - rm - cp - head - tail - sort - apropos - arch - id - uname - free - cmp"
read choice
cat $choice.txt
fi




  #search
  echo "-----------------------------------------------------------------------------------" 
  echo
  
echo "SEARCH!!"

echo "Enter yes for search or e to exit  "
read ans
if [ "$ans" == "$e" ]
then
exit
fi 
if [ "$ans" == "yes" ]
then

echo
echo "Enter your choice"
echo "1.Serch in Manuals"
echo "2.Search for a word in all Manuals " #will return the commands which thier manual descripthion has a certain word
read choice

case $choice in
1)
echo "Do you want to search for a certain command? (yes/no) or e to exit"
read answer

if [ "$answer" == "e" ]; then
    exit
fi

while [ "$answer" != "no"  ]; do
    if [ "$answer" == "yes" ]; then
        echo "What command do you want to search for? These are the available commands:"
        echo "${commands[@]}"
        read command_to_search

        found=false

        for item in "${commands[@]}"; do
            if [ "$item" == "$command_to_search" ]; then
                found=true
                echo "File exists"
                break
            fi
        done

        if $found; then
            echo "This is the command manual:"
            cat "$command_to_search.txt"
        else
            echo "This command does not exist in the list."
        fi

        echo "Do you want to search for a certain command? (yes/no) or e to exit"
        read answer

        if [ "$answer" == "e" ]; then
            exit
        fi
   
    fi
done

;;

2)
echo "Enter a word to search for:"
read word
echo "---------"
echo "these some commands their manual has the word $word: "
echo
apropos $word | awk '{print $1}' | head -n 5


;;
esac
fi

#Command Recommendation:

found=false
for item in "${commands[@]}"; do
    if [ "$item" == "$command_to_search" ]; then
        found=true
        break
    fi
done
if $found ;then
echo
echo "-----------------------------------------------------------------------------------"
echo

echo "    Recommendations!"

echo "You recently searched for $command_to_search"

echo

echo "You can see these commands too:"

while true; do
    case $command_to_search in
        "cat")
            echo "1. tac"
            echo "2. less"
            echo "3. more"
            ;;
        "chmod")
            echo "1. chown"
            echo "2. chgrp"
            ;;
        "wc")
            echo "1. sed"
            echo "2. awk"
            echo
            echo "Want to see sed manual? (yes / no)"
            read answer

            if [ "$answer" == "yes" ]; then
                cat sed.txt
            fi
            ;;
        "tr")
            echo "1. sed"
            echo "2. perl"
            echo
            echo "Want to see sed manual? (yes / no)"
            read answer

            if [ "$answer" == "yes" ]; then
                cat sed.txt
            fi
            ;;
        "sed")
            echo "1. tr"
            echo "2. perl"
            echo "3. awk"
            echo
            echo "Want to see tr manual? (yes / no)"
            read answer

            if [ "$answer" == "yes" ]; then
                cat tr.txt
            fi
            ;;
        "who")
            echo "1. w"
            echo "2. users"
            echo "3. whoami"
            echo "4. id"
            echo
            echo "Want to see id manual? (yes / no)"
            read answer

            if [ "$answer" == "yes" ]; then
                cat id.txt
            fi
            ;;
        "cut")
            echo "1. sed"
            echo "2. paste"
            echo "3. awk"
            echo
            echo "Want to see sed manual? (yes / no)"
            read answer

            if [ "$answer" == "yes" ]; then
                cat sed.txt
            fi
            ;;
        "date")
            echo "1. cal"
            echo "2. uptime"
            echo
            ;;
        "ls")
            echo "1. stat"
            echo "2. dir"
            echo "3. tree"
            echo
            ;;
        "rm")
            echo "1. rmdir"
            echo "2. unlink"
            echo "3. trash-put"
            echo
            ;;
        "cp")
            echo "1. rsync"
            echo "2. tar"
            echo
            ;;
        "head")
            echo "1. cat"
            echo "2. tail"
            echo
            echo "Want to see cat manual? (yes / no)"
            read answer

            if [ "$answer" == "yes" ]; then
                cat cat.txt
            fi
            echo "Want to see tail manual? (yes / no)"
            read answer

            if [ "$answer" == "yes" ]; then
                cat tail.txt
            fi
            ;;
        "tail")
            echo "1. cat"
            echo "2. head"
            echo
            echo "Want to see cat manual? (yes / no)"
            read answer

            if [ "$answer" == "yes" ]; then
                cat cat.txt
            fi
            echo "Want to see head manual? (yes / no)"
            read answer

            if [ "$answer" == "yes" ]; then
                cat head.txt
            fi
            ;;
        "sort")
            echo "1. uniq"
            echo "2. awk"
            echo
            ;;
        "arch")
            echo "1. uname"
            echo "2. lscpu"
            echo "3. inxi"
            echo
            echo "Want to see uname manual? (yes / no)"
            read answer

            if [ "$answer" == "yes" ]; then
                cat uname.txt
            fi
            ;;
        "apropos")
            echo "1. man"
            echo "2. whatis"
            echo
            ;;
        "id")
            echo "1. whoami"
            echo "2. groups"
            echo
            ;;
        "uname")
            echo "1. arch"
            echo "2. hostname"
            echo
            echo "Want to see arch manual? (yes / no)"
            read answer

            if [ "$answer" == "yes" ]; then
                cat arch.txt
            fi
            ;;
        "free")
            echo "1. top"
            echo "2. vmstat"
            echo
            ;;
        "cmp")
            echo "1. diff"
            echo "2. sdiff"
            ;;
        *)
            echo "This is not an option"
            ;;
    esac
    echo
    echo "-----------------------------------------------------------------------------------"
echo

    echo "Do you want to see more Recommendations? yes or e to exit"
    read answer

    if [ "$answer" == "e" ]; then
        exit
    fi

    if [ "$answer" == "yes" ]; then
    echo
        echo "What command?"
        echo
        echo "This is the commands list:"
        echo
        echo "cat - chmod - wc - tr - sed - who - cut - date - ls - rm - cp - head - tail - sort - apropos - arch - id - uname - free - cmp"

        echo
        echo "Enter Command"
        read command_to_search
    else
        exit
    fi
 
done


fi

