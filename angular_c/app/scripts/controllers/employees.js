'use strict';

angular.module('angularCApp')
  .factory('Employees', function($resource){
    return $resource('/api/v1/employees/:id', { id: '@id.$oid' });
  })
  .controller('EmpCtrl', function($scope, Employees) {
    $scope.employees = Employees.query();
  })
  .controller('EditEmpCtrl', function($scope, $routeParams, Employees){
    $scope.employee = Employees.get({id: $routeParams.index });
    $scope.index = $routeParams.index;
  });
