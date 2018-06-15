import platform

from conans.client.run_environment import RunEnvironment
from conans.model.conan_file import ConanFile, tools
from conans import CMake
import os
import sys


class DefaultNameConan(ConanFile):
    name = "DefaultName"
    version = "0.1"
    settings = "os", "compiler", "arch", "build_type"
    generators = "cmake"

    def build(self):
        cmake = CMake(self)
        if self.options["boost"].header_only:
            cmake.definitions["HEADER_ONLY"] = "TRUE"
        if self.options["boost"].python:
            cmake.definitions["WITH_PYTHON"] = "TRUE"

        cmake.configure()
        cmake.build()

    def test(self):
        print("hello there")        
