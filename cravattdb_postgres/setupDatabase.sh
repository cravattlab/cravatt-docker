TEST=`gosu postgres psql --user postgres <<- EOSQL
   SELECT 1 FROM pg_database WHERE datname='$DB_NAME';
EOSQL`
echo "******CREATING DOCKER DATABASE******"
if [[ $TEST == "1" ]]; then
    # database exists
    # $? is 0
    exit 0
else
gosu postgres psql --user postgres <<- EOSQL
   CREATE ROLE $DB_USER WITH LOGIN ENCRYPTED PASSWORD '${DB_PASS}' CREATEDB;
EOSQL
gosu postgres psql --user postgres <<- EOSQL
   CREATE DATABASE $DB_NAME WITH OWNER $DB_USER TEMPLATE template0 ENCODING 'UTF8';
EOSQL
gosu postgres psql --user postgres <<- EOSQL
   GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOSQL
gosu postgres psql --user postgres <<- EOSQL
   \c $DB_NAME
   CREATE EXTENSION pg_trgm;
EOSQL
fi
echo ""
echo "******DOCKER DATABASE CREATED******"