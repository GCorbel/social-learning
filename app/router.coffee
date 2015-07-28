import Ember from 'ember'
import config from './config/environment'

Router = Ember.Router.extend(location: config.locationType)
Router.map ->
  @route 'signin'
  @resource 'user', path: '/users/:id', ->
    @route 'edit'
    @route 'choose-acquired-skills'
    @route 'choose-searched-skills'

  @resource 'skills', ->
    @route 'index', path: '/'

  @resource 'skill', path: '/skills/:id', ->
    @resource 'acquired_users', path: '/acquired_users'
    @resource 'searched_users', path: '/searched_users'

export default Router
