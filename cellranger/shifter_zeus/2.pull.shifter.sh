#!/bin/bash

# assuming shifter on the HPC system
module load shifter

# pull only once

# original container
DOCKER_ID=uwadt
shifter pull $DOCKER_ID/cellranger:3.0.0

# modified container
MODIFIED_IMAGE=marcodelapierre/cr_test:mod2
shifter pull $MODIFIED_IMAGE
