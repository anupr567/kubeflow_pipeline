FROM python:3.7
WORKDIR /pipeline
COPY requirements.txt /pipeline
RUN pip install -r requirements.txt
COPY preprocess_data_rul.py /pipeline
ENTRYPOINT ["python", "preprocess_data_rul.py",  "--input_data", "inputPath: Input Data", "--output_data",
"outputPath: Output Data"]