React = require 'react'

module.exports = React.createClass {
  render: ->
    <div className='list-item'>
    <div className='message'>
      <div className="member">
        <div className="member-initial">C</div>
      </div>
      <div className="content">{@.props.children}</div>
      <ul className='message-panel'>
        <li className="icon-read panel-action"></li>
      </ul>
    </div>
    </div>
}
