# app/assets/javascripts/fifa.coffee

@fifa = angular.module 'fifa', ['ngRoute', 'ngResource', 'ng-rails-csrf']

@fifa.constant "team_url", "http://localhost:3000/teams/"
@fifa.constant "match_url", "http://localhost:3000/matches/"


@fifa.filter "any_match", (all_matches,team_id) ->
  return m for m in all_matches where (m.team1 == team_id or m.team2 == team_id)


@fifa.controller 'FifaCtrl', ($scope, $http, $resource, team_url, match_url) ->
  $scope.test_message = "*** CONTROLLER TEST MESSAGE (Fifa) ***"

  $scope.teams_resource = $resource(
    team_url + ":id" + ".json",
    {id: "@id"},
    {create: {method: "POST"} } )

  $scope.teams = $scope.teams_resource.query()

  $scope.matches_resource = $resource(
    match_url + ":id" + ".json",
    {id: "@id"},
    {create: {method: "POST"} } )

  $scope.matches = $scope.matches_resource.query()

  $scope.all_matches_for_team = (tid) ->
    # return match for match in matches when ((match.team1 == tid) || (match.team2 == tid))
    return match.team1 == tid || match.team2 == tid

@fifa.config ($routeProvider) ->
  $routeProvider
    .when('/', {
      templateUrl: 'ngtemplates/home.html',
      controller: 'FifaCtrl'
      } )
    .otherwise( {
      templateUrl: 'ngtemplates/home.html',
      controller: 'FifaCtrl'} )
