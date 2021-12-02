# kubeflow_pipeline
Here we are showcasing how to develop a ML pipeline workflow using containerised components. Components are dockerised separately. 
This way the individual components are reusable and portable. 
Also the CI setup has been provided that was enabled with the help of Cloudbuild and Google Container Registry. 
Components directory includes all the pipeline components.
build_all.sh and build_container.sh files will build images and push them to gcr for each component in one go.
setup_github_trigger.sh file will add build triggers for each component in one go.
ml_pipeline.ipynb file mentions all the commands in sequence to carry out the CI and running ML Pipeline.
