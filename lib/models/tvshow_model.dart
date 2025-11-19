import 'dart:convert';

List<TvShowModel> tvShowModelFromJson(String str) => List<TvShowModel>.from(
  json.decode(str).map((x) => TvShowModel.fromJson(x)),
);

String tvShowModelToJson(List<TvShowModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TvShowModel {
  int id;
  String url;
  String name;
  Type type;
  Language language;
  List<Genre> genres;
  Status status;
  int? runtime;
  int averageRuntime;
  DateTime premiered;
  DateTime? ended;
  String? officialSite;
  Schedule schedule;
  Rating rating;
  int weight;
  Network? network;
  Network? webChannel;
  Country? dvdCountry;
  Externals externals;
  Image image;
  String summary;
  int updated;
  Links links;
  bool isBookmarked;

  TvShowModel({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.premiered,
    required this.ended,
    required this.officialSite,
    required this.schedule,
    required this.rating,
    required this.weight,
    required this.network,
    required this.webChannel,
    required this.dvdCountry,
    required this.externals,
    required this.image,
    required this.summary,
    required this.updated,
    required this.links,
    required this.isBookmarked,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> json) => TvShowModel(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    type: typeValues.map[json["type"]]!,
    language: languageValues.map[json["language"]]!,
    genres: List<Genre>.from(json["genres"].map((x) => genreValues.map[x]!)),
    status: statusValues.map[json["status"]]!,
    runtime: json["runtime"],
    averageRuntime: json["averageRuntime"],
    premiered: DateTime.parse(json["premiered"]),
    ended: json["ended"] == null ? null : DateTime.parse(json["ended"]),
    officialSite: json["officialSite"],
    schedule: Schedule.fromJson(json["schedule"]),
    rating: Rating.fromJson(json["rating"]),
    weight: json["weight"],
    network: json["network"] == null ? null : Network.fromJson(json["network"]),
    webChannel: json["webChannel"] == null
        ? null
        : Network.fromJson(json["webChannel"]),
    dvdCountry: json["dvdCountry"] == null
        ? null
        : Country.fromJson(json["dvdCountry"]),
    externals: Externals.fromJson(json["externals"]),
    image: Image.fromJson(json["image"]),
    summary: json["summary"],
    updated: json["updated"],
    links: Links.fromJson(json["_links"]),
    isBookmarked: json["isBookmarked"] == null ? false : json["isBookmarked"] == 1,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "type": typeValues.reverse[type],
    "language": languageValues.reverse[language],
    "genres": List<dynamic>.from(genres.map((x) => genreValues.reverse[x])),
    "status": statusValues.reverse[status],
    "runtime": runtime,
    "averageRuntime": averageRuntime,
    "premiered":
        "${premiered.year.toString().padLeft(4, '0')}-${premiered.month.toString().padLeft(2, '0')}-${premiered.day.toString().padLeft(2, '0')}",
    "ended":
        "${ended!.year.toString().padLeft(4, '0')}-${ended!.month.toString().padLeft(2, '0')}-${ended!.day.toString().padLeft(2, '0')}",
    "officialSite": officialSite,
    "schedule": schedule.toJson(),
    "rating": rating.toJson(),
    "weight": weight,
    "network": network?.toJson(),
    "webChannel": webChannel?.toJson(),
    "dvdCountry": dvdCountry?.toJson(),
    "externals": externals.toJson(),
    "image": image.toJson(),
    "summary": summary,
    "updated": updated,
    "_links": links.toJson(),
    "isBookmarked": isBookmarked ? 1 : 0,
  };
}

class Country {
  Name name;
  Code code;
  Timezone timezone;

  Country({required this.name, required this.code, required this.timezone});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    name: nameValues.map[json["name"]]!,
    code: codeValues.map[json["code"]]!,
    timezone: timezoneValues.map[json["timezone"]]!,
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "code": codeValues.reverse[code],
    "timezone": timezoneValues.reverse[timezone],
  };
}

enum Code { ca, de, fr, gb, jp, us }

final codeValues = EnumValues({
  "CA": Code.ca,
  "DE": Code.de,
  "FR": Code.fr,
  "GB": Code.gb,
  "JP": Code.jp,
  "US": Code.us,
});

enum Name { canada, france, germany, japan, unitedKingdom, unitedStates }

final nameValues = EnumValues({
  "Canada": Name.canada,
  "France": Name.france,
  "Germany": Name.germany,
  "Japan": Name.japan,
  "United Kingdom": Name.unitedKingdom,
  "United States": Name.unitedStates,
});

enum Timezone {
  americaNewYork,
  americaToronto,
  asiaTokyo,
  europeBusingen,
  europeLondon,
  europeParis,
}

final timezoneValues = EnumValues({
  "America/New_York": Timezone.americaNewYork,
  "America/Toronto": Timezone.americaToronto,
  "Asia/Tokyo": Timezone.asiaTokyo,
  "Europe/Busingen": Timezone.europeBusingen,
  "Europe/London": Timezone.europeLondon,
  "Europe/Paris": Timezone.europeParis,
});

class Externals {
  int tvrage;
  int? thetvdb;
  String? imdb;

  Externals({required this.tvrage, required this.thetvdb, required this.imdb});

  factory Externals.fromJson(Map<String, dynamic> json) => Externals(
    tvrage: json["tvrage"],
    thetvdb: json["thetvdb"],
    imdb: json["imdb"],
  );

  Map<String, dynamic> toJson() => {
    "tvrage": tvrage,
    "thetvdb": thetvdb,
    "imdb": imdb,
  };
}

enum Genre {
  action,
  adventure,
  anime,
  comedy,
  crime,
  drama,
  espionage,
  family,
  fantasy,
  history,
  horror,
  legal,
  medical,
  music,
  mystery,
  romance,
  scienceFiction,
  sports,
  supernatural,
  thriller,
  war,
  western,
}

final genreValues = EnumValues({
  "Action": Genre.action,
  "Adventure": Genre.adventure,
  "Anime": Genre.anime,
  "Comedy": Genre.comedy,
  "Crime": Genre.crime,
  "Drama": Genre.drama,
  "Espionage": Genre.espionage,
  "Family": Genre.family,
  "Fantasy": Genre.fantasy,
  "History": Genre.history,
  "Horror": Genre.horror,
  "Legal": Genre.legal,
  "Medical": Genre.medical,
  "Music": Genre.music,
  "Mystery": Genre.mystery,
  "Romance": Genre.romance,
  "Science-Fiction": Genre.scienceFiction,
  "Sports": Genre.sports,
  "Supernatural": Genre.supernatural,
  "Thriller": Genre.thriller,
  "War": Genre.war,
  "Western": Genre.western,
});

class Image {
  String medium;
  String original;

  Image({required this.medium, required this.original});

  factory Image.fromJson(Map<String, dynamic> json) =>
      Image(medium: json["medium"], original: json["original"]);

  Map<String, dynamic> toJson() => {"medium": medium, "original": original};
}

enum Language { english, japanese }

final languageValues = EnumValues({
  "English": Language.english,
  "Japanese": Language.japanese,
});

class Links {
  Self self;
  Episode previousepisode;
  Episode? nextepisode;

  Links({required this.self, required this.previousepisode, this.nextepisode});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: Self.fromJson(json["self"]),
    previousepisode: Episode.fromJson(json["previousepisode"]),
    nextepisode: json["nextepisode"] == null
        ? null
        : Episode.fromJson(json["nextepisode"]),
  );

  Map<String, dynamic> toJson() => {
    "self": self.toJson(),
    "previousepisode": previousepisode.toJson(),
    "nextepisode": nextepisode?.toJson(),
  };
}

