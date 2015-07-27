import Ember from 'ember';
import { module, test } from 'qunit';
import startApp from 'social-learning/tests/helpers/start-app';
import FactoryGuy from 'ember-data-factory-guy';

var application;

module('Acceptance | show the list of skills', {
  beforeEach: function() {
    application = startApp();
  },

  afterEach: function() {
    Ember.run(application, 'destroy');
  }
});

test('Show the list of skills', function(assert) {
  visit('/skills');
  FactoryGuy.makeList('skill', 2);

  andThen(function() {
    assert.equal(find('.skill').length, 2);
    assert.equal(currentURL(), '/skills');
  });
});
