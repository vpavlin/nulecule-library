FROM vpavlin/atomicapp

LABEL RUN="docker run --rm $IMAGE"

RUN yum -y install git && \
    cd /tmp && \
    git clone https://github.com/vpavlin/nulecule-library && \
    cd nulecule-library && \
    atomicapp index generate . && \
    mv gen_index.yaml /gen_index.yaml && \
    rm -rf /tmp/nulecule-library && \
    yum -y remove git && \
    yum -y clean all 

ENTRYPOINT echo "This image contains index information about Nulecule applications stored in nulecule-library"
