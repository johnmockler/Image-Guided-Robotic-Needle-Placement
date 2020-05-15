// Auto-generated. Do not edit!

// (in-package franka_control.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetJointImpedanceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_stiffness = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_stiffness')) {
        this.joint_stiffness = initObj.joint_stiffness
      }
      else {
        this.joint_stiffness = new Array(7).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetJointImpedanceRequest
    // Check that the constant length array field [joint_stiffness] has the right length
    if (obj.joint_stiffness.length !== 7) {
      throw new Error('Unable to serialize array field joint_stiffness - length must be 7')
    }
    // Serialize message field [joint_stiffness]
    bufferOffset = _arraySerializer.float64(obj.joint_stiffness, buffer, bufferOffset, 7);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetJointImpedanceRequest
    let len;
    let data = new SetJointImpedanceRequest(null);
    // Deserialize message field [joint_stiffness]
    data.joint_stiffness = _arrayDeserializer.float64(buffer, bufferOffset, 7)
    return data;
  }

  static getMessageSize(object) {
    return 56;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_control/SetJointImpedanceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '45e5482efb638f20554d876158c68e96';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[7] joint_stiffness
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetJointImpedanceRequest(null);
    if (msg.joint_stiffness !== undefined) {
      resolved.joint_stiffness = msg.joint_stiffness;
    }
    else {
      resolved.joint_stiffness = new Array(7).fill(0)
    }

    return resolved;
    }
};

class SetJointImpedanceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.error = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('error')) {
        this.error = initObj.error
      }
      else {
        this.error = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetJointImpedanceResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.string(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetJointImpedanceResponse
    let len;
    let data = new SetJointImpedanceResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [error]
    data.error = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.error.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_control/SetJointImpedanceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '45872d25d65c97743cc71afc6d4e884d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    string error
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetJointImpedanceResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.error !== undefined) {
      resolved.error = msg.error;
    }
    else {
      resolved.error = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: SetJointImpedanceRequest,
  Response: SetJointImpedanceResponse,
  md5sum() { return 'f11c4defa2a13040512214f9d77dc982'; },
  datatype() { return 'franka_control/SetJointImpedance'; }
};
