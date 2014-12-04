var articles = articles || {};

(function main() {
    //Todo replace the url if we are not using Parse.
    var serviceRootUrl = "https://api.parse.com/1/classes/";

    articles = article.data.get(serviceRootUrl);
    articles.getAll(articleFactory.load);
})();
