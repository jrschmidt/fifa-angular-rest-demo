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

  $scope.new_match = {
    score1: -1
    score2: -1 }

  $scope.score = {}

  $scope.create_match = (match_data) ->
    $scope.matches_resource.save(match_data)

  $scope.update_match = (match_data) ->
    if $scope.score.s1 >= 0
      console.log "SET 1"
      match_data.score1 = $scope.score.s1
      match_data.score2 = $scope.score.s2
    else
      console.log "SET 2"
      match_data.score1 = $scope.score.s3
      match_data.score2 = $scope.score.s4
    $scope.matches_resource.save(match_data)


@fifa.config ($routeProvider) ->
  $routeProvider
    .when('/', {
      templateUrl: 'ngtemplates/home.html',
      controller: 'FifaCtrl'
      } )
    .otherwise( {
      templateUrl: 'ngtemplates/home.html',
      controller: 'FifaCtrl'} )
