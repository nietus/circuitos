Computer architeture 2 assignement to calculate perfomance in various contexts.

Docker Desktop must be up and running before you execute the commands.

### Docker commands

docker build -t desempenho-app .

docker run --privileged -it desempenho-app > DockerRun.txt

### Outputs

DockerRun.txt  contains all the execution log with metrics

DockerRun.json was artificially created with one of the DockerRun.txt obtained

### Plotting

plot.py extracted info from the json file to plot the charts
