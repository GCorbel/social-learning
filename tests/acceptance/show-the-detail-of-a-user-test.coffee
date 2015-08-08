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

  visit '/user-details/1'

  andThen ->
    assert.equal find('#user #nickname').text(), user.get('nickname')
    assert.equal currentURL(), '/user-details/1'
