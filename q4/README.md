# Section 4: Charts and APIs

## Accessing Visualisation Chart
For this task, my thought process was that I needed to know what insights should the chart deliver and based on the task given, to **display a visualisation representation of number of COVID19 cases in Singapore over time**, I filtered out 2 APIs - 1 that would return only values for a specific type of case (e.g. Confirmed cases), and another that would return all types of cases (e.g. Confirmed, Active etc). I decided to work on the first one first (as seen from the Jupyter notebook), but I gathered that visualising all types of cases over time in Singapore would be more insightful, and hence it was my chosen representation.

![COVID19 cases representation in Singapore](num_covid19_cases_sg.png)

Another thought of mine was what kind of dashboard would be used. However, to show how I processed the data (from calling the API to manipulating the Pandas Dataframes), I decided to use Jupyter Notebook and the visualisation libraries. This can be ported over to create an interactive Streamlit dashboard, by simply using <code>st.write(figure)</code> where the figure is the chart I've created.

To access the [notebook](q4.ipynb), simply start up your Jupyter Notebook.



