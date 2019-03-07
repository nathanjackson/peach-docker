FROM ubuntu:16.04

RUN apt-get update;                             \
    apt-get install -y mono-complete tzdata;    \
    apt-get clean all;                          \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update;                                         \
    apt-get install -y unzip curl;                          \
    curl -LO https://managedway.dl.sourceforge.net/project/peachfuzz/Peach/3.1/peach-3.1.124-linux-x86_64-release.zip;                                               \
    mkdir -p /peach;                                        \
    unzip -d /peach peach-3.1.124-linux-x86_64-release.zip; \
    rm -f peach-3.1.124-linux-x86_64-release.zip;           \
    apt-get remove -y unzip curl;                           \
    apt-get autoremove -y;                                  \
    apt-get clean all;                                      \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/peach:${PATH}"
