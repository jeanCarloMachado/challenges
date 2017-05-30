"use strict";
module.exports = {
    getList: function (list) {
        if (!list) {
            return null;
        }

        if (list.length < 2) {
            return [];
        }

        var result =  [];
        var hasInterval = false;
        var interval = [];
        for ( var i = 0; i < list.length-1; i++ ) {
            if ((list[i] - list[i+1]) == -1) {
                if (hasInterval == false) {
                    interval.push(list[i]);
                    hasInterval=true;
                }

            } else {

                hasInterval=false;
                if (interval.length > 0) {
                    interval.push(list[i]);
                    result.push(interval);
                    var interval = [];
                }
            }

            if (i == (list.length -2)) {
                if (interval.length > 0) {
                    interval.push(list[i+1]);
                    result.push(interval);
                    var interval = [];
                }
            }
        }

        return result;
    }
}
