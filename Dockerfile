FROM microros/base:galactic

WORKDIR /uros_ws

RUN apt update \
&& rosdep update \
&& rosdep install --from-paths src --ignore-src -y \
&&  apt install -y liblog4cxx-dev clang \
&&  rm -rf /var/lib/apt/list/*

# RUN . /opt/ros/$ROS_DISTRO/setup.sh \
# &&  . install/local_setup.sh \
# &&  ros2 run micro_ros_setup create_firmware_ws.sh zephyr nucleo_h743zi \
# &&  ros2 run micro_ros_setup configure_firmware.sh int32_publisher --transport udp\
# &&  ros2 run micro_ros_setup build_firmware.sh \
# &&  ros2 run micro_ros_setup create_agent_ws.sh \
# &&  ros2 run micro_ros_setup build_agent.sh \
# &&  rm -rf log/ build/ src/

# Disable shared memory
COPY disable_fastdds_shm.xml /tmp/
ENV FASTRTPS_DEFAULT_PROFILES_FILE=/tmp/disable_fastdds_shm.xml
ENV RMW_IMPLEMENTATION=rmw_microxrcedds

# setup entrypoint
COPY ./micro-ros_entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/micro-ros_entrypoint.sh"]
