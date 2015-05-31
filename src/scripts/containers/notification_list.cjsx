React = require 'react'
Notification = require '../components/notification'

module.exports = React.createClass {
  render: ->
    NotificationNodes = @.props.data.map (noti) ->
      <Notification>
        {noti.data.text}
      </Notification>

    <div className='list-items-container'>{NotificationNodes}</div>
}
