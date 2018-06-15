#!/bin/bash

conan create --build missing -pr profiles/macOS-x86_64/android-x86_64-api24.profile -s build_type=Release . ctin/stable && \
conan create --build missing -pr profiles/macOS-x86_64/android-arm64-api24.profile -s build_type=Release . ctin/stable && \
conan create --build missing -pr profiles/macOS-x86_64/macOS-x86_64.profile -s build_type=Release . ctin/stable  && \
conan create --build missing -pr profiles/macOS-x86_64/iOS-arm64-11.0.profile -s build_type=Release . ctin/stable && \
conan create --build missing -pr profiles/macOS-x86_64/iOS-x86_64-11.0.profile -s build_type=Release . ctin/stable
