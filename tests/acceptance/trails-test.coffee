import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper'
import FactoryGuy from 'ember-data-factory-guy'

application = undefined

module 'Acceptance | show the list of skills',
  beforeEach: ->
    application = startApp()
    TestHelper.setup()
    return

  afterEach: ->
    Ember.run application, 'destroy'
    TestHelper.teardown()

test 'Start a new trail', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindAll('user', 1)
  TestHelper.handleCreate('trail')
  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/users'
  click 'button.start_new_trail'

  andThen ->
    assert.equal currentURL(), '/trails/1'

test 'Add a new message to the trail', (assert) ->
  trail = FactoryGuy.make('trail')
  TestHelper.handleFindQuery 'trail', [ 'id' ], [trail]
  TestHelper.handleCreate('message')
  id = trail.get('id')

  visit "/trails/#{id}"
  fillIn 'div.body input', 'Body'
  click 'button'

  andThen ->
    assert.equal find("#message-#{id} .body").text(), 'Body'
    assert.equal currentURL(), "/trails/#{id}"
