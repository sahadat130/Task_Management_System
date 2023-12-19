//Controller
App.controller('RoleCtrl', function ($scope, Service) {
    $scope.btnText = "Save";
    $scope.Save = function () {
        $('#idRoleName').css('border-color', '');
        $('.validation').hide();
        if ($('#idRoleName').val() == '') {
            $("#idRoleName").parent().after("<div class='validation  col-md-8 col-md-offset-4' style='color:Red;'>Role Name is required.</div>");
            $('#idRoleName').css('border-color', 'red');
            $('#idRoleName').focus();
            return false;
        }
        if ($scope.btnText == "Save") {
            var data = {
                RoleName: $scope.RoleName,
            }
            Service.Save('/api/Role/RoleSave', data).then(function (data) {
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
                RoleID: $scope.RoleID,
                RoleName: $scope.RoleName,
                CreatedAt: $scope.CreatedAt,
            }
            Service.Save('/api/Role/RoleUpdate', data).then(function (data) {
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
    Service.GetAll('/api/Role/GetRole').then(function (data) {
        $scope.RoleList = data.data.ResponseData;
    });
    $scope.Edit = function (row) {
        $scope.btnText = "Update";
        $scope.RoleID = row.RoleID;
        $scope.RoleName = row.RoleName;
        $scope.CreatedAt = row.CreatedAt;

    };
});
//End Validation