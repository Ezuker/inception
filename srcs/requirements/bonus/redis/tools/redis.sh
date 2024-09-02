#!/bin/bash

# Wait for a few seconds to ensure services are up
service redis-server restart
redis-cli monitor