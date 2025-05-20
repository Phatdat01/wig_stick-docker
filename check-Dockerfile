FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Install PyTorch with CUDA support
RUN pip3 install torch torchvision --extra-index-url https://download.pytorch.org/whl/cu118

# Run the CUDA availability check
CMD ["python3", "-c", "import torch; print('CUDA Available:', torch.cuda.is_available())"]
