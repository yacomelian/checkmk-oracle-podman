#!/bin/bash

podman logs monitoring | grep -E "password:"
