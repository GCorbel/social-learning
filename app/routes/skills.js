import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    var foo = this.store.find('skill');

    console.log("typeof foo", typeof foo);

    foo.then( function(result) {
      console.log("result", result);
      console.log("result", result.get('length'));
    });

    console.log("end of script");
    return this.store.find('skill');
  }
});
