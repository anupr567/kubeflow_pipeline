FROM python:3.7
WORKDIR /pipeline
COPY requirements.txt /pipeline
RUN pip install -r requirements.txt
COPY logistic_regression_rul.py /pipeline
ENTRYPOINT ["python", "logistic_regression_rul.py", "--data", "inputPath:Data", "--accuracy", "outputPath: Accuracy" ]