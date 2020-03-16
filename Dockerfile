FROM python:3.7.4
MAINTAINER "Beyonderwei<beyonderwei@gmail.com>"

ENV PIP_SOURCE "https://pypi.tuna.tsinghua.edu.cn/simple"

# 用来存放源程序、日志和配置文件
RUN mkdir /src /logs /conf

WORKDIR /src

RUN pip install flask
RUN pip install gunicorn
RUN pip install -i ${PIP_SOURCE} gevent

EXPOSE 5000

CMD ["gunicorn", "-c", "/conf/gunicorn.py", "main:app"]
