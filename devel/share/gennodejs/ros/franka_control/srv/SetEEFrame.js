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

class SetEEFrameRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.F_T_EE = null;
    }
    else {
      if (initObj.hasOwnProperty('F_T_EE')) {
        this.F_T_EE = initObj.F_T_EE
      }
      else {
        this.F_T_EE = new Array(16).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetEEFrameRequest
    // Check that the constant length array field [F_T_EE] has the right length
    if (obj.F_T_EE.length !== 16) {
      throw new Error('Unable to serialize array field F_T_EE - length must be 16')
    }
    // Serialize message field [F_T_EE]
    bufferOffset = _arraySerializer.float64(obj.F_T_EE, buffer, bufferOffset, 16);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetEEFrameRequest
    let len;
    let data = new SetEEFrameRequest(null);
    // Deserialize message field [F_T_EE]
    data.F_T_EE = _arrayDeserializer.float64(buffer, bufferOffset, 16)
    return data;
  }

  static getMessageSize(object) {
    return 128;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_control/SetEEFrameRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ffa9d8a457d4fd59a3f69def5ded6d4d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[16] F_T_EE
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetEEFrameRequest(null);
    if (msg.F_T_EE !== undefined) {
      resolved.F_T_EE = msg.F_T_EE;
    }
    else {
      resolved.F_T_EE = new Array(16).fill(0)
    }

    return resolved;
    }
};

class SetEEFrameResponse {
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
    // Serializes a message object of type SetEEFrameResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.string(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetEEFrameResponse
    let len;
    let data = new SetEEFrameResponse(null);
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
    return 'franka_control/SetEEFrameResponse';
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
    const resolved = new SetEEFrameResponse(null);
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
  Request: SetEEFrameRequest,
  Response: SetEEFrameResponse,
  md5sum() { return '1e4ea5c444c20450d45357b4d238129b'; },
  datatype() { return 'franka_control/SetEEFrame'; }
};
