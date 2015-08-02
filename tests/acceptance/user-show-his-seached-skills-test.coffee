import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper'
import FactoryGuy from 'ember-data-factory-guy'

application = undefined

module 'Acceptance | a user see the list of his seached skills',
  beforeEach: ->
    application = startApp()
    TestHelper.setup()
    return

  afterEach: ->
    Ember.run application, 'destroy'
    TestHelper.teardown()

test 'A user see the list of his seached skills', (assert) ->
  skills = FactoryGuy.makeList('skill', 2)
  user = FactoryGuy.make('user', { searched_skills: skills })
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindAll 'searched-skill', 2

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/users/searched-skills'

  andThen ->
    assert.equal find('.skill').length, 2
    assert.equal currentURL(), '/users/searched-skills'
