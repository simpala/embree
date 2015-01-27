## ======================================================================== ##
## Copyright 2009-2015 Intel Corporation                                    ##
##                                                                          ##
## Licensed under the Apache License, Version 2.0 (the "License");          ##
## you may not use this file except in compliance with the License.         ##
## You may obtain a copy of the License at                                  ##
##                                                                          ##
##     http://www.apache.org/licenses/LICENSE-2.0                           ##
##                                                                          ##
## Unless required by applicable law or agreed to in writing, software      ##
## distributed under the License is distributed on an "AS IS" BASIS,        ##
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. ##
## See the License for the specific language governing permissions and      ##
## limitations under the License.                                           ##
## ======================================================================== ##

FIND_PATH(TBB_INCLUDE_DIR tbb/task_scheduler_init.h PATHS /opt/intel/composerxe/tbb/include)
FIND_LIBRARY(TBB_LIBRARY tbb PATHS /opt/intel/composerxe/tbb/lib/mic)
FIND_LIBRARY(TBB_LIBRARY_MALLOC tbbmalloc PATHS /opt/intel/composerxe/tbb/lib/mic)
 
FIND_PATH(TBB_INCLUDE_DIR_MIC tbb/task_scheduler_init.h NO_DEFAULT_PATH PATHS /opt/intel/composerxe/tbb/include)
FIND_LIBRARY(TBB_LIBRARY_MIC tbb NO_DEFAULT_PATH PATHS /opt/intel/composerxe/tbb/lib/mic)
FIND_LIBRARY(TBB_LIBRARY_MALLOC_MIC tbbmalloc NO_DEFAULT_PATH PATHS /opt/intel/composerxe/tbb/lib/mic)

IF (TBB_INCLUDE_DIR AND TBB_LIBRARY AND TBB_LIBRARY_MALLOC)
  SET(TBB_FOUND TRUE)
  SET(TBB_INCLUDE_PATH ${TBB_INCLUDE_DIR})
  SET(TBB_LIBRARIES ${TBB_LIBRARY} ${TBB_LIBRARY_MALLOC})
ENDIF ()

IF (TBB_INCLUDE_DIR AND TBB_LIBRARY_MIC AND TBB_LIBRARY_MALLOC_MIC)
  SET(TBB_FOUND_MIC TRUE)
  SET(TBB_INCLUDE_PATH_MIC ${TBB_INCLUDE_DIR_MIC})
  SET(TBB_LIBRARIES_MIC ${TBB_LIBRARY_MIC} ${TBB_LIBRARY_MALLOC_MIC})
ENDIF ()

MARK_AS_ADVANCED(TBB_INCLUDE_DIR)
MARK_AS_ADVANCED(TBB_LIBRARY)
MARK_AS_ADVANCED(TBB_LIBRARY_MALLOC)

MARK_AS_ADVANCED(TBB_INCLUDE_DIR_MIC)
MARK_AS_ADVANCED(TBB_LIBRARY_MIC)
MARK_AS_ADVANCED(TBB_LIBRARY_MALLOC_MIC)