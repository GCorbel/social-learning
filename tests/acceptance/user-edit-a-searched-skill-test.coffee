import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper'
import FactoryGuy from 'ember-data-factory-guy'

application = undefined

module 'Acceptance | a user edit a searched skill',
  beforeEach: ->
    application = startApp()
    TestHelper.setup()
    return

  afterEach: ->
    Ember.run application, 'destroy'
    TestHelper.teardown()

test 'A user edit a searched skill', (assert) ->
  user = FactoryGuy.make('user')
  searched_skill = FactoryGuy.make('searched-skill')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindQuery 'searched-skill', ['user_id'], [searched_skill]
  TestHelper.handleUpdate 'searched-skill', searched_skill.id

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/users/searched-skills'
  click '.skill .edit'
  fillIn '.description textarea', 'New Description'
  click '.skill .submit'

  andThen ->
    assert.equal currentURL(), '/users/searched-skills'
