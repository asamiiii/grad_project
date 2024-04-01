
class UnitsDataResponse {
    String? message;
    int? page;
    List<Units>? units;
    String? error;

    UnitsDataResponse({this.message, this.page, this.units,this.error});

    UnitsDataResponse.fromJson(Map<String, dynamic> json) {
        message = json["message"];
        page = json["page"];
        units = json["units"] == null ? null : (json["units"] as List).map((e) => Units.fromJson(e)).toList();
        error = '';
    }   

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["message"] = message;
        _data["page"] = page;
        if(units != null) {
            _data["units"] = units?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Units {
    Image? image;
    String? id;
    String? subjectId;
    String? subjectName;
    String? levelName;
    String? levelId;
    String? content;
    String? unitName;
    int? v;

    Units({this.image, this.id, this.subjectId, this.subjectName, this.levelName, this.levelId, this.content, this.unitName, this.v});

    Units.fromJson(Map<String, dynamic> json) {
        image = json["image"] == null ? null : Image.fromJson(json["image"]);
        id = json["_id"];
        subjectId = json["subjectId"];
        subjectName = json["subjectName"];
        levelName = json["levelName"];
        levelId = json["levelId"];
        content = json["content"];
        unitName = json["unitName"];
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
        _data["levelId"] = levelId;
        _data["content"] = content;
        _data["unitName"] = unitName;
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