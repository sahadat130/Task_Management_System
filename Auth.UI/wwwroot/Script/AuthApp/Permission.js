//Controller
App.controller('PermissionCtrl', function ($scope, Service) {
    $scope.btnText = "Save";
    $scope.Save = function () {
        $('#idPermissionName').css('border-color', '');
        $('#idRoleId').css('border-color', '');
        $('.validation').hide();
        if ($('#idPermissionName').val() == '') {
            $("#idPermissionName").parent().after("<div class='validation  col-md-8 col-md-offset-4' style='color:Red;'>Role Name is required.</div>");
            $('#idPermissionName').css('border-color', 'red');
            $('#idPermissionName').focus();
            return false;
        }
        if ($('#idRoleId').val() == '') {
            $("#idRoleId").parent().after("<div class='validation  col-md-8 col-md-offset-4' style='color:Red;'>Role Name is required.</div>");
            $('#idRoleId').css('border-color', 'red');
            $('#idRoleId').focus();
            return false;
        }
        if ($scope.btnText == "Save") {
            var data = {
                PermissionName: $scope.PermissionName,
                RoleID: $scope.RoleID,
            }
            Service.Save('/api/Permission/PermissionSave', data).then(function (data) {
                if (data.data.MsgCode == 200) {
                    alert("Saved Succesfull")
                    location.reload();
                }
                else {
                    alert("সঠিক তথ্য দিন")
                }
            })
        }
        else {
            var data = {
                PermissionID: $scope.PermissionID,
                PermissionName: $scope.PermissionName,
                CreatedAt: $scope.CreatedAt,
                RoleID: $scope.RoleID,
            }
            Service.Save('/api/Permission/PermissionUpdate', data).then(function (data) {
                if (data.data.MsgCode == 200) {
                    alert("Update Succesfull")
                    location.reload();
                }
                else {
                    alert("সঠিক তথ্য দিন")
                }
            })
        }
        //}
    }
    Service.GetAll('/api/Auth/GetMenu').then(function (data) {
        $scope.MenuList = data.data.ResponseData;
    });
    Service.GetAll('/api/Role/GetRole').then(function (data) {
        $scope.RoleList = data.data.ResponseData;
    });
    Service.GetAll('/api/Permission/GetPermission').then(function (data) {
        $scope.PermissionList = data.data.ResponseData;
    });
    $scope.Edit = function (row) {
        $scope.btnText = "Update";
        $scope.PermissionID = row.PermissionID;
        $scope.PermissionName = row.PermissionName;
        $scope.RoleID = row.RoleID;
        $scope.CreatedAt = row.CreatedAt;

    };
});
//End Validation