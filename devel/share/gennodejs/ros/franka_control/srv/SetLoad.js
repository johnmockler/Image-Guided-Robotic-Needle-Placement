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

class SetLoadRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mass = null;
      this.F_x_center_load = null;
      this.load_inertia = null;
    }
    else {
      if (initObj.hasOwnProperty('mass')) {
        this.mass = initObj.mass
      }
      else {
        this.mass = 0.0;
      }
      if (initObj.hasOwnProperty('F_x_center_load')) {
        this.F_x_center_load = initObj.F_x_center_load
      }
      else {
        this.F_x_center_load = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('load_inertia')) {
        this.load_inertia = initObj.load_inertia
      }
      else {
        this.load_inertia = new Array(9).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetLoadRequest
    // Serialize message field [mass]
    bufferOffset = _serializer.float64(obj.mass, buffer, bufferOffset);
    // Check that the constant length array field [F_x_center_load] has the right length
    if (obj.F_x_center_load.length !== 3) {
      throw new Error('Unable to serialize array field F_x_center_load - length must be 3')
    }
    // Serialize message field [F_x_center_load]
    bufferOffset = _arraySerializer.float64(obj.F_x_center_load, buffer, bufferOffset, 3);
    // Check that the constant length array field [load_inertia] has the right length
    if (obj.load_inertia.length !== 9) {
      throw new Error('Unable to serialize array field load_inertia - length must be 9')
    }
    // Serialize message field [load_inertia]
    bufferOffset = _arraySerializer.float64(obj.load_inertia, buffer, bufferOffset, 9);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetLoadRequest
    let len;
    let data = new SetLoadRequest(null);
    // Deserialize message field [mass]
    data.mass = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [F_x_center_load]
    data.F_x_center_load = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [load_inertia]
    data.load_inertia = _arrayDeserializer.float64(buffer, bufferOffset, 9)
    return data;
  }

  static getMessageSize(object) {
    return 104;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_control/SetLoadRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0bcbb33b081d0f0b2611ae00474a91d6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 mass
    float64[3] F_x_center_load
    float64[9] load_inertia
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetLoadRequest(null);
    if (msg.mass !== undefined) {
      resolved.mass = msg.mass;
    }
    else {
      resolved.mass = 0.0
    }

    if (msg.F_x_center_load !== undefined) {
      resolved.F_x_center_load = msg.F_x_center_load;
    }
    else {
      resolved.F_x_center_load = new Array(3).fill(0)
    }

    if (msg.load_inertia !== undefined) {
      resolved.load_inertia = msg.load_inertia;
    }
    else {
      resolved.load_inertia = new Array(9).fill(0)
    }

    return resolved;
    }
};

class SetLoadResponse {
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
    // Serializes a message object of type SetLoadResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.string(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetLoadResponse
    let len;
    let data = new SetLoadResponse(null);
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
    return 'franka_control/SetLoadResponse';
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
    const resolved = new SetLoadResponse(null);
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
  Request: SetLoadRequest,
  Response: SetLoadResponse,
  md5sum() { return 'c9a8ec436164dd9cbc1e5e137d358e0b'; },
  datatype() { return 'franka_control/SetLoad'; }
};
