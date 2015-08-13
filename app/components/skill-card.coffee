export default Ember.Component.extend
  setup: (->
    skill_user = @get('skill_user')
    container = $("#skill-#{skill_user.get('id')}")
    container.find('.actions').hide()
  ).on 'didInsertElement'
  actions:
    submit: ->
      skill_user = @get('skill_user')
      defer = Ember.RSVP.defer()
      defer.promise.then(=> @set('editing', false))

      @sendAction 'edit', skill_user, defer
    delete: ->
      @sendAction 'delete', @get('skill_user')
    edit: ->
      @set('editing', true)
