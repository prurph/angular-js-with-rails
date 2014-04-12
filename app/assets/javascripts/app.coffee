receta = angular.module('receta', [
  'templates',
  'ngRoute',
  'controllers',
  'ngResource'
])

receta.config([ '$routeProvider',
  ($routeProvider) ->
    $routeProvider
      .when('/',
        templateUrl: 'index.html',
        controller:  'RecipesController'
      )
])

controllers = angular.module('controllers', [])
