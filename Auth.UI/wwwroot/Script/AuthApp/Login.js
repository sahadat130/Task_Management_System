//Controller
App.controller('LoginCtrl', function ($scope, $http, Service) {
    $scope.Login = function () {
        //if (fnVal() == true) {
        var data = {
            email: $scope.email,
            password: $scope.password,
        }
        Service.Save('/api/Auth/Login', data).then(function (data) {
            if (data.data.MsgCode == 200) {
                console.log(data.data.Token)
                localStorage.setItem('UserID', data.data.UserID);
                localStorage.setItem('UserName', data.data.UserName);
                localStorage.setItem('Token', data.data.Token);                
                window.location = '../Privacy';
            }
            else {
                alert("সঠিক ইমেইল এবং পাসওয়ার্ড দিন")
            }
        })
        //}
    }
    Service.GetAll('/api/Auth/GetMenuUserWise/' + localStorage.getItem("UserID")).then(function (data) {
        $scope.MenuList = data.data.ResponseData;
    });
    $scope.Logout = function () {
        localStorage.clear();
    }

})
//End Validation