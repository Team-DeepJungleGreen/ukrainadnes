var user = user || {};

user.data = (function () {
    function User(rootUrl) {
        this.url = rootUrl;
        this.data = {};
    }

    User.prototype.register = function (data, success, error) {
        this.data = data;
        return ajaxRequester.post(this.url + "users", data, success, error);
    };

    User.prototype.login = function (data, success, error) {
        var url = this.url + "login?username=" + data.username + "&password=" + data.password;
        this.data = data;

        return ajaxRequester.get(url, success, error);
    };

    User.prototype.remove = function () {
        //Todo implement me
    };

    return {
        get: function (rootUrl) {
            return new User(rootUrl);
        }
    }
})();