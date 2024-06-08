while ! ping -c 3 google.com > /dev/null; 
do 
sleep 1 
done
openport 22 -d
