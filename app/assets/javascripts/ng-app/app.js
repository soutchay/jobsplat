var App = angular.module('thisApp', ['ui.router']);
// inbetween brackets, DEPENDENCIES
//pass in the argument, a function
App.config(function($stateProvider, $urlRouterProvider) {

//otherwise send them to the route
	$urlRouterProvider.otherwise('/');

//takes two arguments; name of state and an object
//whenvever you are on state home you go to home and use the template
	$stateProvider
	.state('home', {
		url: '/home',
		template: '<h1>HOME VIEW {{tag}}</h1>',
		// templateUrl: '/templates/home.html',
		controller: function($scope) {$scope.tag = 'IS HERE'}
		//logic goes in controller!
	})
	.state('about', {
		url: '/about',
		//call nested states with a . as in .portfolio
		template: '<h1>ABOUT VIEW</h1><a ui-sref=".portfolio">Portfolio Link</a><div ui-view></div>'
	})
	//portfolio link within our about
	.state('about.portfolio', {
		url: '/portfolio',
		template: '<h1>PORTFOLIO VIEW {{tag}}</h1>',
		controller: function($scope) {$scope.tag = '...we made it'}
	})

});