'use strict';

angular.module('angularCApp')
  .factory('Vacancies', function($resource){
    return $resource('/api/v1/vacancies/:id', { id: '@id.$oid'});
  })
  .controller('VacCtrl', function($scope, Vacancies){
    $scope.vacancies = Vacancies.query();
    $scope.formUrl = 'views/partials/vacancy_form.html'

    $scope.editVacancy = function(id) {
      $scope.editing = $scope.vacancy[id];
    }


  })
  .controller('EditVacCtrl', function($scope, $routeParams, Vacancies){
    $scope.vacancy = Vacancies.get({id: $routeParams.index });
    $scope.index = $routeParams.index;
  })
