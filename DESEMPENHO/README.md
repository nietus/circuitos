Computer architeture 2 assignement to calculate perfomance in various contexts.

Docker was used to run ubuntu.

### Docker commands

docker build -t desempenho-app .
docker run --privileged -it desempenho-app > DockerRun.txt

### Output

DockerRun.txt > All the execution log with metrics

DockerRun.json was artificially created with one of the DockerRun.txt obtained

### Plotting

plot.ipynb extracted info from the json file
