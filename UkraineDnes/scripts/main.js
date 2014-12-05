var articles = articles || {};
var users = users || {};

(function main() {
    var serviceRootUrl = "https://api.parse.com/1/";

    users = user.data.get(serviceRootUrl);
    articles = article.data.get(serviceRootUrl);
    articles.getAll(articleFactory.load);
})();
