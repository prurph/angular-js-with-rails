receta = angular.module('receta', [
  'templates',
  'ngRoute',
  'controllers',
])

receta.config([ '$routeProvider',
  ($routeProvider) ->
    $routeProvider
      .when('/',
        templateUrl: 'index.html',
        controller:  'RecipesController'
      )
])

recipes = [
  {
    id: 1
    name: 'Watermelon with Salt'
  },
  {
    id: 2
    name: 'Dried Mango with Fresh Mango and Frozen Mango'
  },
  {
    id: 3
    name: 'Spinach and Parmesan Omelete'
  },
  {
    id: 4
    name: 'Steamed Haitatoes'
  }
]

controllers = angular.module('controllers', [])
controllers.controller('RecipesController', [ '$scope', '$routeParams', '$location',
  ($scope, $routeParams, $location) ->
    $scope.search = (keywords) -> $location.path('/').search('keywords', keywords)
    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.recipes = recipes.filter (recipe) ->
        recipe.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.recipes = []
])
