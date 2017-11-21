FROM python:3.6.3
RUN mkdir /code
WORKDIR /code
ADD requriments.txt /code/
RUN pip install -r requriments.txt -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
ADD . /code/
RUN python manager.py 