React = require 'react'
Router = require 'react-router'
Route = Router.Route

App = require './containers/app'
Notifications = require './routes/notifications'
Ker = require './ker'

routes = (
  <Route handler={App}>
    <Route name="notifications" handler={Notifications} path="/" />
    <Route name="ker" handler={Ker} path="/ker" />
  </Route>
)

Router.run routes, (Handler) ->
  React.render <Handler/>, document.getElementById 'content'

