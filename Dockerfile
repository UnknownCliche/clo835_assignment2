FROM ubuntu:20.04

# Set noninteractive mode to avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and clean up
RUN apt-get update -y && \
    apt-get install -y python3-pip mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy application files and templates
COPY app.py requirements.txt ./
COPY templates/ templates/

# Install Python dependencies
RUN pip3 install --upgrade pip && \
    pip3 install -r requirements.txt

# Expose port
EXPOSE 8080

# Run the application
CMD ["python3", "app.py"]
