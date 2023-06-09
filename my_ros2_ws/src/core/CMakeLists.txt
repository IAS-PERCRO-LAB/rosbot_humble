cmake_minimum_required(VERSION 3.8)
project(core)

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# Find dependencies
find_package(ament_cmake REQUIRED)
find_package(ament_cmake_python REQUIRED)
find_package(rclcpp REQUIRED)
find_package(rclpy REQUIRED)
find_package(sensor_msgs REQUIRED)

# Include Cpp "include" directory
include_directories(include)
ament_export_include_directories(include)

add_executable(monitor_battery src/monitor_battery.cpp)
ament_target_dependencies(monitor_battery
  "rclcpp"
  "sensor_msgs")

# Install C++ executables
install(TARGETS
  monitor_battery
  DESTINATION lib/${PROJECT_NAME})

  install(
    DIRECTORY include/
    DESTINATION include
  )

# Install Python modules
ament_python_install_package(${PROJECT_NAME})  

# Install Python executables
install(PROGRAMS
  scripts/monitor_battery.py
  DESTINATION lib/${PROJECT_NAME}
)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # comment the line when a copyright and license is added to all source files
  set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # comment the line when this package is in a git repo and when
  # a copyright and license is added to all source files
  set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
