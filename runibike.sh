export PATH="/home/beemolin/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

xvfb-run ruby /home/beemolin/backup/ibike/ibike.rb

sudo cp -r /home/beemolin/backup/ibike/ibike.json /var/lib/docker/aufs/mnt/a8ae26bcdce46d1a7d5a77fb687635debfc7b1fba49984aa706429926dfd8722/

sudo docker exec -i a8ae26bcdce4 cp /ibike.json /var/www/html/ibike.json
