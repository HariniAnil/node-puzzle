# Build your comprehensive validation function here!
# Feel free to use any third party librarys from NPM (http://npmjs.org) for data validation.

exports.validate = (data) ->

  validators = require 'validator'
  
  if !data.hasOwnProperty('id') then return false #Required property id
  if !data.hasOwnProperty('name') then return false #Required property name
  if !data.hasOwnProperty('email') then return false #Required property email
  if !data.hasOwnProperty('taxRate') then return false #Required property taxRate

  if data.hasOwnProperty('favouriteColour') && typeof data.favouriteColour != 'string' then return false #favColour should be string

  if !/^\d+$/.test data.id then return false #id is integer
  if typeof data.name != 'string' then return false #name should be string
  if typeof data.email != 'string' then return false #email should be string

  if data.id < 0 then return false # id should be positive number
  if !validators.isEmail(data.email) then return false #email validation
  if !validators.isLength(data.email, {min:7, max: 255}) then return false #email length check
  if !validators.isLength(data.name, {min:1, max: 63}) then return false #name length check
  if !validators.isHexColor(data.favouriteColour) then return false #hex color value check
  if !validators.isFloat(data.taxRate + '', {min:0, max:1}) then return false #taxRate type and range check

  if data.interests && !Array.isArray(data.interests) then return false #interests should be array
  if data.interests && data.interests.length > 4 then return false #interests length check

  if data.interests && !data.interests.every(checkLength) then return false #length of each element in array should be less than 32
  

  return true

checkLength = (content) ->
  if content.length > 31 then return false
  return true