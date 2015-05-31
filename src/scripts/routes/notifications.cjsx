React = require 'react'
NotificationList = require '../containers/notification_list'

module.exports = React.createClass {
  getInitialState: ->
    {data: []}

  componentDidMount: ->
    url = 'https://api.trello.com/1/members/my/notifications?key=154407f68384bde233183669d08042d5&token=1f19289efe97a5ce13e01871cb2d7441331e7d2f88de7c7564e8473b885635ad&filter=mentionedOnCard'
    request = new XMLHttpRequest()
    request.open 'GET', url, true

    request.onload = =>
      @.setState {
        data: JSON.parse request.responseText
      }

    request.onerror = ->
      console.log 'error XHR'

    request.send()

  render: ->
    <NotificationList data={@.state.data}/>
}
