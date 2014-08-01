# app/assets/javascripts/fifa.coffee

@fifa = angular.module 'fifa', ['ngRoute', 'ngResource', 'ng-rails-csrf']

@fifa.constant "team_url", "http://localhost:3000/teams/"
@fifa.constant "match_url", "http://localhost:3000/matches/"


@fifa.controller 'FifaCtrl', ($scope, $http, $resource, team_url, match_url) ->

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

  $scope.new_match = {}

  $scope.create_match = (match_data) ->
    $scope.matches_resource.save(match_data)

  $scope.update_match = (match_data) ->
    $scope.matches_resource.save(match_data)

  # $scope.has_score = (match) ->
  #   if match.score2.toString().length > 0
  #     return true
  #   else
  #     return false


@fifa.config ($routeProvider) ->
  $routeProvider
    .when('/', {
      templateUrl: 'ngtemplates/home.html',
      controller: 'FifaCtrl'
      } )
    .otherwise( {
      templateUrl: 'ngtemplates/home.html',
      controller: 'FifaCtrl'} )
