import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource('skills', function() {
    this.route('index', { path: '/' });
  });
  this.resource('skill', { path: '/skills/:id' });
});

export default Router;
