
class LevelsDataResponse {
    String? message;
    int? page;
    List<Levels>? levels;
    String? error ;

    LevelsDataResponse({this.message, this.page, this.levels,this.error});

    LevelsDataResponse.fromJson(Map<String, dynamic> json) {
        message = json["message"];
        page = json["page"];
        levels = json["levels"] == null ? null : (json["levels"] as List).map((e) => Levels.fromJson(e)).toList();
        error = '';
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["message"] = message;
        _data["page"] = page;
        if(levels != null) {
            _data["levels"] = levels?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Levels {
    Image? image;
    String? id;
    String? subjectId;
    String? subjectName;
    String? levelName;
    int? scoreOfLevel;
    int? v;

    Levels({this.image, this.id, this.subjectId, this.subjectName, this.levelName, this.scoreOfLevel, this.v});

    Levels.fromJson(Map<String, dynamic> json) {
        image = json["image"] == null ? null : Image.fromJson(json["image"]);
        id = json["_id"];
        subjectId = json["subjectId"];
        subjectName = json["subjectName"];
        levelName = json["levelName"];
        scoreOfLevel = json["scoreOfLevel"];
        v = json["__v"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(image != null) {
            _data["image"] = image?.toJson();
        }
        _data["_id"] = id;
        _data["subjectId"] = subjectId;
        _data["subjectName"] = subjectName;
        _data["levelName"] = levelName;
        _data["scoreOfLevel"] = scoreOfLevel;
        _data["__v"] = v;
        return _data;
    }
}

class Image {
    String? publicId;
    String? secureUrl;

    Image({this.publicId, this.secureUrl});

    Image.fromJson(Map<String, dynamic> json) {
        publicId = json["public_id"];
        secureUrl = json["secure_url"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["public_id"] = publicId;
        _data["secure_url"] = secureUrl;
        return _data;
    }
}