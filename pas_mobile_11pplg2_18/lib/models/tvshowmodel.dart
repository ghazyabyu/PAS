// To parse this JSON data, do
//
//     final tvshowmodel = tvshowmodelFromJson(jsonString);

import 'dart:convert';

List<Tvshowmodel> tvshowmodelFromJson(String str) => List<Tvshowmodel>.from(json.decode(str).map((x) => Tvshowmodel.fromJson(x)));

String tvshowmodelToJson(List<Tvshowmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tvshowmodel {
    int id;
    String url;
    String name;
    Type type;
    Language language;
   
    Rating rating;
    
    Image image;
   

    Tvshowmodel({
        required this.id,
        required this.url,
        required this.name,
        required this.type,
        required this.language,
       
        required this.rating,
        
        required this.image,
       
    });

    factory Tvshowmodel.fromJson(Map<String, dynamic> json) => Tvshowmodel(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: typeValues.map[json["type"]]!,
        language: languageValues.map[json["language"]]!,
        
        rating: Rating.fromJson(json["rating"]),
       
        image: Image.fromJson(json["image"]),
        
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": typeValues.reverse[type],
        "language": languageValues.reverse[language],
        
        "rating": rating.toJson(),
       
        "image": image.toJson(),
          
    };
}

class Country {
    Name name;
    Code code;
    Timezone timezone;

    Country({
        required this.name,
        required this.code,
        required this.timezone,
    });

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

enum Code {
    CA,
    DE,
    FR,
    GB,
    JP,
    US
}

final codeValues = EnumValues({
    "CA": Code.CA,
    "DE": Code.DE,
    "FR": Code.FR,
    "GB": Code.GB,
    "JP": Code.JP,
    "US": Code.US
});

enum Name {
    CANADA,
    FRANCE,
    GERMANY,
    JAPAN,
    UNITED_KINGDOM,
    UNITED_STATES
}

final nameValues = EnumValues({
    "Canada": Name.CANADA,
    "France": Name.FRANCE,
    "Germany": Name.GERMANY,
    "Japan": Name.JAPAN,
    "United Kingdom": Name.UNITED_KINGDOM,
    "United States": Name.UNITED_STATES
});

enum Timezone {
    AMERICA_NEW_YORK,
    AMERICA_TORONTO,
    ASIA_TOKYO,
    EUROPE_BUSINGEN,
    EUROPE_LONDON,
    EUROPE_PARIS
}

final timezoneValues = EnumValues({
    "America/New_York": Timezone.AMERICA_NEW_YORK,
    "America/Toronto": Timezone.AMERICA_TORONTO,
    "Asia/Tokyo": Timezone.ASIA_TOKYO,
    "Europe/Busingen": Timezone.EUROPE_BUSINGEN,
    "Europe/London": Timezone.EUROPE_LONDON,
    "Europe/Paris": Timezone.EUROPE_PARIS
});

class Externals {
    int tvrage;
    int? thetvdb;
    String? imdb;

    Externals({
        required this.tvrage,
        required this.thetvdb,
        required this.imdb,
    });

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
    ACTION,
    ADVENTURE,
    ANIME,
    COMEDY,
    CRIME,
    DRAMA,
    ESPIONAGE,
    FAMILY,
    FANTASY,
    HISTORY,
    HORROR,
    LEGAL,
    MEDICAL,
    MUSIC,
    MYSTERY,
    ROMANCE,
    SCIENCE_FICTION,
    SPORTS,
    SUPERNATURAL,
    THRILLER,
    WAR,
    WESTERN
}

final genreValues = EnumValues({
    "Action": Genre.ACTION,
    "Adventure": Genre.ADVENTURE,
    "Anime": Genre.ANIME,
    "Comedy": Genre.COMEDY,
    "Crime": Genre.CRIME,
    "Drama": Genre.DRAMA,
    "Espionage": Genre.ESPIONAGE,
    "Family": Genre.FAMILY,
    "Fantasy": Genre.FANTASY,
    "History": Genre.HISTORY,
    "Horror": Genre.HORROR,
    "Legal": Genre.LEGAL,
    "Medical": Genre.MEDICAL,
    "Music": Genre.MUSIC,
    "Mystery": Genre.MYSTERY,
    "Romance": Genre.ROMANCE,
    "Science-Fiction": Genre.SCIENCE_FICTION,
    "Sports": Genre.SPORTS,
    "Supernatural": Genre.SUPERNATURAL,
    "Thriller": Genre.THRILLER,
    "War": Genre.WAR,
    "Western": Genre.WESTERN
});

class Image {
    String medium;
    String original;

    Image({
        required this.medium,
        required this.original,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
    );

    Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
    };
}

enum Language {
    ENGLISH,
    JAPANESE
}

final languageValues = EnumValues({
    "English": Language.ENGLISH,
    "Japanese": Language.JAPANESE
});

class Links {
    Self self;
    Episode previousepisode;
    Episode? nextepisode;

    Links({
        required this.self,
        required this.previousepisode,
        this.nextepisode,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: Self.fromJson(json["self"]),
        previousepisode: Episode.fromJson(json["previousepisode"]),
        nextepisode: json["nextepisode"] == null ? null : Episode.fromJson(json["nextepisode"]),
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

    Episode({
        required this.href,
        required this.name,
    });

    factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        href: json["href"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "name": name,
    };
}

class Self {
    String href;

    Self({
        required this.href,
    });

    factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
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

    Rating({
        required this.average,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "average": average,
    };
}

class Schedule {
    Time time;
    List<Day> days;

    Schedule({
        required this.time,
        required this.days,
    });

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: timeValues.map[json["time"]]!,
        days: List<Day>.from(json["days"].map((x) => dayValues.map[x]!)),
    );

    Map<String, dynamic> toJson() => {
        "time": timeValues.reverse[time],
        "days": List<dynamic>.from(days.map((x) => dayValues.reverse[x])),
    };
}

enum Day {
    FRIDAY,
    MONDAY,
    SATURDAY,
    SUNDAY,
    THURSDAY,
    TUESDAY,
    WEDNESDAY
}

final dayValues = EnumValues({
    "Friday": Day.FRIDAY,
    "Monday": Day.MONDAY,
    "Saturday": Day.SATURDAY,
    "Sunday": Day.SUNDAY,
    "Thursday": Day.THURSDAY,
    "Tuesday": Day.TUESDAY,
    "Wednesday": Day.WEDNESDAY
});

enum Time {
    EMPTY,
    THE_0900,
    THE_1200,
    THE_1300,
    THE_2000,
    THE_2030,
    THE_2100,
    THE_2130,
    THE_2200,
    THE_2230,
    THE_2300,
    THE_2330
}

final timeValues = EnumValues({
    "": Time.EMPTY,
    "09:00": Time.THE_0900,
    "12:00": Time.THE_1200,
    "13:00": Time.THE_1300,
    "20:00": Time.THE_2000,
    "20:30": Time.THE_2030,
    "21:00": Time.THE_2100,
    "21:30": Time.THE_2130,
    "22:00": Time.THE_2200,
    "22:30": Time.THE_2230,
    "23:00": Time.THE_2300,
    "23:30": Time.THE_2330
});

enum Status {
    ENDED,
    RUNNING,
    TO_BE_DETERMINED
}

final statusValues = EnumValues({
    "Ended": Status.ENDED,
    "Running": Status.RUNNING,
    "To Be Determined": Status.TO_BE_DETERMINED
});

enum Type {
    ANIMATION,
    DOCUMENTARY,
    REALITY,
    SCRIPTED,
    TALK_SHOW
}

final typeValues = EnumValues({
    "Animation": Type.ANIMATION,
    "Documentary": Type.DOCUMENTARY,
    "Reality": Type.REALITY,
    "Scripted": Type.SCRIPTED,
    "Talk Show": Type.TALK_SHOW
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
