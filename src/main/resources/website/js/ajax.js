function Ajax(method, url) {
    var createXHR = function() {
        if (window.XMLHttpRequest) {
            // browser other than IE
            return new XMLHttpRequest();
        }

        if (window.ActiveXObject) {
            try {
                return new ActiveXObject("Msxml2.XMLHTTP");
            } catch(ex) {
                // IE 7 or less
                return new ActiveXObject("Microsoft.XMLHTTP");
            }
        }

        alert("Current browser does not support XMLHTTPRequest object");
        return null;
    };

    this.xhr = createXHR();

    // properties
    this.url = url;         // encoded string
    this.method = method;   // string
    this.timeout = 100;     // ms

    // dictionaries
    this.headers = {};
    this.data = {};

    // events
    this.onabort = undefined;
    this.onerror = undefined;
    this.onload = undefined;
    this.onchange = undefined;
    this.onprogress = undefined;
    this.ontimeout = undefined;
}

Ajax.prototype.getStatus = function() {
    return (this.xhr === null)
        ? ajax.status.UNKNOWN
        : this.xhr.readyState;
};
Ajax.prototype.getCode = function() {
    return (this.xhr === null)
        ? ajax.code.UNKNOWN
        : this.xhr.status;
};
Ajax.prototype.endCorrectly = function() {
    return (this.xhr !== null)
        && (this.xhr.status === ajax.code.OK)
        && (this.xhr.readyState === ajax.status.DONE);
};
Ajax.prototype.getResponseHeader = function(name) {
    return this.xhr.getResponseHeader(name);
};
Ajax.prototype.config = function(dictionary) {
    if (typeof dictionary === 'object') {
        var properties = Object.keys(this);
        var keys = Object.keys(dictionary);

        for (var i = 0; i < keys.length; i++) {
            var key = keys[i];
            if (properties.indexOf(key) !== -1)
                this[key] = dictionary[key];
        }
    }
    return this;
};
Ajax.prototype.send = function() {
    try {
        if (this.xhr === null)
            throw 'No XMLHTTPRequest object';

        if (this.method === undefined || this.url === undefined)
            throw 'METHOD and URL not set';

        if (Object.values(ajax.method).indexOf(this.method.toLowerCase()) === -1)
            throw 'Unknown HTTP method';
    }
    catch (error) {
        alert(error);
        return this;
    }

    // have minimal settings
    var that = this;

    var formatParams = function() {
        if (that.method === ajax.method.POST || that.method === ajax.method.PUT)
            return JSON.stringify(that.data);

        if (that.method === ajax.method.GET) {
            var encodedParams = Object.keys(that.data).map(function(param) {
                return ajax.encode(param) +'='+ ajax.encode(that.data[param]);
            });
            return encodedParams.join('&');
        }

        return null;
    };
    var populateHeaders = function() {
        that.headers['Content-Type'] = 'application/json';

        var keys = Object.keys(that.headers);
        for (var i = 0; i < keys.length; i++) {
            var key = keys[i];
            that.xhr.setRequestHeader(key, that.headers[key]);
        }
    };
    var populateEvents = function() {
        var setListener = function (method, callback) {
            if (callback !== undefined) {
                that.xhr[method] = function () {
                    callback.call(that, that.xhr.response);
                };
            }
        };

        setListener('onabort', that.onabort);
        setListener('onerror', that.onerror);
        setListener('onload', that.onload);
        setListener('onreadystatechange', that.onchange);
        setListener('onprogress', that.onprogress);
        setListener('ontimeout', that.ontimeout);
    };

    var params = formatParams();
    if (that.method === ajax.method.GET && params !== '') {
        this.url += '?'+ params;
        params = null;
    }

    this.xhr.open(this.method, this.url, true);
    populateHeaders();
    populateEvents();
    this.xhr.send(params);

    return this;
};
Ajax.prototype.abort = function() {
    if (this.xhr !== null)
        this.xhr.abort();
};

var ajax = {
    method: {
        GET: 'get',
        POST: 'post',
        PUT: 'put',
        DELETE: 'delete'
    },
    status: {
        UNKNOWN: -1,
        CREATED: 0,
        PREPARING: 1,
        SENT: 2,
        LOADING: 3,
        DONE: 4
    },
    code: {
        UNKNOWN: -1,

        // success
        OK: 200,
        CREATED: 201,
        ACCEPTED: 202,
        NO_CONTENT: 204,

        // error
        BAD_REQUEST: 400,
        UNAUTHORIZED: 401,
        FORBIDDEN: 403,
        NOT_FOUND: 404,
        METHOD_NOT_ALLOWED: 405,
        NOT_ACCEPTABLE: 406,
        REQUEST_TIMEOUT: 408,
        CONFLICT: 409,
        UNSUPPORTED_MEDIA_TYPE: 415,
        TOO_MANY_REQUESTS: 429,

        // server status
        INTERNAL_SERVER_ERROR: 500,
        NOT_IMPLEMENTED: 501,
        SERVICE_UNAVAILABLE: 503,
        HTTP_NOT_SUPPORTED: 505
    }
};
ajax.create = function(httpMethod, encodedUrl) {
    return new Ajax(httpMethod, encodedUrl);
};
ajax.encode = function(text) {
    return encodeURIComponent(text);
};
ajax.decode = function(text) {
    return decodeURIComponent(text);
};