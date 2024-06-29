class MenuModel {
  List<Menu>? menu;
  int? vat;
  String? note;

  MenuModel({this.menu, this.vat, this.note});

  MenuModel.fromJson(Map<String, dynamic> json) {
    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu!.add(new Menu.fromJson(v));
      });
    }
    vat = json['vat'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.menu != null) {
      data['menu'] = this.menu!.map((v) => v.toJson()).toList();
    }
    data['vat'] = this.vat;
    data['note'] = this.note;
    return data;
  }
}

class Menu {
  int? id;
  String? name;
  String? slug;
  String? image;
  String? description;
  int? price;
  int? discountPrice;

  Menu(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.description,
      this.price,
      this.discountPrice});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    discountPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    return data;
  }
}