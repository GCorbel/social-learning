import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import TestHelper from 'ember-data-factory-guy/factory-guy-test-helper'
import FactoryGuy from 'ember-data-factory-guy'

application = undefined

module 'Acceptance | show the details of a skill',
  beforeEach: ->
    application = startApp()
    TestHelper.setup()
    return

  afterEach: ->
    Ember.run application, 'destroy'
    TestHelper.teardown()

test 'Show the details of a skill', (assert) ->
  skill = FactoryGuy.make('skill')
  TestHelper.handleFindQuery 'skill', [ 'id' ], [skill]

  visit '/skills/1'

  andThen ->
    assert.equal find('#skill #name').text(), skill.get('name')
    assert.equal currentURL(), '/skills/1'

test 'Show the list of users that acquired this skill', (assert) ->
  skill = FactoryGuy.make('skill')
  user1 = FactoryGuy.make('user')
  user2 = FactoryGuy.make('user')

  Ember.run ->
    skill.set('acquired_users', [user1])

  TestHelper.handleFindQuery 'skill', [ 'id' ], [skill]

  visit '/skills/1'
  click 'a.show_acquired_users'

  andThen ->
    assert.equal find('.user').length, 1
    assert.equal find('.user .nickname').text(), user1.get('nickname')
    assert.equal currentURL(), '/skills/1/acquired_users'
