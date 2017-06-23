var isEmpty = function(input, defaut){
    return (input == null
        || input.value == null
        || input.value == ''
        || input.value == defaut
    );
};
var failFast = function(feedback, fields) {
    feedback.innerText = '';
    var errors = [];

    for (var i=0; i<fields.length; i++) {
        var field = fields[i];
        if (isEmpty(field.item, field.defaut))
            errors.push(field.empty);
    }
    if (errors.length) {
        feedback.innerText = errors.join('\n');
        return true;
    }

    return false;
};

window.onload = function()
{
    // panels
    var authent = document.getElementById('authentication');
    var confirm = document.getElementById('confirmation');

    // inputs
    var mail = document.getElementById('mail');
    var pass = document.getElementById('pass');
    var code = document.getElementById('code');

    // buttons
    var reset = document.getElementById('authent-reset');
    var login = document.getElementById('authent-login');
    var logout = document.getElementById('confirm-logout');
    var submit = document.getElementById('confirm-submit');

    // feedback
    var info = document.getElementById('info');
    var error = document.getElementById('error');

    ////////////////////////////////////////////////////////////

    var authenticated = false;

    reset.onclick = function() {
        mail.value = '';
        pass.value = '';
        info.innerText = '';
        error.innerText = '';
    };

    login.onclick = function() {
        var failed = failFast(error, [
            {item: mail, empty: 'Empty mail address'},
            {item: pass, empty: 'Empty password'}
        ]);
        var success = function() {
            authenticated = true;
            info.innerText = '';
            error.innerText = '';
            code.value = '';
            authent.style.display = 'none';
            confirm.style.display = 'block';
        };
        var onChange = function() {
            if (request.endCorrectly()) {
                if(this.xhr.responseText == "true"){
                    success();
                // success
                }else{
                    error.innerText = "Wrong identifiants";
                }
                                
            }
        };
        var onError = function() {
            error.innerText = request.xhr.statusText;
        };

        if (failed) return;

        var request = ajax.create().config({
            url: 'https://esgi-security.herokuapp.com/client/log',
            method: ajax.method.POST,
            onchange: onChange,
            onerror: onError,
            data : {
                email: mail.value,
                password: sha1(pass.value)
            }
        });
        request.send();
    };

    logout.onclick = function() {
        reset.click();
        authenticated = false;
        authent.style.display = 'block';
        confirm.style.display = 'none';
        error.innerText = 'Logged out';
        info.innerText = '';
    };

    submit.onclick = function() {
        var failed = failFast(error, [
            {item: mail, defaut: 0, empty: 'Empty authentication code'}
        ]);
        var success = function() {
            info.innerHTML = "Code confirmed";
        };
        var onChange = function() {
            if (request.endCorrectly()) {
                console.log(this.xhr);
                if(this.xhr.responseText == "true"){
                    success();
                // success
                }else{
                    info.innerText = "";
                    error.innerText = "Wrong code";
                }
                
            }
        };
        var onError = function() {
            // failure
        };

        if (failed) return;
        var base = 'https://esgi-security.herokuapp.com/client/getResult';
        var request = ajax.create().config({
            url: base+"?email="+ajax.encode(mail.value)+"&resultClient="+ajax.encode(code.value),
            method: ajax.method.GET,
            onchange: onChange,
            onerror: onError            
        });
        request.send();
    };
};