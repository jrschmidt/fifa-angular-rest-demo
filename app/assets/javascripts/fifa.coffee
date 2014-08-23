# app/assets/javascripts/fifa.coffee

@fifa = angular.module 'fifa', ['ngRoute', 'ngResource', 'ng-rails-csrf']

@fifa.constant "team_url", "http://localhost:3000/teams/"
@fifa.constant "match_url", "http://localhost:3000/matches/"

# @fifa.filter "scoreless", (matches) ->
#   return (matches) ->
#     return match for match in matches when match.score1 < 0

# @fifa.filter "scoreless", ( (matches) ->
#   return match for match in matches when match.score1 < 0 )

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
  console.log "  $scope.matches.length = #{$scope.matches.length}"

  # $scope.scoreless = match for match in $scope.matches when match.score1 < 0
  # console.log "$scope.scoreless"
  # console.log "  length = #{$scope.scoreless.length}"
  # console.log "  #{mm.match_date}" for mm in $scope.scoreless

  $scope.new_match = {
    score1: -1
    score2: -1 }

  $scope.score = {}

  $scope.score_values = [
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
    # if $scope.score.s1 >= 0
    #   console.log "SET 1"
    #   match_data.score1 = $scope.score.s1
    #   match_data.score2 = $scope.score.s2
    # else
    #   console.log "SET 2"
    #   match_data.score1 = $scope.score.s3
    #   match_data.score2 = $scope.score.s4
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
