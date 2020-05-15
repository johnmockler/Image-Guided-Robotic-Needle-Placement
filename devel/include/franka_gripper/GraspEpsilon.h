// Generated by gencpp from file franka_gripper/GraspEpsilon.msg
// DO NOT EDIT!


#ifndef FRANKA_GRIPPER_MESSAGE_GRASPEPSILON_H
#define FRANKA_GRIPPER_MESSAGE_GRASPEPSILON_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace franka_gripper
{
template <class ContainerAllocator>
struct GraspEpsilon_
{
  typedef GraspEpsilon_<ContainerAllocator> Type;

  GraspEpsilon_()
    : inner(0.0)
    , outer(0.0)  {
    }
  GraspEpsilon_(const ContainerAllocator& _alloc)
    : inner(0.0)
    , outer(0.0)  {
  (void)_alloc;
    }



   typedef double _inner_type;
  _inner_type inner;

   typedef double _outer_type;
  _outer_type outer;





  typedef boost::shared_ptr< ::franka_gripper::GraspEpsilon_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::franka_gripper::GraspEpsilon_<ContainerAllocator> const> ConstPtr;

}; // struct GraspEpsilon_

typedef ::franka_gripper::GraspEpsilon_<std::allocator<void> > GraspEpsilon;

typedef boost::shared_ptr< ::franka_gripper::GraspEpsilon > GraspEpsilonPtr;
typedef boost::shared_ptr< ::franka_gripper::GraspEpsilon const> GraspEpsilonConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::franka_gripper::GraspEpsilon_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::franka_gripper::GraspEpsilon_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace franka_gripper

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'actionlib_msgs': ['/opt/ros/melodic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg'], 'franka_gripper': ['/home/rnm/catkin_ws/devel/share/franka_gripper/msg', '/home/rnm/catkin_ws/src/franka_ros/franka_gripper/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::franka_gripper::GraspEpsilon_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::franka_gripper::GraspEpsilon_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::franka_gripper::GraspEpsilon_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::franka_gripper::GraspEpsilon_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::franka_gripper::GraspEpsilon_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::franka_gripper::GraspEpsilon_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::franka_gripper::GraspEpsilon_<ContainerAllocator> >
{
  static const char* value()
  {
    return "95b2c5464a6f679bd1dacaf86414f095";
  }

  static const char* value(const ::franka_gripper::GraspEpsilon_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x95b2c5464a6f679bULL;
  static const uint64_t static_value2 = 0xd1dacaf86414f095ULL;
};

template<class ContainerAllocator>
struct DataType< ::franka_gripper::GraspEpsilon_<ContainerAllocator> >
{
  static const char* value()
  {
    return "franka_gripper/GraspEpsilon";
  }

  static const char* value(const ::franka_gripper::GraspEpsilon_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::franka_gripper::GraspEpsilon_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 inner # [m]\n"
"float64 outer # [m]\n"
;
  }

  static const char* value(const ::franka_gripper::GraspEpsilon_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::franka_gripper::GraspEpsilon_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.inner);
      stream.next(m.outer);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GraspEpsilon_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::franka_gripper::GraspEpsilon_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::franka_gripper::GraspEpsilon_<ContainerAllocator>& v)
  {
    s << indent << "inner: ";
    Printer<double>::stream(s, indent + "  ", v.inner);
    s << indent << "outer: ";
    Printer<double>::stream(s, indent + "  ", v.outer);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FRANKA_GRIPPER_MESSAGE_GRASPEPSILON_H
