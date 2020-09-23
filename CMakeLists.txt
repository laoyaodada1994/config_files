# 设置 cmake最低版本
cmake_minimum_required (VERSION 2.6)

# Cmake调试log
message(STATUS "PROJECT_BINARY_DIR: " ${PROJECT_BINARY_DIR})

# 设置项目名称，参数${PROJECT_NAME}=name
project (my_project)

# 设置Project版本号
set (PROJECT_VERSION 0.1)

# 设置编译参数
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_BUILD_TYPE "Debug")
set(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -Wall -g -ggdb -DDEBUG")
set(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/../bin)

# 增加程序源文件
aux_source_directory(${PROJECT_SOURCE_DIR}/src DIR_SRC)
# aux_source_directory(<dir> <variable>):将当前目录中的源文件名称赋值给变量 DIR_SRC

# 增加头文件搜索路径
include_directories(${PROJECT_SOURCE_DIR}/include)
#include_directories：指定头文件的搜索路径，相当于指定gcc的-I参数


# 增加lib库的搜索路径
link_directories(${PROJECT_SOURCE_DIR}/lib)
# link_directories：动态链接库或静态链接库的搜索路径，相当于gcc的-L参数

add_executable(main ${DIR_SRC})
# add_executable：编译可执行程序， main是编译程序，DIR_SRC为源文件列表

# 添加指定的链接库
target_link_libraries(main libsuperlu.a)
# target_link_libraries：添加链接库,相同于指定-l参数
