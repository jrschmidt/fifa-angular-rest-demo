# app/assets/javascripts/fifa.coffee

@fifa = angular.module 'fifa', ['ngRoute', 'ngResource', 'ng-rails-csrf']

@fifa.controller 'FifaCtrl', ($scope) ->
  $scope.test_message = "*** CONTROLLER TEST MESSAGE ***"

@fifa.constant "team_url", "http://localhost:3000/teams/"

@fifa.controller 'TeamsCtrl', ($scope, $http, $resource, team_url) ->
  $scope.teams_resource = $resource(
    team_url + ":id" + ".json",
    {id: "@id"},
    {create: {method: "POST"} } )

@fifa.config ($routeProvider) ->
  $routeProvider.
    otherwise( {
      templateUrl: 'ngtemplates/home.html',
      controller: 'FifaCtrl'} )
