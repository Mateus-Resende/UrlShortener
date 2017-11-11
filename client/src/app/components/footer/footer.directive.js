export function FooterDirective() {
  'ngInject';

  let footer = {
    restrict: 'E',
    templateUrl: 'app/components/footer/footer.html',
    controller: FooterController,
    controllerAs: 'footerCtrl',
    bindToController: true
  };

  return footer;
}

class FooterController {
  constructor () {
    'ngInject';

    this.creationDate = "Nov 11th, 2017";
    this.author = "Mateus A. M. Resende";
  }
}
