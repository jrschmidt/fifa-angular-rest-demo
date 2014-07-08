# app/assets/javascripts/fifa.coffee

@fifa = angular.module 'fifa', ['ngRoute']

@fifa.controller 'FifaCtrl', ($scope) ->
  $scope.test_message = "*** CONTROLLER TEST MESSAGE ***"

@fifa.config ($routeProvider) ->
  $routeProvider.
    otherwise( {
      templateUrl: 'ngtemplates/home.html',
      controller: 'FifaCtrl'} )
