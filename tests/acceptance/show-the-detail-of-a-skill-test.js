import Ember from 'ember';
import { module, test } from 'qunit';
import startApp from 'social-learning/tests/helpers/start-app';
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper';
import FactoryGuy from 'ember-data-factory-guy';

var application;

module('Acceptance | show the detail of a skill', {
  beforeEach: function() {
    application = startApp();
  },

  afterEach: function() {
    Ember.run(application, 'destroy');
  }
});

test('Show the list of skills', function(assert) {
  var skills = FactoryGuy.makeList('skill', 1);
  TestHelper.handleFindQuery('skill', ['id'], skills);

  visit('/skills/1');

  andThen(function() {
    assert.equal(find('#skill #name').text(), skills[0].get('name'));
    assert.equal(currentURL(), '/skills/1');
  });
});
