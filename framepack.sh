#!/bin/bash

# Cause the script to exit on failure.
set -eo pipefail

# Activate the main virtual environment
. /venv/main/bin/activate

git clone https://github.com/lllyasviel/FramePack /workspace/

# Set up any additional services
cat <<EOF > /etc/supervisor/conf.d/framepack.conf

EOF

cat <<EOF > /opt/supervisor-scripts/framepack.sh
#!/bin/bash
echo \$PWD
echo $PWD
EOF

chmod +x /opt/supervisor-scripts/framepack.sh

# Reconfigure the instance portal
rm -f /etc/portal.yaml
export PORTAL_CONFIG="localhost:8002:18002:/hello:MyApp|localhost:1111:11111:/:Instance Portal|localhost:8080:18080:/:Jupyter|localhost:8080:8080:/terminals/1:Jupyter Terminal|localhost:8384:18384:/:Syncthing|localhost:6006:16006:/:Tensorboard|localhost:7860:7860:/:Framepack"

# Reload Supervisor
supervisorctl reload
