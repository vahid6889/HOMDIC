/// message : "با موفقیت دریافت شد"
/// status : "success"
/// data : [{"id":1,"title":"مرکبات","img":"https://shopbs.besenior.ir/uploads/16687047495364787.jpg","icon":"https://shopbs.besenior.ir/images/image-not-found.png","childs":[{"id":2,"title":"میوه ارگانیک","img":"https://shopbs.besenior.ir/images/image-not-found.png","icon":"https://shopbs.besenior.ir/images/image-not-found.png","childs":null},{"id":3,"title":"سبزیجات ارگانیک","img":"https://shopbs.besenior.ir/images/image-not-found.png","icon":"https://shopbs.besenior.ir/images/image-not-found.png","childs":[{"id":5,"title":"سبزیجات","img":"https://shopbs.besenior.ir/uploads/16671431164169351.jpeg","icon":"https://shopbs.besenior.ir/images/image-not-found.png","childs":null}]}]},{"id":7,"title":"سبزیجات ارگانیک","img":"https://shopbs.besenior.ir/uploads/16687150398463558.jpg","icon":"https://shopbs.besenior.ir/images/image-not-found.png","childs":null},{"id":14,"title":"سبزیجات","img":"https://shopbs.besenior.ir/uploads/16687154112816610.jpg","icon":"https://shopbs.besenior.ir/images/image-not-found.png","childs":null},{"id":6,"title":"میوه استوایی","img":"https://shopbs.besenior.ir/uploads/1668775972360991.jpg","icon":"https://shopbs.besenior.ir/images/image-not-found.png","childs":null},{"id":8,"title":"میوه خشک","img":"https://shopbs.besenior.ir/uploads/16687041852250311.jpg","icon":"https://shopbs.besenior.ir/images/image-not-found.png","childs":null},{"id":19,"title":"میوه ارگانیگ","img":"https://shopbs.besenior.ir/uploads/16703992239276749.jpg","icon":"https://shopbs.besenior.ir/uploads/16703992234900407.jpg","childs":null},{"id":20,"title":"آبمیوه ها","img":"https://shopbs.besenior.ir/uploads/16703994954087672.jpg","icon":"https://shopbs.besenior.ir/uploads/16703994952495343.jpg","childs":null},{"id":21,"title":"نهال ها","img":"https://shopbs.besenior.ir/uploads/16703998855486088.jpg","icon":"https://shopbs.besenior.ir/uploads/16703998858397913.jpg","childs":null}]

class CategoriesModel {
  CategoriesModel({
    this.message,
    this.status,
    this.data,
  });

  CategoriesModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? message;
  String? status;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// title : "مرکبات"
/// img : "https://shopbs.besenior.ir/uploads/16687047495364787.jpg"
/// icon : "https://shopbs.besenior.ir/images/image-not-found.png"
/// childs : [{"id":2,"title":"میوه ارگانیک","img":"https://shopbs.besenior.ir/images/image-not-found.png","icon":"https://shopbs.besenior.ir/images/image-not-found.png","childs":null},{"id":3,"title":"سبزیجات ارگانیک","img":"https://shopbs.besenior.ir/images/image-not-found.png","icon":"https://shopbs.besenior.ir/images/image-not-found.png","childs":[{"id":5,"title":"سبزیجات","img":"https://shopbs.besenior.ir/uploads/16671431164169351.jpeg","icon":"https://shopbs.besenior.ir/images/image-not-found.png","childs":null}]}]

class Data {
  Data({
    this.id,
    this.title,
    this.img,
    this.icon,
    this.childs,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    img = json['img'];
    icon = json['icon'];
    if (json['childs'] != null) {
      childs = [];
      json['childs'].forEach((v) {
        childs?.add(Childs.fromJson(v));
      });
    }
  }
  int? id;
  String? title;
  String? img;
  String? icon;
  List<Childs>? childs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['img'] = img;
    map['icon'] = icon;
    if (childs != null) {
      map['childs'] = childs?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 2
/// title : "میوه ارگانیک"
/// img : "https://shopbs.besenior.ir/images/image-not-found.png"
/// icon : "https://shopbs.besenior.ir/images/image-not-found.png"
/// childs : null

class Childs {
  Childs({
    this.id,
    this.title,
    this.img,
    this.icon,
    this.childs,
  });

  Childs.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    img = json['img'];
    icon = json['icon'];
    childs = json['childs'];
  }
  num? id;
  String? title;
  String? img;
  String? icon;
  dynamic childs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['img'] = img;
    map['icon'] = icon;
    map['childs'] = childs;
    return map;
  }
}
