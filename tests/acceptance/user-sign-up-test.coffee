import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper'
import FactoryGuy from 'ember-data-factory-guy'

application = undefined

module 'Acceptance | sign up',
  beforeEach: ->
    application = startApp()
    TestHelper.setup()
    return

  afterEach: ->
    Ember.run application, 'destroy'
    TestHelper.teardown()

test 'Allow the user to subscribe', (assert) ->
  TestHelper.handleCreate('user')

  visit '/signup'
  fillIn 'div.nickname input', 'GCorbel'
  fillIn 'div.email input', 'test@test.com'
  fillIn 'div.password input', 'test'
  fillIn 'div.password_confirmation input', 'test'
  click 'button'

  andThen ->
    assert.equal currentURL(), '/'
