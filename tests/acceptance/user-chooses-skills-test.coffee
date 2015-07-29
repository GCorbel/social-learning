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

test 'A user chooses acquired his skills', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindAll 'skill', 2

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/users/choose-acquired-skills'
  click 'button'

  andThen ->
    assert.equal currentURL(), '/users/choose-acquired-skills'

test 'A user chooses searched his skills', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindAll 'skill', 2

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/users/choose-searched-skills'
  click 'button'

  andThen ->
    assert.equal currentURL(), '/users/choose-searched-skills'
