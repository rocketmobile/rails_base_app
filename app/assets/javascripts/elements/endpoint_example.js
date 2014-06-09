function EndpointExample($el) {
  var self = this;

  self.$el                 = $el;
  self.$form               = $el.find('form');
  self.$response           = $el.find('.response');

  self.init();
}

EndpointExample.prototype = {
  constructor : EndpointExample,

    init : function() {
      var self = this;
      puts('EndpointExample initialized');

      self.$el.on('ajax:send', function(e, data, status, xhr){
        self.clearResults();
      });

      self.$el.on('ajax:success', function(e, data, status, xhr){
        self.responseText = xhr.responseText;
        self.displayResults();
      });

      self.$el.on('ajax:error', function(e, xhr, status, error){
        self.responseText = xhr.responseText;
        self.displayResults();
      });
    },

    displayResults : function() {
      var self = this;

      self.$response.text(self.responseText);
    },

    clearResults : function(){
      var self = this;

      self.$response.text('');
    }
}

$(window).load(function(){
  $('[data-endpoint-example]').each(function(){
    var endpointExample = new EndpointExample($(this));
  });
});