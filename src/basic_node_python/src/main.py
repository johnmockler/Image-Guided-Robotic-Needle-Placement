import rospy

from basic_node import BasicNode


def main():
    rospy.init_node('basic_node')
    basic_node_variable = BasicNode()

    rate = rospy.Rate(100)

    while not rospy.is_shutdown():
        basic_node_variable.function()
        rate.sleep()


if __name__== '__main__':
    main()