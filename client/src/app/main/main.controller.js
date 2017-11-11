export class MainController {
    constructor($scope, $http) {
        'ngInject';

        this.activate($scope, $http);


        $scope.createShortLink = function() {

            let req = {
                method: 'POST',
                url: './api/url_data.json',
                data: { url_datum: { long_url: $scope.longUrl } }
            }

            $http(req)
                .success(function(data) {
                    $scope.shortUrl = 'localhost:3000/' + data.short_url;
                    $scope.currentHits = data.hits;
                });
        }
    }

    activate($scope, $http) {
        $scope.urls = [];
        $http.get('./api/url_data.json').success(function (data) {
            $scope.urls = data;
        });

        $scope.total_hits;
        $http.get('./api/total_hits.json').success(function (data) {
            $scope.total_hits = data;
        });
    }

}
