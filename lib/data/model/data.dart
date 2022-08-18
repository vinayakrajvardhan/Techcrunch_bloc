import 'dart:convert';

List<TechcrunchData> techcrunchDataFromJson(String str) =>
    List<TechcrunchData>.from(
        json.decode(str).map((x) => TechcrunchData.fromJson(x)));

String techcrunchDataToJson(List<TechcrunchData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TechcrunchData {
  TechcrunchData({
    this.id,
    required this.date,
    required this.dateGmt,
    required this.guid,
    required this.modified,
    required this.modifiedGmt,
    required this.slug,
    required this.status,
    required this.type,
    required this.link,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.author,
    required this.featuredMedia,
    required this.commentStatus,
    required this.pingStatus,
    required this.sticky,
    required this.template,
    required this.format,
    required this.meta,
    required this.categories,
    required this.tags,
    required this.crunchbaseTag,
    required this.tcStoriesTax,
    required this.tcEcCategory,
    required this.tcEvent,
    required this.jetpackFeaturedMediaUrl,
    required this.parsely,
    required this.shortlink,
    required this.rapidData,
    required this.premiumContent,
    required this.premiumCutoffPercent,
    required this.featured,
    required this.subtitle,
    required this.seoTitle,
    required this.editorialContentProvider,
    required this.seoDescription,
    required this.tcCbMapping,
    required this.associatedEvent,
    required this.event,
    required this.authors,
    required this.hideFeaturedImage,
    required this.canonicalUrl,
    required this.links,
  });

  final num? id;
  final DateTime date;
  final DateTime dateGmt;
  final Guid guid;
  final DateTime modified;
  final DateTime modifiedGmt;
  final String slug;
  final Status? status;
  final Type? type;
  final String link;
  final Guid title;
  final Content content;
  final Content excerpt;
  final num author;
  final num featuredMedia;
  final CommentStatus? commentStatus;
  final PingStatus? pingStatus;
  final bool sticky;
  final String template;
  final Format? format;
  final TechcrunchDatumMeta meta;
  final List<int> categories;
  final List<int> tags;
  final List<dynamic> crunchbaseTag;
  final List<dynamic> tcStoriesTax;
  final List<dynamic> tcEcCategory;
  final List<dynamic> tcEvent;
  final String jetpackFeaturedMediaUrl;
  final Parsely parsely;
  final String shortlink;
  final RapidData rapidData;
  final bool premiumContent;
  final num premiumCutoffPercent;
  final bool featured;
  final String subtitle;
  final String seoTitle;
  final String editorialContentProvider;
  final String seoDescription;
  final List<dynamic> tcCbMapping;
  final dynamic associatedEvent;
  final dynamic event;
  final List<num> authors;
  final bool hideFeaturedImage;
  final String canonicalUrl;
  final Links links;

  factory TechcrunchData.fromJson(Map<String, dynamic> json) => TechcrunchData(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: statusValues.map[json["status"]],
        type: typeValues.map[json["type"]],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        commentStatus: commentStatusValues.map[json["comment_status"]],
        pingStatus: pingStatusValues.map[json["ping_status"]],
        sticky: json["sticky"],
        template: json["template"],
        format: formatValues.map[json["format"]],
        meta: TechcrunchDatumMeta.fromJson(json["meta"]),
        categories: List<int>.from(json["categories"].map((x) => x)),
        tags: List<int>.from(json["tags"].map((x) => x)),
        crunchbaseTag: List<dynamic>.from(json["crunchbase_tag"].map((x) => x)),
        tcStoriesTax: List<dynamic>.from(json["tc_stories_tax"].map((x) => x)),
        tcEcCategory: List<dynamic>.from(json["tc_ec_category"].map((x) => x)),
        tcEvent: List<dynamic>.from(json["tc_event"].map((x) => x)),
        jetpackFeaturedMediaUrl: json["jetpack_featured_media_url"],
        parsely: Parsely.fromJson(json["parsely"]),
        shortlink: json["shortlink"],
        rapidData: RapidData.fromJson(json["rapidData"]),
        premiumContent: json["premiumContent"],
        premiumCutoffPercent: json["premiumCutoffPercent"],
        featured: json["featured"],
        subtitle: json["subtitle"],
        seoTitle: json["seoTitle"],
        editorialContentProvider: json["editorialContentProvider"],
        seoDescription: json["seoDescription"],
        tcCbMapping: List<dynamic>.from(json["tc_cb_mapping"].map((x) => x)),
        associatedEvent: json["associatedEvent"],
        event: json["event"],
        authors: List<int>.from(json["authors"].map((x) => x)),
        hideFeaturedImage: json["hide_featured_image"],
        canonicalUrl: json["canonical_url"],
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "guid": guid.toJson(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "slug": slug,
        "status": statusValues.reverse[status],
        "type": typeValues.reverse[type],
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "excerpt": excerpt.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": commentStatusValues.reverse[commentStatus],
        "ping_status": pingStatusValues.reverse[pingStatus],
        "sticky": sticky,
        "template": template,
        "format": formatValues.reverse[format],
        "meta": meta.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "crunchbase_tag": List<dynamic>.from(crunchbaseTag.map((x) => x)),
        "tc_stories_tax": List<dynamic>.from(tcStoriesTax.map((x) => x)),
        "tc_ec_category": List<dynamic>.from(tcEcCategory.map((x) => x)),
        "tc_event": List<dynamic>.from(tcEvent.map((x) => x)),
        "jetpack_featured_media_url": jetpackFeaturedMediaUrl,
        "parsely": parsely.toJson(),
        "shortlink": shortlink,
        "rapidData": rapidData.toJson(),
        "premiumContent": premiumContent,
        "premiumCutoffPercent": premiumCutoffPercent,
        "featured": featured,
        "subtitle": subtitle,
        "seoTitle": seoTitle,
        "editorialContentProvider": editorialContentProvider,
        "seoDescription": seoDescription,
        "tc_cb_mapping": List<dynamic>.from(tcCbMapping.map((x) => x)),
        "associatedEvent": associatedEvent,
        "event": event,
        "authors": List<dynamic>.from(authors.map((x) => x)),
        "hide_featured_image": hideFeaturedImage,
        "canonical_url": canonicalUrl,
        "_links": links.toJson(),
      };
}

enum CommentStatus { OPEN }

final commentStatusValues = EnumValues({"open": CommentStatus.OPEN});

class Content {
  Content({
    required this.rendered,
    required this.protected,
  });

  final String rendered;
  final bool protected;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

enum Format { STANDARD }

final formatValues = EnumValues({"standard": Format.STANDARD});

class Guid {
  Guid({
    required this.rendered,
  });

  final String rendered;

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

class Links {
  Links({
    required this.self,
    required this.collection,
    required this.about,
    required this.replies,
    required this.versionHistory,
    required this.predecessorVersion,
    required this.authors,
    required this.httpsTechcrunchComEdit,
    required this.author,
    required this.wpFeaturedmedia,
    required this.wpAttachment,
    required this.wpTerm,
    required this.curies,
  });

  final List<About> self;
  final List<About> collection;
  final List<About> about;
  final List<ReplyElement> replies;
  final List<VersionHistory> versionHistory;
  final List<PredecessorVersion> predecessorVersion;
  final List<ReplyElement> authors;
  final List<About> httpsTechcrunchComEdit;
  final List<ReplyElement> author;
  final List<ReplyElement> wpFeaturedmedia;
  final List<About> wpAttachment;
  final List<WpTerm> wpTerm;
  final List<Cury> curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        replies: List<ReplyElement>.from(
            json["replies"].map((x) => ReplyElement.fromJson(x))),
        versionHistory: List<VersionHistory>.from(
            json["version-history"].map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: List<PredecessorVersion>.from(
            json["predecessor-version"]
                .map((x) => PredecessorVersion.fromJson(x))),
        authors: List<ReplyElement>.from(
            json["authors"].map((x) => ReplyElement.fromJson(x))),
        httpsTechcrunchComEdit: List<About>.from(
            json["https://techcrunch.com/edit"].map((x) => About.fromJson(x))),
        author: List<ReplyElement>.from(
            json["author"].map((x) => ReplyElement.fromJson(x))),
        wpFeaturedmedia: List<ReplyElement>.from(
            json["wp:featuredmedia"].map((x) => ReplyElement.fromJson(x))),
        wpAttachment: List<About>.from(
            json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm:
            List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "version-history":
            List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "predecessor-version":
            List<dynamic>.from(predecessorVersion.map((x) => x.toJson())),
        "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
        "https://techcrunch.com/edit":
            List<dynamic>.from(httpsTechcrunchComEdit.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "wp:featuredmedia":
            List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:attachment":
            List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(wpTerm.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
      };
}

class About {
  About({
    required this.href,
  });

  final String href;

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class ReplyElement {
  ReplyElement({
    required this.embeddable,
    required this.href,
  });

  final bool embeddable;
  final String href;

  factory ReplyElement.fromJson(Map<String, dynamic> json) => ReplyElement(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class Cury {
  Cury({
    required this.name,
    required this.href,
    required this.templated,
  });

  final CuryName? name;
  final Href? href;
  final bool templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: curyNameValues.map[json["name"]],
        href: hrefValues.map[json["href"]],
        templated: json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": curyNameValues.reverse[name],
        "href": hrefValues.reverse[href],
        "templated": templated,
      };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues =
    EnumValues({"https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL});

enum CuryName { WP }

final curyNameValues = EnumValues({"wp": CuryName.WP});

class PredecessorVersion {
  PredecessorVersion({
    required this.id,
    required this.href,
  });

  final int id;
  final String href;

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) =>
      PredecessorVersion(
        id: json["id"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "href": href,
      };
}

class VersionHistory {
  VersionHistory({
    required this.count,
    required this.href,
  });

  final int count;
  final String href;

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
      };
}

class WpTerm {
  WpTerm({
    required this.taxonomy,
    required this.embeddable,
    required this.href,
  });

  final Taxonomy? taxonomy;
  final bool embeddable;
  final String href;

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: taxonomyValues.map[json["taxonomy"]],
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomyValues.reverse[taxonomy],
        "embeddable": embeddable,
        "href": href,
      };
}

enum Taxonomy {
  CATEGORY,
  POST_TAG,
  TC_CB_TAG_TAXONOMY,
  TC_STORIES_TAX,
  TC_EC_CATEGORY,
  TC_EVENT
}

final taxonomyValues = EnumValues({
  "category": Taxonomy.CATEGORY,
  "post_tag": Taxonomy.POST_TAG,
  "_tc_cb_tag_taxonomy": Taxonomy.TC_CB_TAG_TAXONOMY,
  "tc_ec_category": Taxonomy.TC_EC_CATEGORY,
  "tc_event": Taxonomy.TC_EVENT,
  "tc_stories_tax": Taxonomy.TC_STORIES_TAX
});

class TechcrunchDatumMeta {
  TechcrunchDatumMeta({
    required this.outcome,
    required this.status,
    required this.crunchbaseTag,
    required this.ampStatus,
    required this.relegenceEntities,
    required this.relegenceSubjects,
    required this.carmotUuid,
  });

  final String outcome;
  final String status;
  final int crunchbaseTag;
  final String ampStatus;
  final List<dynamic> relegenceEntities;
  final List<dynamic> relegenceSubjects;
  final String carmotUuid;

  factory TechcrunchDatumMeta.fromJson(Map<String, dynamic> json) =>
      TechcrunchDatumMeta(
        outcome: json["outcome"],
        status: json["status"],
        crunchbaseTag: json["crunchbase_tag"],
        ampStatus: json["amp_status"],
        relegenceEntities:
            List<dynamic>.from(json["relegenceEntities"].map((x) => x)),
        relegenceSubjects:
            List<dynamic>.from(json["relegenceSubjects"].map((x) => x)),
        carmotUuid: json["carmot_uuid"],
      );

  Map<String, dynamic> toJson() => {
        "outcome": outcome,
        "status": status,
        "crunchbase_tag": crunchbaseTag,
        "amp_status": ampStatus,
        "relegenceEntities":
            List<dynamic>.from(relegenceEntities.map((x) => x)),
        "relegenceSubjects":
            List<dynamic>.from(relegenceSubjects.map((x) => x)),
        "carmot_uuid": carmotUuid,
      };
}

class Parsely {
  Parsely({
    required this.version,
    required this.meta,
    required this.rendered,
  });

  final Version? version;
  final ParselyMeta meta;
  final String rendered;

  factory Parsely.fromJson(Map<String, dynamic> json) => Parsely(
        version: versionValues.map[json["version"]],
        meta: ParselyMeta.fromJson(json["meta"]),
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "version": versionValues.reverse[version],
        "meta": meta.toJson(),
        "rendered": rendered,
      };
}

class ParselyMeta {
  ParselyMeta({
    required this.context,
    required this.type,
    required this.mainEntityOfPage,
    required this.headline,
    required this.url,
    required this.thumbnailUrl,
    required this.image,
    required this.dateCreated,
    required this.datePublished,
    required this.dateModified,
    required this.articleSection,
    required this.author,
    required this.creator,
    required this.publisher,
    required this.keywords,
  });

  final String context;
  final MetaType? type;
  final MainEntityOfPage mainEntityOfPage;
  final String headline;
  final String url;
  final String thumbnailUrl;
  final Image image;
  final DateTime dateCreated;
  final DateTime datePublished;
  final DateTime dateModified;
  final Type? articleSection;
  final List<MetaAuthor> author;
  final List<String> creator;
  final Publisher publisher;
  final List<String> keywords;

  factory ParselyMeta.fromJson(Map<String, dynamic> json) => ParselyMeta(
        context: json["@context"],
        type: metaTypeValues.map[json["@type"]],
        mainEntityOfPage: MainEntityOfPage.fromJson(json["mainEntityOfPage"]),
        headline: json["headline"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
        image: Image.fromJson(json["image"]),
        dateCreated: DateTime.parse(json["dateCreated"]),
        datePublished: DateTime.parse(json["datePublished"]),
        dateModified: DateTime.parse(json["dateModified"]),
        articleSection: typeValues.map[json["articleSection"]],
        author: List<MetaAuthor>.from(
            json["author"].map((x) => MetaAuthor.fromJson(x))),
        creator: List<String>.from(json["creator"].map((x) => x)),
        publisher: Publisher.fromJson(json["publisher"]),
        keywords: List<String>.from(json["keywords"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "@context": context,
        "@type": metaTypeValues.reverse[type],
        "mainEntityOfPage": mainEntityOfPage.toJson(),
        "headline": headline,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
        "image": image.toJson(),
        "dateCreated": dateCreated.toIso8601String(),
        "datePublished": datePublished.toIso8601String(),
        "dateModified": dateModified.toIso8601String(),
        "articleSection": typeValues.reverse[articleSection],
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "creator": List<dynamic>.from(creator.map((x) => x)),
        "publisher": publisher.toJson(),
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
      };
}

enum Type { POST }

final typeValues = EnumValues({"post": Type.POST});

class MetaAuthor {
  MetaAuthor({
    required this.type,
    required this.name,
  });

  final AuthorType? type;
  final String name;

  factory MetaAuthor.fromJson(Map<String, dynamic> json) => MetaAuthor(
        type: authorTypeValues.map[json["@type"]],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "@type": authorTypeValues.reverse[type],
        "name": name,
      };
}

enum AuthorType { PERSON }

final authorTypeValues = EnumValues({"Person": AuthorType.PERSON});

class Image {
  Image({
    required this.type,
    required this.url,
  });

  final ImageType? type;
  final String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        type: imageTypeValues.map[json["@type"]],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "@type": imageTypeValues.reverse[type],
        "url": url,
      };
}

enum ImageType { IMAGE_OBJECT }

final imageTypeValues = EnumValues({"ImageObject": ImageType.IMAGE_OBJECT});

class MainEntityOfPage {
  MainEntityOfPage({
    required this.type,
    required this.id,
  });

  final MainEntityOfPageType? type;
  final String id;

  factory MainEntityOfPage.fromJson(Map<String, dynamic> json) =>
      MainEntityOfPage(
        type: mainEntityOfPageTypeValues.map[json["@type"]],
        id: json["@id"],
      );

  Map<String, dynamic> toJson() => {
        "@type": mainEntityOfPageTypeValues.reverse[type],
        "@id": id,
      };
}

enum MainEntityOfPageType { WEB_PAGE }

final mainEntityOfPageTypeValues =
    EnumValues({"WebPage": MainEntityOfPageType.WEB_PAGE});

class Publisher {
  Publisher({
    required this.type,
    required this.name,
    required this.logo,
  });

  final PublisherType? type;
  final PublisherName? name;
  final Logo logo;

  factory Publisher.fromJson(Map<String, dynamic> json) => Publisher(
        type: publisherTypeValues.map[json["@type"]],
        name: publisherNameValues.map[json["name"]],
        logo: Logo.fromJson(json["logo"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": publisherTypeValues.reverse[type],
        "name": publisherNameValues.reverse[name],
        "logo": logo.toJson(),
      };
}

class Logo {
  Logo({
    required this.type,
    required this.url,
    required this.width,
    required this.height,
  });

  final LogoType? type;
  final String url;
  final String width;
  final String height;

  factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        type: logoTypeValues.map[json["@type"]],
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "@type": logoTypeValues.reverse[type],
        "url": url,
        "width": width,
        "height": height,
      };
}

enum LogoType { IMAGE_OBJECT }

final logoTypeValues = EnumValues({"imageObject": LogoType.IMAGE_OBJECT});

enum PublisherName { TECH_CRUNCH }

final publisherNameValues =
    EnumValues({"TechCrunch": PublisherName.TECH_CRUNCH});

enum PublisherType { ORGANIZATION }

final publisherTypeValues =
    EnumValues({"Organization": PublisherType.ORGANIZATION});

enum MetaType { NEWS_ARTICLE }

final metaTypeValues = EnumValues({"NewsArticle": MetaType.NEWS_ARTICLE});

enum Version { THE_100 }

final versionValues = EnumValues({"1.0.0": Version.THE_100});

enum PingStatus { CLOSED }

final pingStatusValues = EnumValues({"closed": PingStatus.CLOSED});

class RapidData {
  RapidData({
    required this.pt,
    required this.pct,
  });

  final String pt;
  final String pct;

  factory RapidData.fromJson(Map<String, dynamic> json) => RapidData(
        pt: json["pt"],
        pct: json["pct"],
      );

  Map<String, dynamic> toJson() => {
        "pt": pt,
        "pct": pct,
      };
}

enum Status { PUBLISH }

final statusValues = EnumValues({"publish": Status.PUBLISH});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
