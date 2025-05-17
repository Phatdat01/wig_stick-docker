FROM python:3.10-slim

RUN apt update && apt install -y \
    ninja-build \
    cmake \
    build-essential \
    git wget ffmpeg libgl1 unzip \
    && apt clean

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