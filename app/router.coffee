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
    @route 'skill-users', path: '/skill-users/:kind'

  @route 'users', path: '/users/:id', ->
    @route 'skill-users', path: '/skill-users/:kind'

  @resource 'skills', ->
    @route 'index', path: '/'

  @resource 'skill', path: '/skills/:id', ->
    @route 'skill-users', path: '/skill-users/:kind'

export default Router
