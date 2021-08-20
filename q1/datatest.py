import airflow
from airflow import DAG
from airflow.operators import BashOperator
from datetime import datetime, timedelta
import pandas as pd
import numpy as np
from datetime import datetime

# Following are defaults which can be overridden later on
default_args = {
    'owner': 'Wang Ting',
    'depends_on_past': False,
    'start_date': datetime(2021, 8, 20),
    'email': ['wangtingggy@gmail.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'catchup': False,
    "schedule_interval": '* 1 * * *',
    'max_active_run': 1
}

dag = DAG('datafile', default_args=default_args)


def task_read13():
    print("Reading dataset1 and dataset2")
    dataset1 = pd.read_csv('/usr/local/airflow/dags/dataset1.csv')
    dataset2 = pd.read_csv('/usr/local/airflow/dags/dataset2.csv')
    
    dataset1 = dataset1[dataset1['name'].notnull()]
    dataset2 = dataset2[dataset2['name'].notnull()]
    
    name_split_ds1 = dataset1['name'].str.split(n=1, expand=True)
    name_split_ds1 = name_split_ds1.rename(columns = {0: 'first_name', 1: 'last_name'})
    dataset1 = dataset1.join(name_split_ds1)
    dataset1.drop('name', axis=1, inplace=True)
    
    name_split_ds2 = dataset2['name'].str.split(n=1, expand=True)
    name_split_ds2 = name_split_ds2.rename(columns = {0: 'first_name', 1: 'last_name'})
    dataset2 = dataset2.join(name_split_ds2)
    dataset2.drop('name', axis=1, inplace=True)
    
    if (dataset1['price'].dtypes != 'float64' or dataset2['price'].dtypes != 'float64'):
        dataset1['price'] = dataset1['price'].astype('float64')
        dataset2['price'] = dataset2['price'].astype('float64')
    
    dataset1['above_100'] = dataset1['price'].apply(lambda x: True if x > 100 else False)
    dataset2['above_100'] = dataset2['price'].apply(lambda x: True if x > 100 else False)
    
    date_time = datetime.now().strftime("%Y%m%dT%H%M%S")
    dataset1.to_csv(f"/usr/local/airflow/dags/processed_dataset1_{date_time}.csv", index=True)
    dataset2.to_csv(f"/usr/local/airflow/dags/processed_dataset2_{date_time}.csv", index=True)
    

t1 = BashOperator(
    task_id='read_json_2012',
    python_callable=task_read13(),
    bash_command='python3 ~/airflow/dags/datatest.py',
    dag=dag)

