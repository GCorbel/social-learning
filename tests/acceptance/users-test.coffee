import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper'
import FactoryGuy from 'ember-data-factory-guy'

application = undefined

module 'Acceptance | show the details of a user',
  beforeEach: ->
    application = startApp()
    TestHelper.setup()
    return

  afterEach: ->
    Ember.run application, 'destroy'
    TestHelper.teardown()

test 'Show the details of a user', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]

  visit '/users/1'

  andThen ->
    assert.equal find('#user #nickname').text(), user.get('nickname')
    assert.equal currentURL(), '/users/1'

test 'Show the list skills acquired', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindAll('skill-user', 1)
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]

  visit '/users/1'
  click 'a.show_acquired_skills'

  andThen ->
    assert.equal find('.skill').length, 1
    assert.equal currentURL(), '/users/1/skill-users/0'

test 'Show the list skills searched', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindAll('skill-user', 1)
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]

  visit '/users/1'
  click 'a.show_searched_skills'

  andThen ->
    assert.equal find('.skill').length, 1
    assert.equal currentURL(), '/users/1/skill-users/1'

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

test 'Edition of the information', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  TestHelper.handleUpdate(user)

  authenticateSession()
  currentSession().set('user_id', user.id)

  visit '/dashboard/edit'

  fillIn '.nickname input', 'Joe'
  fillIn '.email input', 'Joe@blo.com'
  click 'button'

  andThen ->
    assert.equal currentURL(), '/dashboard/edit'

test 'Allow the connection of a user', (assert) ->
  user = FactoryGuy.make('user')
  TestHelper.handleFindQuery 'user', [ 'id' ], [user]
  $.mockjax
    url: 'http://localhost:3000/api/v1/sessions'
    responseText:
      token: 'test'

  visit '/signin'
  fillIn 'div.email input', 'test@test.com'
  fillIn 'div.password input', 'test'
  click 'button'

  andThen ->
    assert.equal currentURL(), '/'

  click 'a.signout'

  andThen ->
    assert.equal currentURL(), '/'
