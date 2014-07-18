# app/assets/javascripts/fifa.coffee

@fifa = angular.module 'fifa', ['ngRoute', 'ngResource', 'ng-rails-csrf']

@fifa.constant "team_url", "http://localhost:3000/teams/"
@fifa.constant "match_url", "http://localhost:3000/matches/"


@fifa.controller 'FifaCtrl', ($scope) ->
  $scope.test_message = "*** CONTROLLER TEST MESSAGE (Fifa) ***"


@fifa.controller 'TeamsCtrl', ($scope, $http, $resource, team_url) ->
  $scope.test_message = "*** CONTROLLER TEST MESSAGE (Teams) ***"

  $scope.teams_resource = $resource(
    team_url + ":id" + ".json",
    {id: "@id"},
    {create: {method: "POST"} } )

  $scope.teams = $scope.teams_resource.query()


@fifa.controller 'MatchesCtrl', ($scope, $http, $resource, match_url) ->
  $scope.test_message = "*** CONTROLLER TEST MESSAGE (Matches) ***"

  $scope.matches_resource = $resource(
    match_url + ":id" + ".json",
    {id: "@id"},
    {create: {method: "POST"} } )

  $scope.matches = $scope.matches_resource.query()


@fifa.config ($routeProvider) ->
  $routeProvider
    .when('/', {
      templateUrl: 'ngtemplates/teams.html',
      controller: 'TeamsCtrl'
      } )
    .when('matches', {
      templateUrl: 'ngtemplates/teams.html',
      controller: 'TeamsCtrl'
      } )
    # .when(match_url, {
    #   templateUrl: 'ngtemplates/matches.html',
    #   controller: 'MatchesCtrl'
    #   } )
#    .when(match_url + ':id', {
#      templateUrl: 'ngtemplates/matches.html',
#      controller: 'MatchesCtrl'
#      } )
    .otherwise( {
      templateUrl: 'ngtemplates/teams.html',
      controller: 'TeamsCtrl'} )
