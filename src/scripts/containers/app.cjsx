React = require 'react'
Link = require('react-router').Link
RouteHandler = require('react-router').RouteHandler

NavBar = require '../components/navbar'

require '../styles/navbar.sass'

App = React.createClass {
  render: ->
    <div>
      <NavBar />
      <div className='main'>
        <RouteHandler/>
      </div>
    </div>
}

module.exports = App
