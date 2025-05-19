FROM python:3.10-slim

ENV PATH="/usr/local/cuda/bin:${PATH}"

RUN apt-get update && apt-get install -y \
    build-essential cmake git ninja-build ffmpeg \
    libgl1 unzip wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
    
# Clone source
# RUN git clone https://github.com/Phatdat01/wig_stick.git /app

# RUN git clone https://github.com/camenduru/HairFastGAN.git /tmp/HairFastGAN && \
#     mv /tmp/HairFastGAN/pretrained_models /app && \
#     rm -rf /tmp/HairFastGAN

# Sao chép mã nguồn vào container

    
COPY ./wig_stick /app

RUN python3.10 -m pip install --upgrade pip
# Cài Python requirements
RUN pip3 install -r requirement.txt

RUN pip3 install ninja
# Cổng mặc định
EXPOSE 5000

# Lệnh khởi chạy
CMD ["python3", "main.py", "--listen", "0.0.0.0"]