FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

RUN apt update && apt install -y \
    python3.10 python3-pip \
    build-essential cmake git ninja-build ffmpeg \
    libgl1 unzip wget && apt clean

WORKDIR /app
    
# Clone source
# RUN git clone https://github.com/Phatdat01/wig_stick.git /app

# RUN git clone https://github.com/camenduru/HairFastGAN.git /tmp/HairFastGAN && \
#     mv /tmp/HairFastGAN/pretrained_models /app && \
#     rm -rf /tmp/HairFastGAN

# Sao chép mã nguồn vào container

    
COPY ./wig_stick /app

# Cài Python requirements
RUN pip3 install -r requirement.txt

# Cổng mặc định
EXPOSE 5000

# Lệnh khởi chạy
CMD ["python3", "main.py", "--listen", "0.0.0.0"]