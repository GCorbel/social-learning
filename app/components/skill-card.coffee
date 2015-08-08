export default Ember.Component.extend
  setup: (->
    $('.actions').hide()
  ).on 'init'
  actions:
    submit: ->
      skill = @get('skill')
      container = $("#skill-#{skill.get('id')}")
      new_description = container.find('textarea').val()
      skill.set('description', new_description)
      @sendAction 'edit', skill
      container.find('.description').html(new_description)
      container.find('.actions').hide()
    delete: ->
      @sendAction 'delete', @get('skill')
    edit: ->
      skill = @get('skill')
      container = $("#skill-#{skill.get('id')}")
      textarea = $('<textarea/>', text: skill.get('description'))
      container.find('.description').html(textarea)
      container.find('.actions').show()
