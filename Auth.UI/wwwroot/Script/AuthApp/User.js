//Controller
App.controller('UserCtrl', function ($scope, Service) {
    $scope.btnText = "Save";
    $scope.Save = function () {
        if ($scope.btnText == "Save") {
            var data = {
                UserName: $scope.UserName,
                Email: $scope.Email,
                Password: $scope.Password,
                RoleID: $scope.RoleID,
            }
            Service.Save('/api/User/UserSave', data).then(function (data) {
                if (data.data.MsgCode == 200) {
                    alert("Save Succesfull")
                }
                else {
                    alert("Error")
                }
            })
        }
        else {
            var Updatedata = {
                UserID: $scope.UserID,
                UserName: $scope.UserName,
                Password: $scope.Password,
                RoleID: $scope.RoleID,
                Email: $scope.Email,
                CreatedAt: $scope.CreatedAt,
                UserRoleID: $scope.UserRoleID,
            }
            Service.Save('/api/User/UserUpdate', Updatedata).then(function (data) {
                if (data.data.MsgCode == 200) {
                    alert("Update Succesfull")
                    location.reload();
                }
                else {
                    alert("Error")
                }
            })
        }
    }
    Service.GetAll('/api/Role/GetRole').then(function (data) {
        $scope.RoleList = data.data.ResponseData;
    });
    Service.GetAll('/api/User/GetUser').then(function (data) {
        $scope.UserList = data.data.ResponseData;
    });
    $scope.Edit = function (row) {
        $scope.btnText = "Update";
        $scope.UserID = row.UserID;
        $scope.UserName = row.UserName;
        $scope.Email = row.Email;
        $scope.Password = row.Password;
        $scope.RoleID = row.RoleID;
        $scope.CreatedAt = row.CreatedAt;
        $scope.UserRoleID = row.UserRoleID;

    };
});