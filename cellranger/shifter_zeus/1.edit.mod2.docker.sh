## NOTE: some commands are to be run from the host shell, some from the container

# assuming you have the cellranger:3.0.0 image locally, e.g. the one built with 1.build.docker.orig.sh
# also assuming you have the patched source file "reference_3.0.0_mod1.py" available


# host shell : start original cellranger container in interactive mode
DOCKER_ID=uwadt
docker run --rm -it -v $(pwd):/data -w /data --name cellranger_mod $DOCKER_ID/cellranger:3.0.0 bash


### INSIDE THE CONTAINER ### : modify cellranger container
cp reference_3.0.0_mod1.py /apps/cellranger-3.0.0/cellranger-cs/3.0.0/lib/python/cellranger/reference.py
# Press buttons "Ctrl-p-q" to exit container while leaving it running


# host shell : save modified container (commit), then push it to your webrepo (requires docker account)
MODIFIED_IMAGE=marcodelapierre/cr_test:mod2
docker commit -p cellranger_mod $MODIFIED_IMAGE
docker stop cellranger_mod
docker push $MODIFIED_IMAGE
