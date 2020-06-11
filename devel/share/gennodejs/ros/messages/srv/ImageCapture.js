// Auto-generated. Do not edit!

// (in-package messages.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ImageCaptureRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImageCaptureRequest
    // Serialize message field [x]
    bufferOffset = _serializer.bool(obj.x, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImageCaptureRequest
    let len;
    let data = new ImageCaptureRequest(null);
    // Deserialize message field [x]
    data.x = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'messages/ImageCaptureRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6e7c7f7c11db7cc314e9efb95e17c2ed';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool x
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ImageCaptureRequest(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = false
    }

    return resolved;
    }
};

class ImageCaptureResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.y = null;
    }
    else {
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImageCaptureResponse
    // Serialize message field [y]
    bufferOffset = _serializer.bool(obj.y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImageCaptureResponse
    let len;
    let data = new ImageCaptureResponse(null);
    // Deserialize message field [y]
    data.y = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'messages/ImageCaptureResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0aa627fd156e9f77f006854bf1e783a2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ImageCaptureResponse(null);
    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ImageCaptureRequest,
  Response: ImageCaptureResponse,
  md5sum() { return '049e540a757cae7de9e26696e82f8da7'; },
  datatype() { return 'messages/ImageCapture'; }
};
