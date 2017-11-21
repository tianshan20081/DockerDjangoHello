FROM python:3.6.2
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
ADD . /code/
RUN python manager.py 

CMD /code/docker-entrypoint.sh