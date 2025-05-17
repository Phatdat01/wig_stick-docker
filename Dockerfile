FROM nvidia/cuda:12.1.1-runtime-ubuntu20.04

RUN apt update && apt install -y \
    git python3 python3-pip wget ffmpeg libgl1 unzip \
    && apt clean

# Clone source
# RUN git clone https://github.com/Phatdat01/wig_stick.git /app

# RUN git clone https://github.com/camenduru/HairFastGAN.git /tmp/HairFastGAN && \
#     mv /tmp/HairFastGAN/pretrained_models /app && \
#     rm -rf /tmp/HairFastGAN

# Sao chép mã nguồn vào container
COPY ./wig_stick /app

WORKDIR /app

# Cài Python requirements
RUN pip3 install -r requirements.txt

# Cổng mặc định
EXPOSE 5000

# Lệnh khởi chạy
CMD ["python3", "api.py"]