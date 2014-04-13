controllers = angular.module('controllers')
controllers.controller('RecipeController', [ '$scope', '$routeParams', '$resource', '$location', 'flash'
  ($scope, $routeParams, $resource, $location, flash) ->

    # Angular default is instance.$save() to update and Class.save(instance) to create
    # but Rails wants POST for create, so change defaults by defining custom create
    Recipe = $resource('/recipes/:recipeId', { recipeId: '@id', format: 'json' },
      {
        'save':   {method: 'PUT'}
        'create': {method: 'POST'}
      }
    )

    # syntax of get params is ({params}, onSuccess(), onFailure())
    if $routeParams.recipeId
      Recipe.get({recipeId: $routeParams.recipeId},
        (recipe) -> $scope.recipe = recipe,
        (httpResponse) ->
          $scope.recipe = null
          flash.error   = "There is no recipe with ID #{$routeParams.recipeId}"
      )
    else
      $scope.recipe = {}

    $scope.back   = -> $location.path('/')
    $scope.edit   = -> $location.path("/recipes/#{$scope.recipe.id}/edit")
    $scope.cancel = ->
      if $scope.recipe.id
        $location.path("/recipes/#{$scope.recipe.id}")
      else
        $location.path('/')

    $scope.save   = ->
      onError = (_httpResponse) -> flash.error = "Something went wrong"
      if $scope.recipe.id
        $scope.recipe.$save(
          () -> $location.path("/recipes/#{$scope.recipe.id}"),
          onError
        )
      else
        Recipe.create($scope.recipe,
          (newRecipe) -> $location.path("/recipes/#{newRecipe.id}"),
          onError
        )

    $scope.delete = ->
      $scope.recipe.$delete()
      $scope.back()
])
