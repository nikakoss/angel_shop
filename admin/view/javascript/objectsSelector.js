function dialogObjectsSelector(header, dialogID, fieldID, url){
    $.cookie('dialogID', dialogID);
    $.cookie('fieldID', fieldID);

    $('#content').prepend('<div id="' + dialogID + '" style="padding: 3px 0px 0px 0px;"><iframe src="' + url + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

    $('#' + dialogID).dialog({
        title: header,
        close: function (event, ui) {
            $('#'+dialogID).remove();
        },
        bgiframe: false,
        width: 900,
        height: 550,
        resizable: false,
        modal: true
    });
}