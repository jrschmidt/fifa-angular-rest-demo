# app/assets/javascripts/fifa.coffee

@fifa = angular.module 'fifa', ['ngRoute', 'ngResource', 'ng-rails-csrf']

@fifa.constant "team_url", "http://localhost:3000/teams/"


@fifa.controller 'FifaCtrl', ($scope) ->
  $scope.test_message = "*** CONTROLLER TEST MESSAGE (Fifa) ***"


@fifa.controller 'TeamsCtrl', ($scope, $http, $resource, team_url) ->
  $scope.test_message = "*** CONTROLLER TEST MESSAGE (Teams) ***"

  $scope.teams_resource = $resource(
    team_url + ":id" + ".json",
    {id: "@id"},
    {create: {method: "POST"} } )

  $scope.teams = $scope.teams_resource.query()


@fifa.config ($routeProvider) ->
  $routeProvider.
    otherwise( {
      templateUrl: 'ngtemplates/home.html',
      controller: 'TeamsCtrl'} )
