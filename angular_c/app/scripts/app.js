'use strict';

angular
  .module('angularCApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config(function ($routeProvider, $locationProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl',
        controllerAs: 'main'
      })
      .when('/about', {
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl',
        controllerAs: 'about'
      })
      .when('/employees', {
        templateUrl: 'views/employees.html',
        controller: 'EmpCtrl',
        controllerAs: 'employee'
      })
      .when('/employees/:index', {
        templateUrl:'views/employer.html',
        controller: 'EditEmpCtrl'
      })
      .when('/vacancies', {
        templateUrl: 'views/vacancies.html',
        controller: 'VacCtrl'
      })
      .when('/vacancies/:index', {
        templateUrl: 'views/vacancy.html',
        controller: 'EditVacCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
      $locationProvider.html5Mode(true);
  });
