FROM ubuntu:18.04  
MAINTAINER prvnmali@gmail.com
RUN apt-get update
RUN apt-get install git curl -y
WORKDIR assignment
RUN git clone https://github.com/prvnmali2017/kubernetes.git
RUN cd kubernetes/assignment
COPY deployments services ./
RUN export k8sversion=v1.11.5
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$k8sversion/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
CMD ["date","uptime"]
