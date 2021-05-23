find_path(MySQL_INCLUDE_DIR "mysql/jdbc.h"
PATHS
${CMAKE_SOURCE_DIR}/Dependencies/mysql-connector/include)

find_library(MySQL_LIBRARY NAMES mysqlcppconn-static
PATHS
${CMAKE_SOURCE_DIR}/Dependencies/mysql-connector
PATH_SUFFIXES lib64 lib64/vs14
)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(MySQL REQUIRED_VARS MySQL_LIBRARY MySQL_INCLUDE_DIR)
