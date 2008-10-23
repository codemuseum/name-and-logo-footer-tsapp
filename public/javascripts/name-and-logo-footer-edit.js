var NameAndLogoFooterEdit = {
  init: function() {
    var footerEls = $$('div.app-name-and-logo-footer');
    footerEls.each(function(footerEl) {
      aLink = footerEl.getElementsBySelector('.format-link a')[0];
      aLink.observe('click', function(ev) {
        var layoutInput = footerEl.getElementsBySelector('input.layout')[0];
        var layoutDiv = footerEl.getElementsBySelector('div.layout-spec')[0];
        if (layoutInput.value == 'hidden') {
          layoutInput.value = 'left';
          layoutDiv.removeClassName('layout-hidden');
          layoutDiv.addClassName('layout-left');
          aLink.update('Hide Title Text');
        }
        else {
          layoutInput.value = 'hidden';
          layoutDiv.removeClassName('layout-left');
          layoutDiv.addClassName('layout-hidden');
          aLink.update('Show Title Text');
        }
      });
      
      TS.Assets.Selector.register(footerEl);
    });
  }
}
NameAndLogoFooterEdit.init();