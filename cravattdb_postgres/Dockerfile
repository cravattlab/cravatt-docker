FROM postgres

# by convention .sh files in below directory are automagically executed
# during setup
ADD setupDatabase.sh /docker-entrypoint-initdb.d/setupDatabase.sh
RUN chmod 755 /docker-entrypoint-initdb.d/setupDatabase.sh