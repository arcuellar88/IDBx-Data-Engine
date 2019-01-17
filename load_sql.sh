/usr/local/mysql/bin/mysql -u root  --database STG -e "TRUNCATE TABLE "$2

for f in sample_data/courses/*$1*.sql
do
     /usr/local/mysql/bin/mysql -u root  --database STG -e "LOAD DATA LOCAL INFILE '"$f"' INTO TABLE "$2"
      FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 LINES"
echo "Done: '"$f"' at $(date)"
done
