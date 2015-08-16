import Ember from 'ember'
import config from './config/environment'

Router = Ember.Router.extend(location: config.locationType)
Router.map ->
  @route 'welcome', path: '/'
  @route 'signin'
  @route 'signup'

  @resource 'matches', path: '/matches/:user_id'

  @resource 'dashboard', ->
    @route 'edit'
    @route 'matches'
    @route 'skill-users', path: '/skill-users/:kind'

  @resource 'users'

  @route 'user', path: '/users/:id', ->
    @route 'skill-users', path: '/skill-users/:kind'

  @resource 'skills', ->
    @route 'index', path: '/'

  @resource 'skill', path: '/skills/:id', ->
    @route 'skill-users', path: '/skill-users/:kind'

  @resource 'trails', ->
    @route 'new', path: 'new/:user_id'
    @route 'trail', path: '/:id'

export default Router
