# -*- coding: utf-8 -*-
"""
Created on Fri Oct  8 17:11:47 2021

@author: Anup
"""

import kfp
from kfp import dsl


@dsl.pipeline(name='First Pipeline',
              description='Applies extraction of data and pre processing it.')
def first_pipeline():
    # Loads the yaml manifest for components
    extract_data = kfp.components.load_component_from_file('components\extract_data\cloudbuild.yaml')
    preprocess_data = kfp.components.load_component_from_file('components\preprocess\cloudbuild.yaml')

    # Run task
    extract_task = extract_data()
    preprocess_task = preprocess_data()


# submit the pipeline for execution.
if __name__ == '__main__':
    pipeline = kfp.Client(
        host='https://7a7aa105a36f25a2-dot-us-central1.pipelines.googleusercontent.com').create_run_from_pipeline_func(
        first_pipeline, arguments={})        # how not to hardcode the host url?
