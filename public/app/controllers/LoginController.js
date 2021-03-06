angular.module("Store").controller('LoginController', function($scope, $http, $location,$window,$rootScope){
  $scope.info = {};
  $scope.loginUser = function() {
  //  console.log($scope.info);
    $http.post('../api/login',$scope.info)
   .then(function(response) {
       if(response.data.status == "error"){
        $scope.info.errormsg = response.data.message ;
        console.log("Error on logging in: " + response.data.message);
      }
       else {
        // console.log("Successfully logged in.");
         $rootScope.loggedin = true;
         $rootScope.isadmin = response.data.user.isAdmin;
         $rootScope.userid = response.data.user.id;

         /*After successfull login we go to our account page, might be switched with product page instead, or even basket*/
         $location.path('/myaccount');
       }
   });
  };
});
