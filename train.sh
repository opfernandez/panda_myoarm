#!/bin/bash

PORT=$1
TIMESTEP=$2
CHECKPOINT_NAME=$3

if [ -z "$PORT" ] || [ -z "$TIMESTEP" ] || [ -z "$CHECKPOINT_NAME" ]; then
  echo "Usage: ./run_training.sh <port> <time_step> <checkpoint_name>"
  exit 1
fi

cd dm_robotics_panda/examples/

nohup python3 rl_side_panda_myoarm.py -p $PORT -n $CHECKPOINT_NAME &

nohup python3 agent_side_panda_myoarm.py -p $PORT -t $TIMESTEP &

echo "New train has been launched '${CHECKPOINT_NAME}' in port ${PORT} (timestep=${TIMESTEP})"