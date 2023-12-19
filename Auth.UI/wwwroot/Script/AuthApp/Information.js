//Controller
App.controller('InformationCtrl', function ($scope, $filter, Service) {

    $scope.ClearAll = function () {
        $scope.info = {};
        Service.GetAll('/api/Information/GetInformation').then(function (data) {
            $scope.InformationList = data.data.ResponseData;
        });

    }
    $scope.ClearAll();
    $scope.btnText = "Save";
    $scope.Save = function (info) {
        if ($scope.btnText == "Save") {
            //console.log(info)
            //return;
            Service.Save('/api/Information/InformationSave', info).then(function (data) {
                if (data.data.MsgCode == 200) {
                    alert("Save Succesfull")
                    $scope.ClearAll();
                }
                else {
                    alert("Error")
                }
            })
        }
        else {
            Service.Save('/api/Information/InformationUpdate', info).then(function (data) {
                if (data.data.MsgCode == 200) {
                    alert("Update Succesfull")
                    $scope.ClearAll();
                }
                else {
                    alert("Error")
                }
            })
        }
    }
    $scope.Edit = function (row) {
        $scope.btnText = "Update";
        $scope.info = row;
        //$("#idDueDate").val(new Date().toLocaleString("en-US", { timeZone: "Asia/Dhaka" }));// $filter('date')(row.DueDate, 'YYYY-MM-DD');

        //$("#idDueDate").val(row.DueDate.toString("yyyy-MM-dd"));
        //console.log($("#idDueDate").val())
        document.getElementById('idDueDate').value = new Date().toLocaleString("en-US", { timeZone: "Asia/Dhaka" });
    };
});