const aws = require( '../aws' );

const get = require( './get' ).get;
const getAll = require( './get' ).getAll;

// this will create a site
module.exports = {
  get,
  getAll
}
