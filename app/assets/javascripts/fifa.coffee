# app/assets/javascripts/fifa.coffee

@fifa = angular.module 'fifa', ['ngRoute', 'ngResource', 'ng-rails-csrf']

@fifa.constant "team_url", "http://localhost:3000/teams/"
@fifa.constant "match_url", "http://localhost:3000/matches/"


@fifa.controller 'FifaCtrl', ($scope, $http, $resource, team_url, match_url) ->
  console.log "testing console.log method from controller FifaCtrl"

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

  $scope.new_match = {}

  $scope.create_match = (match_data) ->
    console.log "Trying to save match data ..."
    $scope.matches_resource.save(match_data)

  $scope.test_options = ["north", "south", "east", "west"]


  # test_match = {
  #   team1_id: 1,
  #   team2_id: 32,
  #   match_date: "1984-01-01" }

  # $scope.matches_resource.save(test_match)


@fifa.config ($routeProvider) ->
  $routeProvider
    .when('/', {
      templateUrl: 'ngtemplates/home.html',
      controller: 'FifaCtrl'
      } )
    .otherwise( {
      templateUrl: 'ngtemplates/home.html',
      controller: 'FifaCtrl'} )
