
class RPNewArrival {
  bool status;
  List<Products> products;

  RPNewArrival({this.status, this.products});

  RPNewArrival.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int id;
  int categoryId;
  String productName;
  String productModel;
  String productDesc;
  String productImage;
  String tag;
  int productPublicationStatus;
  int isFeatureProduct;
  int stock;
  Null batchNo;
  int createdBy;
  int updatedBy;
  String createdAt;
  String updatedAt;
  Null taxClassId;
  String taxRate;
  Null weightClassId;
  String weightClass;
  String weight;
  int newArrival;
  String giftVoucher;
  Null vendorId;
  Null commissionType;
  Null commission;
  String specification;
  String warranty;
  String emi;
  int productId;
  int outletId;
  int stockQty;
  int isFeaturedProduct;
  int price;
  Null discount;
  Null type;
  Null startDate;
  Null endDate;
  Null maxInCart;
  List<String> images;

  Products(
      {this.id,
        this.categoryId,
        this.productName,
        this.productModel,
        this.productDesc,
        this.productImage,
        this.tag,
        this.productPublicationStatus,
        this.isFeatureProduct,
        this.stock,
        this.batchNo,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.taxClassId,
        this.taxRate,
        this.weightClassId,
        this.weightClass,
        this.weight,
        this.newArrival,
        this.giftVoucher,
        this.vendorId,
        this.commissionType,
        this.commission,
        this.specification,
        this.warranty,
        this.emi,
        this.productId,
        this.outletId,
        this.stockQty,
        this.isFeaturedProduct,
        this.price,
        this.discount,
        this.type,
        this.startDate,
        this.endDate,
        this.maxInCart,
        this.images});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    productName = json['product_name'];
    productModel = json['product_model'];
    productDesc = json['product_desc'];
    productImage = json['product_image'];
    tag = json['tag'];
    productPublicationStatus = json['product_publication_status'];
    isFeatureProduct = json['is_feature_product'];
    stock = json['stock'];
    batchNo = json['batch_no'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxClassId = json['tax_class_id'];
    taxRate = json['tax_rate'];
    weightClassId = json['weight_class_id'];
    weightClass = json['weight_class'];
    weight = json['weight'];
    newArrival = json['new_arrival'];
    giftVoucher = json['gift_voucher'];
    vendorId = json['vendor_id'];
    commissionType = json['commission_type'];
    commission = json['commission'];
    specification = json['specification'];
    warranty = json['warranty'];
    emi = json['emi'];
    productId = json['product_id'];
    outletId = json['outlet_id'];
    stockQty = json['stock_qty'];
    isFeaturedProduct = json['is_featured_product'];
    price = json['price'];
    discount = json['discount'];
    type = json['type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    maxInCart = json['max_in_cart'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['product_name'] = this.productName;
    data['product_model'] = this.productModel;
    data['product_desc'] = this.productDesc;
    data['product_image'] = this.productImage;
    data['tag'] = this.tag;
    data['product_publication_status'] = this.productPublicationStatus;
    data['is_feature_product'] = this.isFeatureProduct;
    data['stock'] = this.stock;
    data['batch_no'] = this.batchNo;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['tax_class_id'] = this.taxClassId;
    data['tax_rate'] = this.taxRate;
    data['weight_class_id'] = this.weightClassId;
    data['weight_class'] = this.weightClass;
    data['weight'] = this.weight;
    data['new_arrival'] = this.newArrival;
    data['gift_voucher'] = this.giftVoucher;
    data['vendor_id'] = this.vendorId;
    data['commission_type'] = this.commissionType;
    data['commission'] = this.commission;
    data['specification'] = this.specification;
    data['warranty'] = this.warranty;
    data['emi'] = this.emi;
    data['product_id'] = this.productId;
    data['outlet_id'] = this.outletId;
    data['stock_qty'] = this.stockQty;
    data['is_featured_product'] = this.isFeaturedProduct;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['type'] = this.type;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['max_in_cart'] = this.maxInCart;
    data['images'] = this.images;
    return data;
  }
}