FROM python:3.7
WORKDIR /pipeline
COPY requirements.txt /pipeline
RUN pip install -r requirements.txt
COPY extract_data_rul.py /pipeline
ENTRYPOINT ["python", "extract_data_rul.py", "--data", "outputPath:Data" ]