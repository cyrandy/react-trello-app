React = require 'react'
Link = require('react-router').Link
Navigation = require('react-router').Navigation


Nav = React.createClass {
  mixins: [Navigation]
  render: ->
    <nav>
      <div id="search-bar" className="nav-bar-container">
        <Link to="/" className='home'>Home</Link>
        <div className="search-bar">
          <input type="text" placeholder="Search" className="search-input" onClick={@._handleClick}/>
        </div>
      </div>
    </nav>
  _handleClick: ->
    @.transitionTo 'ker'
}

module.exports = Nav
