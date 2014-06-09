function Expander($el) {
  var self = this;

  self.$trigger         = $el;

  self.settings = {
    target: $el.attr('href')
  };

  $.extend(self.settings, Foundation.utils.data_options($el, 'expander'));

  self.$target          = $(self.settings.target);

  self.init();
}

Expander.prototype = {
  constructor : Expander,

    init : function() {
      var self = this;
      puts('Expander initialized');

      if(self.isExpanded()){
        self.$trigger.addClass(self.settings.activeClass);
      }

      self.$trigger.on('click', function(e){
        e.preventDefault();
        puts('expander trigger clicked');

        if(self.isExpanded()){
          self.contract();
        }else{
          self.expand();
        }
      });
    },

    expand : function() {
      var self = this;
      self.$target.slideDown('fast', function(){
        self.$trigger.removeClass(self.settings.activeClass);
      });
    },

    contract : function() {
      var self = this;

      self.$target.slideUp('slow', function(){
        self.$trigger.addClass(self.settings.activeClass);
      });
    },
    isExpanded : function() {
      var self = this;

      return self.$target.is(":visible");
    }

}

$(window).load(function(){
  $('[data-expander]').each(function(){
    new Expander($(this));
  });
});