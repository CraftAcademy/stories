var BootstrapTooltips = {
    init: function () {
        $('[data-toggle="tooltip"]').tooltip()
    }

};

$(document).ready(BootstrapTooltips.init);
$(document).on('page:load', BootstrapTooltips.init());