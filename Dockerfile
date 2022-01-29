FROM debian:latest

WORKDIR "/home"


ENV BASH_ENV=/etc/profile

RUN echo "---> Install packages" \
    && apt-get update \
    && apt-get upgrade \
    && apt-get -y install \
        bash \
        cmake \
        cppcheck \
        g++ \
        gcc \
        wget \
        ninja-build \
        libgl-dev \
        pkg-config \
        sudo

RUN echo "---> Install Miniconda"
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
RUN bash /tmp/miniconda.sh -b -p /opt/conda
RUN rm /tmp/miniconda.sh

ENV PATH=/opt/conda/bin:${PATH} 

RUN ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc 

RUN echo "---> Install Python libs" \
    && conda install -c conda-forge mamba conan


RUN mkdir app/

COPY app/conanfile.txt app/
COPY app/CMakeLists.txt app/
COPY app/src app/src

COPY setup.sh .
RUN ./setup.sh

COPY compile.sh .


ENTRYPOINT [ "/bin/bash", "-c" ]