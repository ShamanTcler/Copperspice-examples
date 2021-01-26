import os
import re

from fnmatch import fnmatch
from conans import ConanFile, CMake, tools

class CS_Download_Convert(ConanFile)
    name = "Qt-24"
    version = "1.0"
    description = "Voidrealms Qt-24 QSlider and the QProgressbar"
    license = "Creative Commons Attribution license (reuse allowed)"
    generators = "cmake"
    settings = "os", "compiler", "build_type", "arch"

    def source(self)
        tools.get("https://github.com/voidrealms/Qt-24/tree/7bd0a12387c4738acf481dbc7a72f9774e064c6e")

