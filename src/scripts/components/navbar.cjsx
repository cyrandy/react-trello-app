React = require 'react'
Link = require('react-router').Link

Nav = React.createClass {
  render: ->
    <nav>
      <div id="search-bar" className="nav-bar-container">
        <Link to="/" className='home'>Home</Link>
        <div className="search-bar">
          <input type="text" placeholder="Search" className="search-input" />
        </div>
      </div>
    </nav>
}

module.exports = Nav
