function ExampleObject($el) {
  var self = this;

  self.$el                 = $el;

  self.init();
}

ExampleObject.prototype = {
  constructor : ExampleObject,

    init : function() {
      var self = this;
      puts('ExampleObject initialized');

      self.action(true);
    },

    action : function(args) {
      var self = this;

    }
}

ExampleObject.autoInit = function(){
  $('.js-object-example').each(function(){
    var exampleObject = new ExampleObject($(this));
  });
}