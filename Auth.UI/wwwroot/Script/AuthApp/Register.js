//Controller
App.controller('RegisterCtrl', function ($scope, Service) {
    $scope.btnText = "Save";
    $scope.Save = function () {
        if ($scope.btnText == "Save") {
            var data = {
                UserName: $scope.UserName,
                Email: $scope.Email,
                Password: $scope.Password,
                RoleID: 3,//User
            }
            Service.Save('/api/User/UserRegister', data).then(function (data) {
                if (data.data.MsgCode == 200) {
                    alert("Save Succesfull")
                }
                else {
                    alert("Error")
                }
            })
        }
    }
});