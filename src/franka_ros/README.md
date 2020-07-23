# ROS integration for Franka Emika research robots

[![Build Status][travis-status]][travis]

See the [Franka Control Interface (FCI) documentation][fci-docs] for more information.

## Startup simulation

    roslaunch franka_example_controllers joint_position_example_controller_sim.launch
    rosrun franka_example_controllers test_move_node _command_topic:=/joint_position_example_controller_sim/joint_command

## Startup real Panda

    roslaunch franka_example_controllers joint_position_example_controller.launch
    rosrun franka_example_controllers test_move_node _command_topic:=/joint_position_example_controller/joint_command


## License

All packages of `franka_ros` are licensed under the [Apache 2.0 license][apache-2.0].

[apache-2.0]: https://www.apache.org/licenses/LICENSE-2.0.html
[fci-docs]: https://frankaemika.github.io/docs
[travis-status]: https://travis-ci.org/frankaemika/franka_ros.svg?branch=kinetic-devel
[travis]: https://travis-ci.org/frankaemika/franka_ros
