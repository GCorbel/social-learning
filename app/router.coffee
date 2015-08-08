import Ember from 'ember'
import config from './config/environment'

Router = Ember.Router.extend(location: config.locationType)
Router.map ->
  @route 'signin'
  @route 'signup'

  @resource 'matches', path: '/matches/:user_id'

  @resource 'dashboard', ->
    @route 'edit'
    @route 'matches'
    @route 'searched-skills'
    @route 'acquired-skills'

  @route 'user-details', path: '/user-details/:id'

  @resource 'skills', ->
    @route 'index', path: '/'

  @resource 'skill', path: '/skills/:id', ->
    @resource 'acquired_users', path: '/acquired_users'
    @resource 'searched_users', path: '/searched_users'

export default Router
