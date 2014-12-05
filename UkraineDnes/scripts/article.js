var article = article || {};

article.data = (function () {
    function Article(rootUrl) {
        this.url = rootUrl + 'classes/Article/';
        this.data = {};
    }

    Article.prototype.getAll = function (success) {
        return ajaxRequester.get(this.url, success);
    };

    Article.prototype.add = function (data, success) {
        this.data = data;

        return ajaxRequester.post(this.url, data, success);
    };

    Article.prototype.remove = function () {
        //Todo implement me
    };

    Article.prototype.edit = function () {
        //Todo implement me
    };

    return {
        get: function (rootUrl) {
            return new Article(rootUrl);
        }
    }
})();
