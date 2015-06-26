'use strict';

angular.module('clientApp')
  .controller('MainCtrl', function ($scope, $sce) {
    $scope.primary_button = $sce.trustAsHtml( Lovelace.complete('buttons/primary', {tag: 'button', text: "i'm a primary button"}) );

    $scope.secondary_button = $sce.trustAsHtml( Lovelace.complete('buttons/secondary', {tag: 'button', text: "i'm a secondary button"}) );

  });
