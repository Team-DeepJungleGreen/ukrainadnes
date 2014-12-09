var Database = (function () {
    
    var WEB_DOMAIN = 'http://localhost/';
    var API_PATH = 'api/';
    var ENDPOINT_PATH = WEB_DOMAIN + API_PATH;
    
    var Users = (function () {
	function getUserDetails(id, successCallback) {
	    $.ajax({
		type: "GET",
		dataType: "json",
		url: ENDPOINT_PATH + 'users/'+ id,
		success: successCallback,
		error: function () {
		    throw new Error("Couldn't GET the users.");
		},
	    });
	}

	function getAllUsers(successCallback) {
	    $.ajax({
		type: "GET",
		dataType: "json",
		url: ENDPOINT_PATH + 'users/',
		success: successCallback,
		error: function () {
		    throw new Error("Couldn't GET the users.");
		}
	    });
	}
    
	function addNewUser(username, password, firstName, lastName, email, priviledges, successCallback) {
	    $.ajax({
		type: "POST",
		dataType: 'application/json',
			data: {
			    "username": username,
			    "pass": password,
			    "firstName": firstName,
			    "lastName": lastName,
			    "eMail": email,
			    "priviledges": priviledges
			},
		url: ENDPOINT_PATH + 'users/',
		success: successCallback,
		error: function () {
		    throw new Error("Couldn't add the new user.");
		}
	    });
	}
    
	function updateUser(id, newUsername, newPassword, newFirstName, newLastName, newEmail, newPriviledges, successCallback) {
	    $.ajax({
		type: "PUT",
		dataType: 'application/json',
			data: {
			    "username": newUsername,
			    "pass": newPassword,
			    "firstName": newFirstName,
			    "lastName": newLastName,
			    "eMail": newEmail,
			    "priviledges": newPriviledges
			},
		url: ENDPOINT_PATH + 'users/' + id,
		success: successCallback,
		error: function () {
		    throw new Error("Couldn't update the user.");
		}
	    });
	}
    
	function removeUser(id, successCallback) {
	    $.ajax({
		type: "DELETE",
		url: ENDPOINT_PATH + 'users/' + id,
		success: successCallback,
		error: function () {
		    throw new Error("Couldn't GET the users.");
		},
	    });
	}
    
	return {
	    getAllUsers: getAllUsers,
	    getUserDetails: getUserDetails,
	    addNewUser: addNewUser,
	    updateUser: updateUser,
	    removeUser: removeUser
	}
	})();
    
    var Posts = (function () {
	
    })();
    
    var Tags = (function () {
	
    })();
    
    var Categories = (function () {
	
    })()
    
    var Comments = (function () {
	
    })();
    
    var Likes = (function () {
	
    })();
    
    return {
	Users: Users,
	Posts: Posts,
	Categories: Categories,
	Comments: Comments,
	Tags: Tags,
	Likes: Likes
    }
})();


$(document).ready(function () {
    // Check database:
    
    Database.Users.getAllusers();
});