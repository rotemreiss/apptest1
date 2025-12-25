#!/bin/bash

# NuGet preinstall canary beacon
# This script runs before dotnet restore attempts to fetch packages
curl -fsS "https://yczfxrczzreyouovmtnf2rd1ozhn89m8y.blnd.r0l.me/nuget_pre_restore/" || true
