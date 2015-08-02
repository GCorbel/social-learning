import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper'
import FactoryGuy from 'ember-data-factory-guy'

application = undefined

module 'Acceptance | a user add a new searched skill',
  beforeEach: ->
    application = startApp()
    TestHelper.setup()
    return

  afterEach: ->
    Ember.run application, 'destroy'
    TestHelper.teardown()

test 'A user add a new searched skill', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindAll 'searched-skill', 2
  TestHelper.handleCreate 'searched-skill'

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/users/searched-skills'
  click 'button'

  andThen ->
    assert.equal currentURL(), '/users/searched-skills'
