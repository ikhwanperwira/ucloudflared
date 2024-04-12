# Get the absolute path of the script
BASEPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Script location: $BASEPATH"  # Verbose echo for script location

# Detect architecture
ARCH=$(uname -m)
echo "Detected architecture: $ARCH"  # Verbose echo for detected architecture

# Create virtual environment (replace 'my_env' with your desired name)
echo "Creating virtual environment at: $BASEPATH/.venv"
python3 -m venv "$BASEPATH/.venv"

# Activate the virtual environment
echo "Activating virtual environment..."
source "$BASEPATH/.venv/bin/activate"

# Install dependencies from requirements.txt (ensure the file exists)
echo "Installing dependencies from requirements.txt..."
pip install -r "$BASEPATH/requirements.txt"

# Print success message (optional)
echo "Installation complete!"

# Move ucloudflared binary (assuming it exists)
if [ -f "$BASEPATH/ucloudflared" ]; then
  # Define target path (replace PREFIX if needed)
  TARGET_PATH="$PREFIX/bin/ucloudflared"
  echo "Moving ucloudflared to: $TARGET_PATH"
  mv "$BASEPATH/ucloudflared" "$TARGET_PATH"
  
  # Check if move was successful
  if [ -f "$TARGET_PATH" ]; then
    echo "ucloudflared successfully moved!"
  else
    echo "Error: Failed to move ucloudflared!"
  fi
fi

# **Caution message and move entire script directory (not recommended)**
echo "**WARNING: Moving the entire script directory to user home is not recommended for production use."
echo "**It may cause issues with script updates or functionality.**"

TARGET_DIR="$HOME/.ucloudflared"
if [ -d "$TARGET_DIR" ]; then
  echo "Error: Directory $TARGET_DIR already exists. Move aborted."
else
  echo "Moving script directory to: $TARGET_DIR"
  mv "$BASEPATH" "$TARGET_DIR"
  if [ -d "$TARGET_DIR" ]; then
    echo "Script directory moved successfully!"
  else
    echo "Error: Failed to move script directory!"
  fi
fi

# Exit with success code
echo "Installation script completed successfully!"
exit 0
