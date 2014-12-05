var articleFactory = (function () {
    var main = $('article');

    function loadArticles(data) {
        var articleData = data.results;
        //Todo replace with correct fields when DB is ready. Using temp DB fields for testing at the moment.
        for (var i = 0; i < articleData.length; i++) {
            var title = articleData[i].title;
            var content = articleData[i].text;

            main.append($
            ('<h2>' + title + '</h2>' +
            '<p>' + content + '</p>'));
        }
    }

    function createArticle() {
        //Todo Implement proper function and remove the css ;)
        var factory = $('#factory');
        $('p, h2').hide();

        if (!factory.length) {
            main.prepend(
                '<form id="factory" method="post"><label>' +
                '<input type="text" id="title" placeholder="Enter title.."><br>' +
                '<input type="text" id="tags" placeholder="Enter tags.."><br>' +
                '<textarea id="text"></textarea>' +
                '<button type="button" id="add">add</button>' +
                '<button id="cancel">cancel</button>' +
                '</label></form>'
            );
        } else {

           return;
        }

        $('#add').on('click', function () {
            var text = $('#text').val();
            var title = $('#title').val();
            var tags = $('#tags').val();

            var data = {
                title: title,
                text: text,
                tags: tags
            };

            articles.add(data, success, error);
        });
    }

    function deleteArticle() {
        //Todo implement me
    }

    function editArticle() {
        //Todo implement me
    }


    function success() {
        main.html('');
        articles.getAll(loadArticles);
    }

    function error() {
        alert("Something Went wrong");
    }

    return {
        load: loadArticles,
        create: createArticle,
        remove: deleteArticle,
        edit: editArticle
    }
})();