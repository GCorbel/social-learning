export default Ember.Component.extend
  setup: (->
    skill_user = @get('skill_user')
    container = $("#skill-#{skill_user.get('id')}")
    container.find('.actions').hide()
  ).on 'didInsertElement'
  actions:
    submit: ->
      skill_user = @get('skill_user')
      container = $("#skill-#{skill_user.get('id')}")
      new_description = container.find('textarea').val()
      skill_user.set('description', new_description)
      @sendAction 'edit', skill_user
      container.find('.description').html(new_description)
      container.find('.actions').hide()
    delete: ->
      @sendAction 'delete', @get('skill_user')
    edit: ->
      skill_user = @get('skill_user')
      container = $("#skill-#{skill_user.get('id')}")
      textarea = $('<textarea/>', text: skill_user.get('description'))
      container.find('.description').html(textarea)
      container.find('.actions').show()
