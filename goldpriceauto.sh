#
curl https://www.goodreturns.in/gold-rates/delhi.html --output ~/Documents/testwget.txt
grep -w -C 3 "10 gram" ~/Documents/testwget.txt >~/Documents/grepresult.txt
tr -d ' ' < ~/Documents/grepresult.txt > ~/Documents/nospaces.txt
grep -o -P '(?<=</i>).*(?=</td>)' ~/Documents/nospaces.txt >~/Documents/finalprice.txt
declare -a myArray
mapfile -t myArray < ~/Documents/finalprice.txt
MY_MESSAGE="22 carat today : " 
MY_MESSAGE+="${myArray[0]}___" 
MY_MESSAGE+="22 carat yesterday : " 
MY_MESSAGE+="${myArray[1]}___" 
MY_MESSAGE+="24 carat today : " 
MY_MESSAGE+="${myArray[2]}___" 
MY_MESSAGE+="24 carat yesterday : " 
MY_MESSAGE+="${myArray[3]}" 
echo  $MY_MESSAGE
zenity --notification --text="$MY_MESSAGE"
