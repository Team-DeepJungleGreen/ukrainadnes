var userFactory = (function () {
    var main = $('article');

    function getData(type) {
        //Todo add validation
        var data = {};
        var username = $('#username ').val();
        var password = $('#pass').val();
        var confirmedPass = $('#pass-repeat').val();
        var firstName = $('#first-name').val();
        var lastName = $('#last-name').val();
        var email = $('#email').val();

        if (type && password != confirmedPass) {
            alert("Passwords did not match");
            return
        }

        if (type) {
            data = {
                username: username,
                password: password,
                firstName: firstName,
                lastName: lastName,
                email: email
            };
        } else {
            data = {
                username: username,
                password: password
            };
        }

        return data;
    }

    function register() {
        showForm("reg");
        $('#add').on('click', function () {
            users.register(getData('reg'), login, error)
        });
    }

    function login() {
        showForm();
        $('#add').on('click', function () {
            users.login(getData(), success, error)
        });
    }

    function deleteUser() {
        //Todo implement me
    }

    function editUser() {
        //Todo implement me
    }

    function storeData(data) {
        //Todo implement me
    }

    //Todo remove/replace me when proper forms are implemented.
    function showForm(type) {
        var factory = $('#user-factory');

        if (!factory.length) {
            $('article > *').hide();
        } else {
            factory.remove();
        }
        main.prepend(
            '<form id="user-factory"><span id="form-name">Register</span><br><label>' +
            'Username:<input type="text" id="username" required="required"><br>' +
            '<span class="reg">First Name:<input type="text" id="first-name" required="required"><br>' +
            'Last Name:<input type="text" id="last-name" required="required"><br>' +
            'Email:<input type="email" id="email" required="required"><br></span>' +
            'Password:<input type="password" id="pass" required="required"><br>' +
            '<span class="reg">Repeat Password:<input type="password" id="pass-repeat" required="required"></span>' +
            '<button type="button" id="add">submit</button>' +
            '<button id="cancel">cancel</button>' +
            '</label></form>'
        );

        if (!type) {
            $('#form-name').text('Login');
            $('.reg').remove();
        }
    }

    function success() {
        //Todo session tokens
        alert("Login successful!");
    }

    function error(error) {
        alert(error.responseJSON.error);
    }

    return {
        register: register,
        login: login
    }
})();