import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper'
import FactoryGuy from 'ember-data-factory-guy'

application = undefined

module 'Acceptance | acquired skills',
  beforeEach: ->
    application = startApp()
    TestHelper.setup()
    return

  afterEach: ->
    Ember.run application, 'destroy'
    TestHelper.teardown()

test 'A user see the list of his acquired skills', (assert) ->
  skills = FactoryGuy.makeList('skill', 2)
  user = FactoryGuy.make('user', { acquired_skills: skills })
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindAll 'acquired-skill', 2

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/users/acquired-skills'

  andThen ->
    assert.equal find('.skill').length, 2
    assert.equal currentURL(), '/users/acquired-skills'

test 'A user add a new acquired skill', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindAll 'acquired-skill', 2
  TestHelper.handleCreate 'acquired-skill'

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/users/acquired-skills'
  click 'button'

  andThen ->
    assert.equal currentURL(), '/users/acquired-skills'

test 'A user edit a acquired skill', (assert) ->
  user = FactoryGuy.make('user')
  acquired_skill = FactoryGuy.make('acquired-skill')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindQuery 'acquired-skill', ['user_id'], [acquired_skill]
  TestHelper.handleUpdate 'acquired-skill', acquired_skill.id

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/users/acquired-skills'
  click '.skill .edit'
  fillIn '.description textarea', 'New Description'
  click '.skill .submit'

  andThen ->
    assert.equal currentURL(), '/users/acquired-skills'

test 'A user remove a acquired skill', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleFindAll 'acquired-skill', 1
  TestHelper.handleDelete 'acquired-skill', 1

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/users/acquired-skills'
  click '.delete'

  andThen ->
    assert.equal currentURL(), '/users/acquired-skills'
