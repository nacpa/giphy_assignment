// To parse this JSON data, do
//
//     final trendingModel = trendingModelFromJson(jsonString);

import 'dart:convert';


class TrendingModel {
  List<Datum> data;
  TrendingModel({
    required this.data,
  });

  factory TrendingModel.fromJson(Map<String, dynamic> json) => TrendingModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String type;
  String id;
  String url;
  String slug;
  String bitlyGifUrl;
  String bitlyUrl;
  String embedUrl;
  String username;
  String source;
  String title;
  String rating;
  String contentUrl;
  String sourceTld;
  String sourcePostUrl;
  int isSticker;
  DateTime importDatetime;
  DateTime trendingDatetime;
  Images images;
  User user;
  String analyticsResponsePayload;
  Analytics analytics;

  Datum({
    required this.type,
    required this.id,
    required this.url,
    required this.slug,
    required this.bitlyGifUrl,
    required this.bitlyUrl,
    required this.embedUrl,
    required this.username,
    required this.source,
    required this.title,
    required this.rating,
    required this.contentUrl,
    required this.sourceTld,
    required this.sourcePostUrl,
    required this.isSticker,
    required this.importDatetime,
    required this.trendingDatetime,
    required this.images,
    required this.user,
    required this.analyticsResponsePayload,
    required this.analytics,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    type: json["type"],
    id: json["id"],
    url: json["url"],
    slug: json["slug"],
    bitlyGifUrl: json["bitly_gif_url"],
    bitlyUrl: json["bitly_url"],
    embedUrl: json["embed_url"],
    username: json["username"],
    source: json["source"],
    title: json["title"],
    rating: json["rating"],
    contentUrl: json["content_url"],
    sourceTld: json["source_tld"],
    sourcePostUrl: json["source_post_url"],
    isSticker: json["is_sticker"],
    importDatetime: DateTime.parse(json["import_datetime"]),
    trendingDatetime: DateTime.parse(json["trending_datetime"]),
    images: Images.fromJson(json["images"]),
    user: User.fromJson(json["user"]),
    analyticsResponsePayload: json["analytics_response_payload"],
    analytics: Analytics.fromJson(json["analytics"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "url": url,
    "slug": slug,
    "bitly_gif_url": bitlyGifUrl,
    "bitly_url": bitlyUrl,
    "embed_url": embedUrl,
    "username": username,
    "source": source,
    "title": title,
    "rating": rating,
    "content_url": contentUrl,
    "source_tld": sourceTld,
    "source_post_url": sourcePostUrl,
    "is_sticker": isSticker,
    "import_datetime": importDatetime.toIso8601String(),
    "trending_datetime": trendingDatetime.toIso8601String(),
    "images": images.toJson(),
    "user": user.toJson(),
    "analytics_response_payload": analyticsResponsePayload,
    "analytics": analytics.toJson(),
  };
}

class Analytics {
  Onclick onload;
  Onclick onclick;
  Onclick onsent;

  Analytics({
    required this.onload,
    required this.onclick,
    required this.onsent,
  });

  factory Analytics.fromJson(Map<String, dynamic> json) => Analytics(
    onload: Onclick.fromJson(json["onload"]),
    onclick: Onclick.fromJson(json["onclick"]),
    onsent: Onclick.fromJson(json["onsent"]),
  );

  Map<String, dynamic> toJson() => {
    "onload": onload.toJson(),
    "onclick": onclick.toJson(),
    "onsent": onsent.toJson(),
  };
}

class Onclick {
  String url;

  Onclick({
    required this.url,
  });

  factory Onclick.fromJson(Map<String, dynamic> json) => Onclick(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}

class Images {
  Original original;
  Downsized downsized;
  Downsized downsizedLarge;
  Downsized downsizedMedium;
  DownsizedSmall downsizedSmall;
  Downsized downsizedStill;
  Fixed fixedHeight;
  FixedDownsampled fixedHeightDownsampled;
  Fixed fixedHeightSmall;
  Downsized fixedHeightSmallStill;
  Downsized fixedHeightStill;
  Fixed fixedWidth;
  FixedDownsampled fixedWidthDownsampled;
  Fixed fixedWidthSmall;
  Downsized fixedWidthSmallStill;
  Downsized fixedWidthStill;
  Looping looping;
  Downsized originalStill;
  DownsizedSmall originalMp4;
  DownsizedSmall preview;
  Downsized previewGif;
  PreviewWebp previewWebp;
  DownsizedSmall hd;
  The480WStill the480WStill;

  Images({
    required this.original,
    required this.downsized,
    required this.downsizedLarge,
    required this.downsizedMedium,
    required this.downsizedSmall,
    required this.downsizedStill,
    required this.fixedHeight,
    required this.fixedHeightDownsampled,
    required this.fixedHeightSmall,
    required this.fixedHeightSmallStill,
    required this.fixedHeightStill,
    required this.fixedWidth,
    required this.fixedWidthDownsampled,
    required this.fixedWidthSmall,
    required this.fixedWidthSmallStill,
    required this.fixedWidthStill,
    required this.looping,
    required this.originalStill,
    required this.originalMp4,
    required this.preview,
    required this.previewGif,
    required this.previewWebp,
    required this.hd,
    required this.the480WStill,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    original: Original.fromJson(json["original"]),
    downsized: Downsized.fromJson(json["downsized"]),
    downsizedLarge: Downsized.fromJson(json["downsized_large"]),
    downsizedMedium: Downsized.fromJson(json["downsized_medium"]),
    downsizedSmall: DownsizedSmall.fromJson(json["downsized_small"]),
    downsizedStill: Downsized.fromJson(json["downsized_still"]),
    fixedHeight: Fixed.fromJson(json["fixed_height"]),
    fixedHeightDownsampled: FixedDownsampled.fromJson(json["fixed_height_downsampled"]),
    fixedHeightSmall: Fixed.fromJson(json["fixed_height_small"]),
    fixedHeightSmallStill: Downsized.fromJson(json["fixed_height_small_still"]),
    fixedHeightStill: Downsized.fromJson(json["fixed_height_still"]),
    fixedWidth: Fixed.fromJson(json["fixed_width"]),
    fixedWidthDownsampled: FixedDownsampled.fromJson(json["fixed_width_downsampled"]),
    fixedWidthSmall: Fixed.fromJson(json["fixed_width_small"]),
    fixedWidthSmallStill: Downsized.fromJson(json["fixed_width_small_still"]),
    fixedWidthStill: Downsized.fromJson(json["fixed_width_still"]),
    looping: Looping.fromJson(json["looping"]),
    originalStill: Downsized.fromJson(json["original_still"]),
    originalMp4: DownsizedSmall.fromJson(json["original_mp4"]),
    preview: DownsizedSmall.fromJson(json["preview"]),
    previewGif: Downsized.fromJson(json["preview_gif"]),
    previewWebp: PreviewWebp.fromJson(json["preview_webp"]),
    hd: DownsizedSmall.fromJson(json["hd"]),
    the480WStill: The480WStill.fromJson(json["480w_still"]),
  );

  Map<String, dynamic> toJson() => {
    "original": original.toJson(),
    "downsized": downsized.toJson(),
    "downsized_large": downsizedLarge.toJson(),
    "downsized_medium": downsizedMedium.toJson(),
    "downsized_small": downsizedSmall.toJson(),
    "downsized_still": downsizedStill.toJson(),
    "fixed_height": fixedHeight.toJson(),
    "fixed_height_downsampled": fixedHeightDownsampled.toJson(),
    "fixed_height_small": fixedHeightSmall.toJson(),
    "fixed_height_small_still": fixedHeightSmallStill.toJson(),
    "fixed_height_still": fixedHeightStill.toJson(),
    "fixed_width": fixedWidth.toJson(),
    "fixed_width_downsampled": fixedWidthDownsampled.toJson(),
    "fixed_width_small": fixedWidthSmall.toJson(),
    "fixed_width_small_still": fixedWidthSmallStill.toJson(),
    "fixed_width_still": fixedWidthStill.toJson(),
    "looping": looping.toJson(),
    "original_still": originalStill.toJson(),
    "original_mp4": originalMp4.toJson(),
    "preview": preview.toJson(),
    "preview_gif": previewGif.toJson(),
    "preview_webp": previewWebp.toJson(),
    "hd": hd.toJson(),
    "480w_still": the480WStill.toJson(),
  };
}

class Downsized {
  String height;
  String width;
  String size;
  String url;

  Downsized({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });

  factory Downsized.fromJson(Map<String, dynamic> json) => Downsized(
    height: json["height"],
    width: json["width"],
    size: json["size"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
    "size": size,
    "url": url,
  };
}

class DownsizedSmall {
  String height;
  String width;
  String mp4Size;
  String mp4;

  DownsizedSmall({
    required this.height,
    required this.width,
    required this.mp4Size,
    required this.mp4,
  });

  factory DownsizedSmall.fromJson(Map<String, dynamic> json) => DownsizedSmall(
    height: json["height"],
    width: json["width"],
    mp4Size: json["mp4_size"],
    mp4: json["mp4"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
    "mp4_size": mp4Size,
    "mp4": mp4,
  };
}

class Fixed {
  String height;
  String width;
  String size;
  String url;
  String mp4Size;
  String mp4;
  String webpSize;
  String webp;

  Fixed({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.mp4Size,
    required this.mp4,
    required this.webpSize,
    required this.webp,
  });

  factory Fixed.fromJson(Map<String, dynamic> json) => Fixed(
    height: json["height"],
    width: json["width"],
    size: json["size"],
    url: json["url"],
    mp4Size: json["mp4_size"],
    mp4: json["mp4"],
    webpSize: json["webp_size"],
    webp: json["webp"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
    "size": size,
    "url": url,
    "mp4_size": mp4Size,
    "mp4": mp4,
    "webp_size": webpSize,
    "webp": webp,
  };
}

class FixedDownsampled {
  String height;
  String width;
  String size;
  String url;
  String webpSize;
  String webp;

  FixedDownsampled({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.webpSize,
    required this.webp,
  });

  factory FixedDownsampled.fromJson(Map<String, dynamic> json) => FixedDownsampled(
    height: json["height"],
    width: json["width"],
    size: json["size"],
    url: json["url"],
    webpSize: json["webp_size"],
    webp: json["webp"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
    "size": size,
    "url": url,
    "webp_size": webpSize,
    "webp": webp,
  };
}

class Looping {
  String mp4Size;
  String mp4;

  Looping({
    required this.mp4Size,
    required this.mp4,
  });

  factory Looping.fromJson(Map<String, dynamic> json) => Looping(
    mp4Size: json["mp4_size"],
    mp4: json["mp4"],
  );

  Map<String, dynamic> toJson() => {
    "mp4_size": mp4Size,
    "mp4": mp4,
  };
}

class Original {
  String height;
  String width;
  String size;
  String url;
  String mp4Size;
  String mp4;
  String webpSize;
  String webp;
  String frames;
  String hash;

  Original({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.mp4Size,
    required this.mp4,
    required this.webpSize,
    required this.webp,
    required this.frames,
    required this.hash,
  });

  factory Original.fromJson(Map<String, dynamic> json) => Original(
    height: json["height"],
    width: json["width"],
    size: json["size"],
    url: json["url"],
    mp4Size: json["mp4_size"],
    mp4: json["mp4"],
    webpSize: json["webp_size"],
    webp: json["webp"],
    frames: json["frames"],
    hash: json["hash"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
    "size": size,
    "url": url,
    "mp4_size": mp4Size,
    "mp4": mp4,
    "webp_size": webpSize,
    "webp": webp,
    "frames": frames,
    "hash": hash,
  };
}

class PreviewWebp {
  String height;
  String width;
  String size;
  String url;

  PreviewWebp({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });

  factory PreviewWebp.fromJson(Map<String, dynamic> json) => PreviewWebp(
    height: json["height"],
    width: json["width"],
    size: json["size"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
    "size": size,
    "url": url,
  };
}

class The480WStill {
  String height;
  String width;
  String size;
  String url;

  The480WStill({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });

  factory The480WStill.fromJson(Map<String, dynamic> json) => The480WStill(
    height: json["height"],
    width: json["width"],
    size: json["size"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
    "size": size,
    "url": url,
  };
}

class User {
  String avatarUrl;
  String bannerImage;
  String bannerUrl;
  String profileUrl;
  String username;
  String displayName;
  String description;
  String instagramUrl;
  String websiteUrl;
  bool isVerified;

  User({
    required this.avatarUrl,
    required this.bannerImage,
    required this.bannerUrl,
    required this.profileUrl,
    required this.username,
    required this.displayName,
    required this.description,
    required this.instagramUrl,
    required this.websiteUrl,
    required this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    avatarUrl: json["avatar_url"],
    bannerImage: json["banner_image"],
    bannerUrl: json["banner_url"],
    profileUrl: json["profile_url"],
    username: json["username"],
    displayName: json["display_name"],
    description: json["description"],
    instagramUrl: json["instagram_url"],
    websiteUrl: json["website_url"],
    isVerified: json["is_verified"],
  );

  Map<String, dynamic> toJson() => {
    "avatar_url": avatarUrl,
    "banner_image": bannerImage,
    "banner_url": bannerUrl,
    "profile_url": profileUrl,
    "username": username,
    "display_name": displayName,
    "description": description,
    "instagram_url": instagramUrl,
    "website_url": websiteUrl,
    "is_verified": isVerified,
  };
}
