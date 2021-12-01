FROM python:3.7
WORKDIR /pipeline
COPY requirements.txt /pipeline
RUN pip install -r requirements.txt
COPY process_data_rul_classifier.py /pipeline
ENTRYPOINT ["python", "process_data_rul_classifier.py",  "--input_data", "inputPath: Input Data", "--output_data", "outputPath: Output Data"]
