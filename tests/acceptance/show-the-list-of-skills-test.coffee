import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper'

application = undefined

module 'Acceptance | show the list of skills',
  beforeEach: ->
    application = startApp()
    TestHelper.setup()
    return

  afterEach: ->
    Ember.run application, 'destroy'
    TestHelper.teardown()

test 'Show the list of skills', (assert) ->
  TestHelper.handleFindAll 'skill', 2

  visit '/skills'

  andThen ->
    assert.equal find('.skill').length, 2
    assert.equal currentURL(), '/skills'
