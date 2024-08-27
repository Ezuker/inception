#!/bin/bash

# Wait for a few seconds to ensure services are up
service redis-server restart
chmod -R 777 
redis-cli monitor