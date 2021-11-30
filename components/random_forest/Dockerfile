FROM python:3.7
WORKDIR /pipeline
COPY requirements.txt /pipeline
RUN pip install -r requirements.txt
COPY random_forest_regressor_rul.py /pipeline
ENTRYPOINT ["python", "random_forest_regressor_rul.py", "--data", "inputPath:Data", "--r2", "outputPath: r2" ]