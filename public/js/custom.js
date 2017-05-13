var maskBehavior = function (val) {
        return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
    },
    options = {
        onKeyPress: function (val, e, field, options) {
            field.mask(maskBehavior.apply({}, arguments), options);
        }
    };

var phonebookChart = {

    initChartist: function () {

        var val_completed = parseFloat((completed / total_agenda) * 100);
        var val_late = parseFloat((late / total_agenda ) * 100);
        var val_notcomplete = parseFloat((notcomplete / total_agenda ) * 100);

        Chartist.Pie('#chartPreferences', {
            labels: [
                val_completed + '%',
                val_late + '%',
                val_notcomplete + '%'
            ],
            series: [
                val_completed,
                val_late,
                val_notcomplete]
        });
    }
};

$(document).ready(function () {

    $('.phone').mask(maskBehavior, options);
    $('.date').mask("00/00/0000", {placeholder: "__/__/____"});

    $(".deleteModal").click(function () {
        $("#deleteId").attr('href', '/' + $(this).data('route') + '/delete/' + $(this).data('id'));
    });

    phonebookChart.initChartist();

});

