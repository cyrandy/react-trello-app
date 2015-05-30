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
        <nav>
          <Link to="todo">Todo</Link>
          <Link to="ker">Ker</Link>
        </nav>
      </div>
      <RouteHandler/>
    </div>
}

module.exports = App
