# Section 1: Data Pipelines

## Setting up Airflow with Docker

1. Enter following command to get pre-made Docker container.
   ```zsh
   docker pull puckel/docker-airflow
   ```
2. Run and change the <code>/path/to/dags/on/your/local/machine/</code> path based on this folder path.
   ```zsh
   docker run -d -p 8080:8080 -v /path/to/dags/on/your/local/machine/:/usr/local/airflow/dags  puckel/docker-airflow webserver
   ```