class Episode {
  String href;
  String name;

  Episode({required this.href, required this.name});

  factory Episode.fromJson(Map<String, dynamic> json) =>
      Episode(href: json["href"], name: json["name"]);

  Map<String, dynamic> toJson() => {"href": href, "name": name};
}

class Self {
  String href;

  Self({required this.href});

  factory Self.fromJson(Map<String, dynamic> json) => Self(href: json["href"]);

  Map<String, dynamic> toJson() => {"href": href};
}

class Network {
  int id;
  String name;
  Country? country;
  String? officialSite;

  Network({
    required this.id,
    required this.name,
    required this.country,
    required this.officialSite,
  });

  factory Network.fromJson(Map<String, dynamic> json) => Network(
    id: json["id"],
    name: json["name"],
    country: json["country"] == null ? null : Country.fromJson(json["country"]),
    officialSite: json["officialSite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country": country?.toJson(),
    "officialSite": officialSite,
  };
}

class Rating {
  double? average;

  Rating({required this.average});

  factory Rating.fromJson(Map<String, dynamic> json) =>
      Rating(average: json["average"]?.toDouble());

  Map<String, dynamic> toJson() => {"average": average};
}

class Schedule {
  Time time;
  List<Day> days;

  Schedule({required this.time, required this.days});

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    time: timeValues.map[json["time"]]!,
    days: List<Day>.from(json["days"].map((x) => dayValues.map[x]!)),
  );

  Map<String, dynamic> toJson() => {
    "time": timeValues.reverse[time],
    "days": List<dynamic>.from(days.map((x) => dayValues.reverse[x])),
  };
}

enum Day { friday, monday, saturday, sunday, thursday, tuesday, wednesday }

final dayValues = EnumValues({
  "Friday": Day.friday,
  "Monday": Day.monday,
  "Saturday": Day.saturday,
  "Sunday": Day.sunday,
  "Thursday": Day.thursday,
  "Tuesday": Day.tuesday,
  "Wednesday": Day.wednesday,
});

enum Time {
  empty,
  the_0900,
  the_1200,
  the_1300,
  the_2000,
  the_2030,
  the_2100,
  the_2130,
  the_2200,
  the_2230,
  the_2300,
  the_2330,
}

final timeValues = EnumValues({
  "": Time.empty,
  "09:00": Time.the_0900,
  "12:00": Time.the_1200,
  "13:00": Time.the_1300,
  "20:00": Time.the_2000,
  "20:30": Time.the_2030,
  "21:00": Time.the_2100,
  "21:30": Time.the_2130,
  "22:00": Time.the_2200,
  "22:30": Time.the_2230,
  "23:00": Time.the_2300,
  "23:30": Time.the_2330,
});

enum Status { ended, running, toBeDetermined }

final statusValues = EnumValues({
  "Ended": Status.ended,
  "Running": Status.running,
  "To Be Determined": Status.toBeDetermined,
});

enum Type { animation, documentary, reality, scripted, talkShow }

final typeValues = EnumValues({
  "Animation": Type.animation,
  "Documentary": Type.documentary,
  "Reality": Type.reality,
  "Scripted": Type.scripted,
  "Talk Show": Type.talkShow,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
