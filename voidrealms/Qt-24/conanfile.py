import os
import re
import shutil
import sys

from fnmatch import fnmatch
from conans import ConanFile, CMake, tools

class CS_Download_Convert(ConanFile):
    name = os.path.basename(os.getcwd())    
    print("Processing void realms project:",name)
    print()
    version = "1.0"
    description = "Voidrealms:" + name
    license = "Creative Commons Attribution license (reuse allowed)"
    generators = "cmake"
    settings = "os", "compiler", "build_type", "arch"

    def source(self):
        git_src="https://github.com/voidrealms/" + self.name
        print("     Git_src:",git_src)

        # Get the source from Github
        git_org = tools.Git(folder="original_source")
        git_org.clone(git_src, "master")
        
        # make a copy of it
        shutil.copytree("original_source", "cs_source")

        # run  PepperMill recursively on cs_source ( PepperMill --recursive <your_path> -f )
        os.system("PepperMill --recursive cs_source -f")
        
        

