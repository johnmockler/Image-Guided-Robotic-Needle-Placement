import rospy

#all other imports here. possibly import messages to use as data types


class BasicNode:

    def __init__(self):

        #set variables equal to param
        self.first_param = rospy.get_param('~first_param', True)

        #subscribe to topics. callback function here will run each time ros 'spins' and something is being published on the topic
        rospy.Subscriber("/topic_1", Message_Type, self.callback_function)

        #create publishers
        self.my_publisher = rospy.Publisher("/topic_2", int, queue_size=0)

        #initialize class variables
        self.callback_data = 0

    def function(self):
        #do something here related to node, then publish data

        local_variable = 10

        self.my_publisher.publish(local_variable)

    def callback_function(self, data):
        #add data from topic to a class variable
        self.callback_data = data

