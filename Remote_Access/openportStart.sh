while ! ping -c 4 google.com > /dev/null; 
do 
sleep 1 
done
openport 22 -d
