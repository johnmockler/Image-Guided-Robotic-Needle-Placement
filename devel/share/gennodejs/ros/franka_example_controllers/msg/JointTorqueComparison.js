// Auto-generated. Do not edit!

// (in-package franka_example_controllers.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class JointTorqueComparison {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tau_error = null;
      this.tau_commanded = null;
      this.tau_measured = null;
      this.root_mean_square_error = null;
    }
    else {
      if (initObj.hasOwnProperty('tau_error')) {
        this.tau_error = initObj.tau_error
      }
      else {
        this.tau_error = new Array(7).fill(0);
      }
      if (initObj.hasOwnProperty('tau_commanded')) {
        this.tau_commanded = initObj.tau_commanded
      }
      else {
        this.tau_commanded = new Array(7).fill(0);
      }
      if (initObj.hasOwnProperty('tau_measured')) {
        this.tau_measured = initObj.tau_measured
      }
      else {
        this.tau_measured = new Array(7).fill(0);
      }
      if (initObj.hasOwnProperty('root_mean_square_error')) {
        this.root_mean_square_error = initObj.root_mean_square_error
      }
      else {
        this.root_mean_square_error = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointTorqueComparison
    // Check that the constant length array field [tau_error] has the right length
    if (obj.tau_error.length !== 7) {
      throw new Error('Unable to serialize array field tau_error - length must be 7')
    }
    // Serialize message field [tau_error]
    bufferOffset = _arraySerializer.float64(obj.tau_error, buffer, bufferOffset, 7);
    // Check that the constant length array field [tau_commanded] has the right length
    if (obj.tau_commanded.length !== 7) {
      throw new Error('Unable to serialize array field tau_commanded - length must be 7')
    }
    // Serialize message field [tau_commanded]
    bufferOffset = _arraySerializer.float64(obj.tau_commanded, buffer, bufferOffset, 7);
    // Check that the constant length array field [tau_measured] has the right length
    if (obj.tau_measured.length !== 7) {
      throw new Error('Unable to serialize array field tau_measured - length must be 7')
    }
    // Serialize message field [tau_measured]
    bufferOffset = _arraySerializer.float64(obj.tau_measured, buffer, bufferOffset, 7);
    // Serialize message field [root_mean_square_error]
    bufferOffset = _serializer.float64(obj.root_mean_square_error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointTorqueComparison
    let len;
    let data = new JointTorqueComparison(null);
    // Deserialize message field [tau_error]
    data.tau_error = _arrayDeserializer.float64(buffer, bufferOffset, 7)
    // Deserialize message field [tau_commanded]
    data.tau_commanded = _arrayDeserializer.float64(buffer, bufferOffset, 7)
    // Deserialize message field [tau_measured]
    data.tau_measured = _arrayDeserializer.float64(buffer, bufferOffset, 7)
    // Deserialize message field [root_mean_square_error]
    data.root_mean_square_error = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 176;
  }

  static datatype() {
    // Returns string type for a message object
    return 'franka_example_controllers/JointTorqueComparison';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6c09db90263c92a2e4e4d736f67bc033';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[7] tau_error
    float64[7] tau_commanded
    float64[7] tau_measured
    float64 root_mean_square_error
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JointTorqueComparison(null);
    if (msg.tau_error !== undefined) {
      resolved.tau_error = msg.tau_error;
    }
    else {
      resolved.tau_error = new Array(7).fill(0)
    }

    if (msg.tau_commanded !== undefined) {
      resolved.tau_commanded = msg.tau_commanded;
    }
    else {
      resolved.tau_commanded = new Array(7).fill(0)
    }

    if (msg.tau_measured !== undefined) {
      resolved.tau_measured = msg.tau_measured;
    }
    else {
      resolved.tau_measured = new Array(7).fill(0)
    }

    if (msg.root_mean_square_error !== undefined) {
      resolved.root_mean_square_error = msg.root_mean_square_error;
    }
    else {
      resolved.root_mean_square_error = 0.0
    }

    return resolved;
    }
};

module.exports = JointTorqueComparison;
