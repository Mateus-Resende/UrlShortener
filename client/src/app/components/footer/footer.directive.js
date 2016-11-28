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

    this.creationDate = "Nov 20th, 2016";
    this.author = "Mateus A. M. Resende";
  }
}
