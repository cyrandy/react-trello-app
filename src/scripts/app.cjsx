React = require 'react'
Link = require('react-router').Link
RouteHandler = require('react-router').RouteHandler

App = React.createClass {
  render: ->
    <div>
      Hello world!
      <nav>
        <Link to="todo">Todo</Link>
        <Link to="ker">Ker</Link>
      </nav>
      <RouteHandler/>
    </div>
}

module.exports = App
