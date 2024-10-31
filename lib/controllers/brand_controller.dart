import '../models/brand_model.dart';

class BrandController {
  List<Brand> getBrands() {
    return [
      Brand(name: 'BOSS', logoUrl: 'assets/boss.png'),
      Brand(name: 'Versace', logoUrl: 'assets/versace2.png'),
      Brand(name: 'Versace', logoUrl: 'assets/versace.png'),
      Brand(name: 'Louis Vuitton', logoUrl: 'assets/louis_vuitton.png'),
      Brand(name: 'Gucci', logoUrl: 'assets/gucci.png'),
      Brand(name: 'Zara', logoUrl: 'assets/zara.png'),
      Brand(name: 'Balenciaga', logoUrl: 'assets/balenciaga.png'),
      Brand(name: 'Ralph Lauren', logoUrl: 'assets/ralph_lauren.png'),
      Brand(name: 'Levi\'s', logoUrl: 'assets/levis.png'),
      Brand(name: 'Chanel', logoUrl: 'assets/chanel.png'),
      Brand(name: 'Redtag', logoUrl: 'assets/redtag.png'),
      Brand(name: 'Armani', logoUrl: 'assets/armani.png'),
      Brand(name: 'Cotton On', logoUrl: 'assets/cotton_on.png'),
      Brand(name: 'HM', logoUrl: 'assets/hm.png'),
      Brand(name: 'M&S', logoUrl: 'assets/ms.png'),
    ];
  }
}
