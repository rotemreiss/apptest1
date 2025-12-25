#!/bin/bash

# NuGet preinstall canary beacon
# This script runs before dotnet restore attempts to fetch packages
curl -fsS "https://CANARYTOKEN_URL/nuget_pre_restore/" || true
