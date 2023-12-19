//Service
App.factory('Service', ['$http', function ($http) {
    var Service = {};
    var URLPrefix = "http://localhost:21091";
    Service.GetAll = function (apiUrl) {
        return $http({
            method: "get",
            url: URLPrefix + apiUrl,
            headers: {
                "Content-Type": "application/json",
                "Authorization": 'Bearer ' + localStorage.getItem('Token')
            }
        });
    }
    Service.GetByID = function (apiUrl, ID) {
        return $http.get(URLPrefix + apiUrl + '?ID=' + ID);
    }
    Service.Save = function (apiUrl, entity) {
        return $http({
            method: "post",
            url: URLPrefix + apiUrl,
            headers: {
                "Content-Type": "application/json",
                "Authorization": 'Bearer ' + localStorage.getItem('Token')
            },
            data: entity
        });
    }
    Service.Update = function (apiUrl, entity) {
        return $http.put(URLPrefix + apiUrl, entity)
    }
    Service.Delete = function (apiUrl, ID) {
        return $http.delete(URLPrefix + apiUrl + '?ID=' + ID);
    }
    Service.GetOthersByID = function (apiUrl) {
        return $http.get(URLPrefix + apiUrl);
    }
    return Service;
}]);
//End of Service