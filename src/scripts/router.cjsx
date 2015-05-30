React = require 'react'
Router = require 'react-router'
Route = Router.Route

App = require './containers/app'
Todo = require './todo'
Ker = require './ker'

routes = (
  <Route handler={App}>
    <Route name="todo" handler={Todo} path="/" />
    <Route name="ker" handler={Ker} path="/ker" />
  </Route>
)

Router.run routes, (Handler) ->
  React.render <Handler/>, document.getElementById 'content'

