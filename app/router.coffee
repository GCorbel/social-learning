import Ember from 'ember'
import config from './config/environment'

Router = Ember.Router.extend(location: config.locationType)
Router.map ->
  @resource 'skills', ->
    @route 'index', path: '/'
  @resource 'skill', path: '/skills/:id'

export default Router
