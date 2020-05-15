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

class SetForceTorqueCollisionBehaviorRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lower_torque_thresholds_nominal = null;
      this.upper_torque_thresholds_nominal = null;
      this.lower_force_thresholds_nominal = null;
      this.upper_force_thresholds_nominal = null;
    }
    else {
      if (initObj.hasOwnProperty('lower_torque_thresholds_nominal')) {
        this.lower_torque_thresholds_nominal = initObj.lower_torque_thresholds_nominal
      }
      else {
        this.lower_torque_thresholds_nominal = new Array(7).fill(0);
      }
      if (initObj.hasOwnProperty('upper_torque_thresholds_nominal')) {
        this.upper_torque_thresholds_nominal = initObj.upper_torque_thresholds_nominal
      }
      else {
        this.upper_torque_thresholds_nominal = new Array(7).fill(0);
      }
      if (initObj.hasOwnProperty('lower_force_thresholds_nominal')) {
        this.lower_force_thresholds_nominal = initObj.lower_force_thresholds_nominal
      }
      else {
        this.lower_force_thresholds_nominal = new Array(6).fill(0);
      }
      if (initObj.hasOwnProperty('upper_force_thresholds_nominal')) {
        this.upper_force_thresholds_nominal = initObj.upper_force_thresholds_nominal
      }
      else {
        this.upper_force_thresholds_nominal = new Array(6).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetForceTorqueCollisionBehaviorRequest
    // Check that the constant length array field [lower_torque_thresholds_nominal] has the right length
    if (obj.lower_torque_thresholds_nominal.length !== 7) {
      throw new Error('Unable to serialize array field lower_torque_thresholds_nominal - length must be 7')
    }
    // Serialize message field [lower_torque_thresholds_nominal]
    bufferOffset = _arraySerializer.float64(obj.lower_torque_thresholds_nominal, buffer, bufferOffset, 7);
    // Check that the constant length array field [upper_torque_thresholds_nominal] has the right length
    if (obj.upper_torque_thresholds_nominal.length !== 7) {
      throw new Error('Unable to serialize array field upper_torque_thresholds_nominal - length must be 7')
    }
    // Serialize message field [upper_torque_thresholds_nominal]
    bufferOffset = _arraySerializer.float64(obj.upper_torque_thresholds_nominal, buffer, bufferOffset, 7);
    // Check that the constant length array field [lower_force_thresholds_nominal] has the right length
    if (obj.lower_force_thresholds_nominal.length !== 6) {
      throw new Error('Unable to serialize array field lower_force_thresholds_nominal - length must be 6')
    }
    // Serialize message field [lower_force_thresholds_nominal]
    bufferOffset = _arraySerializer.float64(obj.lower_force_thresholds_nominal, buffer, bufferOffset, 6);
    // Check that the constant length array field [upper_force_thresholds_nominal] has the right length
    if (obj.upper_force_thresholds_nominal.length !== 6) {
      throw new Error('Unable to serialize array field upper_force_thresholds_nominal - length must be 6')
    }
    // Serialize message field [upper_force_thresholds_nominal]
    bufferOffset = _arraySerializer.float64(obj.upper_force_thresholds_nominal, buffer, bufferOffset, 6);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetForceTorqueCollisionBehaviorRequest
    let len;
    let data = new SetForceTorqueCollisionBehaviorRequest(null);
    // Deserialize message field [lower_torque_thresholds_nominal]
    data.lower_torque_thresholds_nominal = _arrayDeserializer.float64(buffer, bufferOffset, 7)
    // Deserialize message field [upper_torque_thresholds_nominal]
    data.upper_torque_thresholds_nominal = _arrayDeserializer.float64(buffer, bufferOffset, 7)
    // Deserialize message field [lower_force_thresholds_nominal]
    data.lower_force_thresholds_nominal = _arrayDeserializer.float64(buffer, bufferOffset, 6)
    // Deserialize message field [upper_force_thresholds_nominal]
    data.upper_force_thresholds_nominal = _arrayDeserializer.float64(buffer, bufferOffset, 6)
    return data;
  }

  static getMessageSize(object) {
    return 208;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_control/SetForceTorqueCollisionBehaviorRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'af37de8897f6124b6b82b8dad5d5a876';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[7] lower_torque_thresholds_nominal
    float64[7] upper_torque_thresholds_nominal
    float64[6] lower_force_thresholds_nominal
    float64[6] upper_force_thresholds_nominal
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetForceTorqueCollisionBehaviorRequest(null);
    if (msg.lower_torque_thresholds_nominal !== undefined) {
      resolved.lower_torque_thresholds_nominal = msg.lower_torque_thresholds_nominal;
    }
    else {
      resolved.lower_torque_thresholds_nominal = new Array(7).fill(0)
    }

    if (msg.upper_torque_thresholds_nominal !== undefined) {
      resolved.upper_torque_thresholds_nominal = msg.upper_torque_thresholds_nominal;
    }
    else {
      resolved.upper_torque_thresholds_nominal = new Array(7).fill(0)
    }

    if (msg.lower_force_thresholds_nominal !== undefined) {
      resolved.lower_force_thresholds_nominal = msg.lower_force_thresholds_nominal;
    }
    else {
      resolved.lower_force_thresholds_nominal = new Array(6).fill(0)
    }

    if (msg.upper_force_thresholds_nominal !== undefined) {
      resolved.upper_force_thresholds_nominal = msg.upper_force_thresholds_nominal;
    }
    else {
      resolved.upper_force_thresholds_nominal = new Array(6).fill(0)
    }

    return resolved;
    }
};

class SetForceTorqueCollisionBehaviorResponse {
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
    // Serializes a message object of type SetForceTorqueCollisionBehaviorResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.string(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetForceTorqueCollisionBehaviorResponse
    let len;
    let data = new SetForceTorqueCollisionBehaviorResponse(null);
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
    return 'franka_control/SetForceTorqueCollisionBehaviorResponse';
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
    const resolved = new SetForceTorqueCollisionBehaviorResponse(null);
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
  Request: SetForceTorqueCollisionBehaviorRequest,
  Response: SetForceTorqueCollisionBehaviorResponse,
  md5sum() { return 'b1e592d1b6960bc05e6e3cba1eb02349'; },
  datatype() { return 'franka_control/SetForceTorqueCollisionBehavior'; }
};
