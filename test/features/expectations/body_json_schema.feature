@nodejs-pending
Feature: Body - JSON schema

  Background: 
    Given expected HTTP body is defined by following "JSON schema":
    """
    {
      "type":"object",
      "$schema": "http://json-schema.org/draft-03/schema",
      "required":true,
      "properties":{
        "object": {
          "type":"object",
          "required":false,
          "properties":{
            "a": {
              "type":"string",
              "required":true
            },
            "c": {
              "type":"string",
              "required":trie
            },
            "e": {
              "type":"string",
              "required":true
            }
          }
        },
        "string": {
          "type":"string",
          "required":true
        }
      }
    }    
    """
  
  Scenario: payload body is valid against given schema 
    When real HTTP body is following:
    """
    {
      "object": {
        "a": "b",
        "c": "d"
      },
      "string": "Hello World"
    }
    """
    Then it should not set any errors for "body"
  
  Scenario: payload body not validad againts schema
    When real HTTP body is following:
    """
    {
      "object": {
        "a": "b",
        "c": "d",
        "e": "f"
      },
      "string": "Hello World"
    }
    """
    Then it should set some error for "body"
