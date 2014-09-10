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
    {create: {method: "POST"}, update: {method: "PUT"} } )

  $scope.matches_resource.query (matches) ->
    $scope.matches = matches
    $scope.scoreless = ( match for match in $scope.matches when match.score1 < 0 )

  $scope.new_match = {
    score1: -1
    score2: -1 }

  $scope.score_form_values = [
    {n: 0, str: "0"},
    {n: 1, str: "1"},
    {n: 2, str: "2"},
    {n: 3, str: "3"},
    {n: 4, str: "4"},
    {n: 5, str: "5"},
    {n: 6, str: "6"},
    {n: 7, str: "7"},
    {n: 8, str: "8"},
    {n: 9, str: "9"} ]

  $scope.create_match = (match_data) ->
    $scope.matches_resource.save(match_data)

  $scope.update_match = (match_data) ->
    $scope.matches_resource.update(match_data)


@fifa.config ($routeProvider) ->
  $routeProvider
    .when('/', {
      templateUrl: 'ngtemplates/home.html',
      controller: 'FifaCtrl'
      } )
    .otherwise( {
      templateUrl: 'ngtemplates/home.html',
      controller: 'FifaCtrl'} )
