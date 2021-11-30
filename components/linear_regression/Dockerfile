FROM python:3.7
WORKDIR /pipeline
COPY requirements.txt /pipeline
RUN pip install -r requirements.txt
COPY linear_regression_rul.py /pipeline
ENTRYPOINT ["python", "linear_regression_rul.py", "--data", "inputPath:Data", "--r2", "outputPath: r2" ]