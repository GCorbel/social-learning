import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper'
import FactoryGuy from 'ember-data-factory-guy'

application = undefined

module 'Acceptance | edit the information of a user',
  beforeEach: ->
    application = startApp()
    TestHelper.setup()
    return

  afterEach: ->
    Ember.run application, 'destroy'
    TestHelper.teardown()

test 'Edition of the information', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleUpdate(user)

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/dashboard/edit'

  fillIn '.nickname input', 'Joe'
  fillIn '.email input', 'Joe@blo.com'
  click 'button'

  andThen ->
    assert.equal currentURL(), '/dashboard/edit'
