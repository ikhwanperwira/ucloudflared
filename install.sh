BASEPATH="$HOME/.ucloudflared"

if [ -d "$BASEPATH" ]; then
  echo "Error: Directory $BASEPATH already exists. Move aborted."
  echo "Please remove $BASEPATH to reinstall."
  exit 1
fi

# Download repository with error handling
wget https://github.com/ikhwanperwira/ucloudflared/archive/refs/heads/main.zip || {
    echo "Error: Download failed!"
    exit 1
}

unzip main.zip || {
    echo "Error: Unzip failed!"
    exit 1
}
mv ucloudflared-main $BASEPATH

# Detect architecture
ARCH=$(uname -m)
echo "Detected architecture: $ARCH"

# Create virtual environment
echo "Creating virtual environment at: $BASEPATH/.venv"
python3 -m venv "$BASEPATH/.venv"

# Activate the virtual environment
echo "Activating virtual environment..."
source "$BASEPATH/.venv/bin/activate"

# Check for requirements.txt
if [ ! -f "$BASEPATH/requirements.txt" ]; then
    echo "Error: requirements.txt not found!"
    exit 1
fi

# Install dependencies
echo "Installing dependencies from requirements.txt..."
"$BASEPATH/.venv/bin/pip" install -r "$BASEPATH/requirements.txt"

# Optional: Symbolic link for ucloudflared within virtual environment
ln -s "$BASEPATH/ucloudflared" "$PREFIX/bin/ucloudflared"

# Exit gracefully
echo "Installation script completed successfully!"
echo "Run 'ucloudflared --hello-world' to make sure."
exit 0
