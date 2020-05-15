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

class SetCartesianImpedanceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cartesian_stiffness = null;
    }
    else {
      if (initObj.hasOwnProperty('cartesian_stiffness')) {
        this.cartesian_stiffness = initObj.cartesian_stiffness
      }
      else {
        this.cartesian_stiffness = new Array(6).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetCartesianImpedanceRequest
    // Check that the constant length array field [cartesian_stiffness] has the right length
    if (obj.cartesian_stiffness.length !== 6) {
      throw new Error('Unable to serialize array field cartesian_stiffness - length must be 6')
    }
    // Serialize message field [cartesian_stiffness]
    bufferOffset = _arraySerializer.float64(obj.cartesian_stiffness, buffer, bufferOffset, 6);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetCartesianImpedanceRequest
    let len;
    let data = new SetCartesianImpedanceRequest(null);
    // Deserialize message field [cartesian_stiffness]
    data.cartesian_stiffness = _arrayDeserializer.float64(buffer, bufferOffset, 6)
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_control/SetCartesianImpedanceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '591a43081c539ee56ec83a33587e68c4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[6] cartesian_stiffness
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetCartesianImpedanceRequest(null);
    if (msg.cartesian_stiffness !== undefined) {
      resolved.cartesian_stiffness = msg.cartesian_stiffness;
    }
    else {
      resolved.cartesian_stiffness = new Array(6).fill(0)
    }

    return resolved;
    }
};

class SetCartesianImpedanceResponse {
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
    // Serializes a message object of type SetCartesianImpedanceResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.string(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetCartesianImpedanceResponse
    let len;
    let data = new SetCartesianImpedanceResponse(null);
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
    return 'franka_control/SetCartesianImpedanceResponse';
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
    const resolved = new SetCartesianImpedanceResponse(null);
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
  Request: SetCartesianImpedanceRequest,
  Response: SetCartesianImpedanceResponse,
  md5sum() { return 'c648a0b1340a53eac0c535568e9b5c60'; },
  datatype() { return 'franka_control/SetCartesianImpedance'; }
};
