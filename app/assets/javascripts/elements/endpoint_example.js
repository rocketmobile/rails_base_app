function EndpointExample($el) {
  var self = this;

  self.$el                 = $el;
  self.$form               = $el.find('form');
  self.$code               = $el.find('.response code');
  self.$urlParamInputs     = self.$form.find('input[data-url-param]');

  self.init();
}

EndpointExample.prototype = {
  constructor : EndpointExample,

    init : function() {
      var self = this;
      puts('EndpointExample initialized');

      self.initUrlParams();

      self.$el.on('ajax:send', function(e, data, status, xhr){
        self.clearResults();
      });

      self.$el.on('ajax:success', function(e, data, status, xhr){
        self.responseText = xhr.responseText;
        self.statusCode = xhr.status;
        self.statusText = xhr.statusText;

        self.displayResults();
      });

      self.$el.on('ajax:error', function(e, xhr, status, error){
        self.responseText = xhr.responseText;
        self.statusCode = xhr.status;
        self.statusText = xhr.statusText;

        self.displayResults();
      });
    },

    initUrlParams : function() {
      var self = this;

      // cache the action attr for future re-assignemnts
      if(self.$urlParamInputs.length){
        self.$form.data('original-action', self.$form.attr('action'))
      }

      self.$urlParamInputs.on('change keydown paste', function(e){
        var $input = $(this);
        // edit url param to be new value
        // setTimeout to place in buffer after event has completed
        // so the value will be present
        setTimeout(function(){
            var paramName = $input.attr('data-url-param');
            var value = $input.val();
            var newAction = self.$form.data('original-action').replace(paramName, value);

            puts('URL param input edited: replacing form[action] with ' + newAction);
            self.$form.attr('action', newAction);
          // }
        }, 0)
      })

    },

    displayResults : function() {
      var self = this;

      self.$code.text(self.formattedResults());
      Prism.highlightAll();
    },

    formattedResults : function() {
      var self = this;
      var formattedString = null;
      var jsonString = null;
      var statusString = 'HTTP ' + self.statusCode + ' (' + self.statusText + ')';

      try {
        jsonString = JSON.stringify(JSON.parse(self.responseText), null, 2);
      }
      catch(err) {
        jsonString = self.responseText;
      }

      formattedString = statusString + '\n\n' + jsonString;

      return formattedString;
    },

    clearResults : function(){
      var self = this;

      self.$code.text('');
    }
}

$(window).load(function(){
  $('[data-endpoint-example]').each(function(){
    var endpointExample = new EndpointExample($(this));
  });
});