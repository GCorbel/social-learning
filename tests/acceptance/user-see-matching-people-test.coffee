import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper'
import FactoryGuy from 'ember-data-factory-guy'

application = undefined

module 'Acceptance | a user see matching people',
  beforeEach: ->
    application = startApp()
    TestHelper.setup()
    return

  afterEach: ->
    Ember.run application, 'destroy'
    TestHelper.teardown()

test 'A user see matching people', (assert) ->
  users = FactoryGuy.makeList('user', 2)
  currentUser = users[0]

  authenticateSession()
  currentSession().set('user_id', currentUser.id)

  $.mockjax
    url: 'http://localhost:3000/api/v1/users/1/matches'
    responseText: { users: users }

  visit '/users/matches'

  andThen ->
    assert.equal find('.user').length, 2
    assert.equal currentURL(), '/users/matches'
