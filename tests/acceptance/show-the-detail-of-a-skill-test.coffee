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
  skills = FactoryGuy.makeList('skill', 1)
  TestHelper.handleFindQuery 'skill', [ 'id' ], skills

  visit '/skills/1'

  andThen ->
    assert.equal find('#skill #name').text(), skills[0].get('name')
    assert.equal currentURL(), '/skills/1'
