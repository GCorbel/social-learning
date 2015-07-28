import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper'
import FactoryGuy from 'ember-data-factory-guy'

application = undefined

module 'Acceptance | conneciton of a user',
  beforeEach: ->
    application = startApp()
    TestHelper.setup()
    return

  afterEach: ->
    Ember.run application, 'destroy'
    TestHelper.teardown()

test 'Allow the connection of a user', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  $.mockjax
    url: 'http://localhost:3000/api/v1/sessions'
    responseText:
      token: 'test'

  visit '/signin'
  fillIn 'input.email', 'test@test.com'
  fillIn 'input.password', 'test'
  click 'button'

  andThen ->
    assert.equal currentURL(), '/'
