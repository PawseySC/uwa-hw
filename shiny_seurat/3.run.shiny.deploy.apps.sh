# https://hub.docker.com/r/rocker/shiny/

CONTAINER_ID=uwadt/shiny_seurat:3.5.1_2.3.4

# 1st time only, if container not already on machine
docker pull $CONTAINER_ID

# showcase
docker run --rm -d -p 3838:3838 -v /srv/shinyapps:/srv/shiny-server -v /srv/shinylog:/var/log/shiny-server --name shiny $CONTAINER_ID

