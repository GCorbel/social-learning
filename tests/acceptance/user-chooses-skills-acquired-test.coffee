import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper'
import FactoryGuy from 'ember-data-factory-guy'

application = undefined

module 'Acceptance | a user chooses his skills',
  beforeEach: ->
    application = startApp()
    TestHelper.setup()
    return

  afterEach: ->
    Ember.run application, 'destroy'
    TestHelper.teardown()

test 'A user chooses his skills', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindAll 'skill', 2

  visit '/users/1/choose-acquired-skills'
  click 'button'

  andThen ->
    assert.equal currentURL(), '/users/1/choose-acquired-skills'
