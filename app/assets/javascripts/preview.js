function preview() {
    console.log("call preview");
    $.ajax({
        type: "GET",
        url: "/scraped_results",
        data: {
            "url": $("#url").val(),
            "css_selector": $("#css_selector").val()
        },
        success: function(results){
            var texts = results.map(function(r) {
                return r.text;
            });
            alert(texts);
        }
    });
    return false;
}
