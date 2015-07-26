import Ember from 'ember';
import { module, test } from 'qunit';
import startApp from 'social-learning/tests/helpers/start-app';
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper';
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
  visit('/skills/1');
  var skills = FactoryGuy.makeList('skill', 1);

  TestHelper.handleFindQuery('skill', ['id'], skills);

  andThen(function() {
    // assert.equal(find('.skill').length, 2);
    assert.equal(currentURL(), '/skills/1');
  });
});
