#!/bin/bash
#Rana Musa 1210007
commands=("cat" "chmod" "wc" "tr" "sed" "who"  "cut" "date" "ls" "rm" "cp" "head" "tail" "sort" "apropos" "arch" "id" "uname" "free" "cmp") 
#verifying process
 echo "do you want to verify a certain command? (yes/no)"
  read answer
 
while [ $answer == "yes" ]
do
echo what command you want to verify? these are the available commands:
echo
echo "cat  chmod  wc  tr  sed  who  cut  date ls rm cp  head  tail  sort  apropos  arch  id  uname  free  cmp" 
echo
echo Enter command: 
read i
found=false
for item in "${commands[@]}"; do
    if [ "$item" == "$i" ]; then
        found=true
        echo "File exists!"
        break
    fi
done
echo

if $found; then
  version=$("$i" --version | sed -n '1p') #new version 
  
    version_history=$(cat "$i.txt" | grep "VERSION HISTORY:" | cut -c19-) #old version
    

    if [[ $version == $version_history ]]; then
      echo "$i version verified successfully with no issues!"
      echo
    else
      echo "$i version has changed!"
      echo
      echo "Old version : $version_history"
      echo "new version : $version"
      echo
    fi
fi


  

 if [ $found == "false" ];then
 echo "command not in list"
 echo
 fi
 echo "Enter yes to continue / no to exit"
 read answer
 done
