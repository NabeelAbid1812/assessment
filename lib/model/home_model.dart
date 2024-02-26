class homedata {
  int? postId;
  int? userId;
  int? typeId;
  int? payType;
  int? price;
  String? currency;
  int? status;
  String? website;
  int? isPromote;
  int? promotDuration;
  String? campaignType;
  String? campDate;
  String? campTime;
  String? description;
  String? postVideo;
  String? hashtags;
  String? hashtagTitles;
  Null? postType;
  String? profileImage;
  String? name;
  int? countryId;
  String? country;
  String? flag;
  Null? currencyFlag;
  int? laqtaCoins;
  String? postTitle;
  int? displaySaltaries;
  String? content;
  List<Images>? images;
  int? likes;
  int? shares;
  int? comments;
  int? offers;
  String? type;
  List<Null>? survey;

  homedata(
      {this.postId,
      this.userId,
      this.typeId,
      this.payType,
      this.price,
      this.currency,
      this.status,
      this.website,
      this.isPromote,
      this.promotDuration,
      this.campaignType,
      this.campDate,
      this.campTime,
      this.description,
      this.postVideo,
      this.hashtags,
      this.hashtagTitles,
      this.postType,
      this.profileImage,
      this.name,
      this.countryId,
      this.country,
      this.flag,
      this.currencyFlag,
      this.laqtaCoins,
      this.postTitle,
      this.displaySaltaries,
      this.content,
      this.images,
      this.likes,
      this.shares,
      this.comments,
      this.offers,
      this.type,
      });

  homedata.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    userId = json['user_id'];
    typeId = json['type_id'];
    payType = json['pay_type'];
    price = json['price'];
    currency = json['currency'];
    status = json['status'];
    website = json['website'];
    isPromote = json['is_promote'];
    promotDuration = json['promot_duration'];
    campaignType = json['campaign_type'];
    campDate = json['camp_date'];
    campTime = json['camp_time'];
    description = json['description'];
    postVideo = json['post_video'];
    hashtags = json['hashtags'];
    hashtagTitles = json['hashtag_titles'];
    postType = json['post_type'];
    profileImage = json['profile_image'];
    name = json['name'];
    countryId = json['country_id'];
    country = json['country'];
    flag = json['flag'];
    currencyFlag = json['currency_flag'];
    laqtaCoins = json['laqta_coins'];
    postTitle = json['post_title'];
    displaySaltaries = json['display_saltaries'];
    content = json['content'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    likes = json['likes'];
    shares = json['shares'];
    comments = json['comments'];
    offers = json['offers'];
    type = json['type'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['user_id'] = this.userId;
    data['type_id'] = this.typeId;
    data['pay_type'] = this.payType;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['status'] = this.status;
    data['website'] = this.website;
    data['is_promote'] = this.isPromote;
    data['promot_duration'] = this.promotDuration;
    data['campaign_type'] = this.campaignType;
    data['camp_date'] = this.campDate;
    data['camp_time'] = this.campTime;
    data['description'] = this.description;
    data['post_video'] = this.postVideo;
    data['hashtags'] = this.hashtags;
    data['hashtag_titles'] = this.hashtagTitles;
    data['post_type'] = this.postType;
    data['profile_image'] = this.profileImage;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    data['country'] = this.country;
    data['flag'] = this.flag;
    data['currency_flag'] = this.currencyFlag;
    data['laqta_coins'] = this.laqtaCoins;
    data['post_title'] = this.postTitle;
    data['display_saltaries'] = this.displaySaltaries;
    data['content'] = this.content;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['likes'] = this.likes;
    data['shares'] = this.shares;
    data['comments'] = this.comments;
    data['offers'] = this.offers;
    data['type'] = this.type;
    
    return data;
  }
}

class Images {
  String? image;
  int? isFirstPic;

  Images({this.image, this.isFirstPic});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    isFirstPic = json['is_first_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['is_first_pic'] = this.isFirstPic;
    return data;
  }
}
