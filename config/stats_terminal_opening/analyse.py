import datetime
import plotly.express as px

# read the data from the file into a list
with open("term_stat", "r") as f:
    data = f.readlines()

# convert each timestamp into a human-readable date
dates = [datetime.datetime.fromtimestamp(int(timestamp.strip())) for timestamp in data]

# create a dictionary that maps each day to its count of timestamps
day_counts = {}
for date in dates:
    day = date.strftime("%d-%m-%Y")
    if day in day_counts:
        day_counts[day] += 1
    else:
        day_counts[day] = 1

# create a bar chart using Plotly
fig = px.bar(x=list(day_counts.keys()), y=list(day_counts.values()))
# label the x and y axes
fig.update_layout(xaxis_title="Day", yaxis_title="Number of opened terminals")
fig.show()


# create a dictionary that maps each hour to its count of timestamps
hour_counts = {}
for date in dates:
    hour = date.strftime("%H")
    if hour in hour_counts:
        hour_counts[hour] += 1
    else:
        hour_counts[hour] = 1

sorted_hour_counts = dict(sorted(hour_counts.items()))
# create a bar chart using Plotly
fig = px.bar(x=list(sorted_hour_counts.keys()), y=list(sorted_hour_counts.values()))

# label the x and y axes
fig.update_layout(xaxis_title="Hour", yaxis_title="Number of opened terminals")

fig.show()
