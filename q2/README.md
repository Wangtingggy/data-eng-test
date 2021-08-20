# Section 2: Databases

## Setting up Docker image and container

1. Enter following command to build the Docker image.
   ```zsh
   docker build -t my-postgres-image .
   ```
2. To check the image(s) created, run
   ```zsh
   docker images -a
   ```
3. Next, run the image.
   ```zsh
   docker run my-postgres-image
   ```
4. Identify the container ID using
   ```zsh
   docker ps
   ```
5. Next, run the following command using the container ID from previous step.
   ```zsh
    docker exec -it deb8d3347b94 bash (CONTAINER ID)
   ```
6. To query from postgres, run
   ```zsh
   psql -U postgres
   ```

## SQL Queries Requested
For the 2 SQL statements requested, please refer to [here](queries.sql)