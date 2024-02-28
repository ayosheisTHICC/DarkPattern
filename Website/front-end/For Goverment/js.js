"use strict";
var $ = jQuery;
class onFocus {
    constructor() {
        var $this = this;
        $this.run = $this.init();
    }
    init() {
        var $this = this;
        $(document).ready(function () {
            $this.addFocusClass();
            $this.keyUpObserve();
            $this.clickLink();
        });
        return 0;
    }
    addFocusClass() {
        $(".form-control").focus(function () {
            $(this).prev().addClass("on-focus");
        }).focusout(function () {
            $(".form-label").removeClass("on-focus");
        });
    }
    keyUpObserve() {
        $(".form-control").keyup(function () {
            if ($(this).val().length > 0) {
                $(this).prev().addClass("filled");
            }
            else {
                $(this).prev().removeClass("filled");
            }
        });
    }
    clickLink() {
        $(".link").click(function () {
            var open = $(this).data("open");
            var close = $(this).data("close");
            $("#" + close).animate({
                'opacity': 0,
                'top': +100
            }, 500, function () {
                $(this).removeClass("open").addClass("close").removeAttr("style");
                $("#" + open).removeClass("close").addClass("open");
            });
        });
    }
}
var run = new onFocus();
