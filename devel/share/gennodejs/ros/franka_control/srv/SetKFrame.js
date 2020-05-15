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

class SetKFrameRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.EE_T_K = null;
    }
    else {
      if (initObj.hasOwnProperty('EE_T_K')) {
        this.EE_T_K = initObj.EE_T_K
      }
      else {
        this.EE_T_K = new Array(16).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetKFrameRequest
    // Check that the constant length array field [EE_T_K] has the right length
    if (obj.EE_T_K.length !== 16) {
      throw new Error('Unable to serialize array field EE_T_K - length must be 16')
    }
    // Serialize message field [EE_T_K]
    bufferOffset = _arraySerializer.float64(obj.EE_T_K, buffer, bufferOffset, 16);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetKFrameRequest
    let len;
    let data = new SetKFrameRequest(null);
    // Deserialize message field [EE_T_K]
    data.EE_T_K = _arrayDeserializer.float64(buffer, bufferOffset, 16)
    return data;
  }

  static getMessageSize(object) {
    return 128;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_control/SetKFrameRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f8e38719bdb98c0e8ddafd6da2db480f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[16] EE_T_K
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetKFrameRequest(null);
    if (msg.EE_T_K !== undefined) {
      resolved.EE_T_K = msg.EE_T_K;
    }
    else {
      resolved.EE_T_K = new Array(16).fill(0)
    }

    return resolved;
    }
};

class SetKFrameResponse {
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
    // Serializes a message object of type SetKFrameResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.string(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetKFrameResponse
    let len;
    let data = new SetKFrameResponse(null);
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
    return 'franka_control/SetKFrameResponse';
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
    const resolved = new SetKFrameResponse(null);
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
  Request: SetKFrameRequest,
  Response: SetKFrameResponse,
  md5sum() { return '11b22d30e6a11a7b51828be575a77359'; },
  datatype() { return 'franka_control/SetKFrame'; }
};
