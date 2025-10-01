# Import Flask (tiny Python web framework)
from flask import Flask

# Create Flask app object
app = Flask(__name__)

# Define a route: when someone visits "/"
@app.route("/")
def home():
    return "Hello from cloud-p1 🚀"

# Health check endpoint for monitoring
@app.route("/health")
def health():
    return "OK"

# Run app only if script is executed directly
if __name__ == "__main__":
    # Start Flask server on port 80 (so browser can reach it)
    app.run(host="0.0.0.0", port=80)
