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
  skill1 = FactoryGuy.make('skill')
  skill2 = FactoryGuy.make('skill')

  Ember.run ->
    user.set('acquired_skills', [skill1])

  TestHelper.handleFindQuery 'user', [ 'id' ], [user]

  visit '/users/1'
  click 'a.show_acquired_skills'

  andThen ->
    assert.equal find('.skill').length, 1
    assert.equal find('.skill .name').text(), skill1.get('name')
    assert.equal currentURL(), '/users/1/acquired-skills'

test 'Show the list skills searched', (assert) ->
  user = FactoryGuy.make('user')
  skill1 = FactoryGuy.make('skill')
  skill2 = FactoryGuy.make('skill')

  Ember.run ->
    user.set('searched_skills', [skill1])

  TestHelper.handleFindQuery 'user', [ 'id' ], [user]

  visit '/users/1'
  click 'a.show_searched_skills'

  andThen ->
    assert.equal find('.skill').length, 1
    assert.equal find('.skill .name').text(), skill1.get('name')
    assert.equal currentURL(), '/users/1/searched-skills'
