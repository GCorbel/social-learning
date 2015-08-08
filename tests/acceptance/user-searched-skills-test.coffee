import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper'
import FactoryGuy from 'ember-data-factory-guy'

application = undefined

module 'Acceptance | searched skills',
  beforeEach: ->
    application = startApp()
    TestHelper.setup()
    return

  afterEach: ->
    Ember.run application, 'destroy'
    TestHelper.teardown()

test 'A user see the list of his searched skills', (assert) ->
  skills = FactoryGuy.makeList('skill', 2)
  user = FactoryGuy.make('user', { searched_skills: skills })
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindAll 'searched-skill', 2

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/dashboard/searched-skills'

  andThen ->
    assert.equal find('.skill').length, 2
    assert.equal currentURL(), '/dashboard/searched-skills'

test 'A user add a new searched skill', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindAll 'searched-skill', 2
  TestHelper.handleCreate 'searched-skill'

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/dashboard/searched-skills'
  click 'button'

  andThen ->
    assert.equal currentURL(), '/dashboard/searched-skills'

test 'A user edit a searched skill', (assert) ->
  user = FactoryGuy.make('user')
  searched_skill = FactoryGuy.make('searched-skill')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindQuery 'searched-skill', ['user_id'], [searched_skill]
  TestHelper.handleUpdate 'searched-skill', searched_skill.id

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/dashboard/searched-skills'
  click '.skill .edit'
  fillIn '.description textarea', 'New Description'
  click '.skill .submit'

  andThen ->
    assert.equal currentURL(), '/dashboard/searched-skills'

test 'A user remove a searched skill', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindAll 'searched-skill', 1
  TestHelper.handleDelete 'searched-skill', 1

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/dashboard/searched-skills'
  click '.delete'

  andThen ->
    assert.equal currentURL(), '/dashboard/searched-skills'
