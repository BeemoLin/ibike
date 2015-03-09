xvfb-run ruby ibike.rb

sudo cp ibike.json /var/lib/docker/aufs/mnt/544f95c2094cc2b2c320bb667a0514ee31eee569c0c195ea9c20ccd88f1375cf/

docker exec -it 544f95c2094c cp /ibike.json /var/www/html/ibike.json
