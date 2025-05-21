#!/bin/bash
sensors | awk '/Tctl:/ { print int($2) "°C" }'
