import Ember from 'ember'
import { module, test } from 'qunit'
import startApp from 'social-learning/tests/helpers/start-app'
import FactoryGuy from 'ember-data-factory-guy'

application = undefined

module 'Acceptance | show the list of skills',
  beforeEach: ->
    application = startApp()
    return

  afterEach: ->
    Ember.run application, 'destroy'

test 'Show the list of skills', (assert) ->
  visit '/skills'
  FactoryGuy.makeList 'skill', 2

  andThen ->
    assert.equal find('.skill').length, 2
    assert.equal currentURL(), '/skills'
