import 'dart:convert';

import 'package:taxi/driver/domain/entities/upload_file_response.dart';

UploadFileResponseModel uploadFileResponseModelFromJson(String str) => UploadFileResponseModel.fromJson(json.decode(str));

String uploadFileResponseModelToJson(UploadFileResponseModel data) => json.encode(data.toJson());

class UploadFileResponseModel extends UploadFileResponse {
    @override
  String kind;
    @override
  String id;
    @override
  String selfLink;
    @override
  String mediaLink;
    @override
  String name;
    @override
  String bucket;
    @override
  String generation;
    @override
  String metageneration;
    @override
  String contentType;
    @override
  String storageClass;
    @override
  String size;
    @override
  String md5Hash;
    @override
  String crc32C;
    @override
  String etag;
    @override
  DateTime timeCreated;
    @override
  DateTime updated;
    @override
  DateTime timeStorageClassUpdated;

    UploadFileResponseModel({
        required this.kind,
        required this.id,
        required this.selfLink,
        required this.mediaLink,
        required this.name,
        required this.bucket,
        required this.generation,
        required this.metageneration,
        required this.contentType,
        required this.storageClass,
        required this.size,
        required this.md5Hash,
        required this.crc32C,
        required this.etag,
        required this.timeCreated,
        required this.updated,
        required this.timeStorageClassUpdated,
    }) : super(kind: kind, id: id, selfLink: selfLink, mediaLink: mediaLink, name: name, bucket: bucket, 
      generation: generation, metageneration: metageneration, 
      contentType: contentType, storageClass: storageClass, 
      size: size, md5Hash: md5Hash, crc32C: crc32C, etag: etag, 
      timeCreated: timeCreated, updated: updated, timeStorageClassUpdated: timeStorageClassUpdated
    );

    factory UploadFileResponseModel.fromJson(Map<String, dynamic> json) => UploadFileResponseModel(
        kind: json["kind"],
        id: json["id"],
        selfLink: json["selfLink"],
        mediaLink: json["mediaLink"],
        name: json["name"],
        bucket: json["bucket"],
        generation: json["generation"],
        metageneration: json["metageneration"],
        contentType: json["contentType"],
        storageClass: json["storageClass"],
        size: json["size"],
        md5Hash: json["md5Hash"],
        crc32C: json["crc32c"],
        etag: json["etag"],
        timeCreated: DateTime.parse(json["timeCreated"]),
        updated: DateTime.parse(json["updated"]),
        timeStorageClassUpdated: DateTime.parse(json["timeStorageClassUpdated"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "id": id,
        "selfLink": selfLink,
        "mediaLink": mediaLink,
        "name": name,
        "bucket": bucket,
        "generation": generation,
        "metageneration": metageneration,
        "contentType": contentType,
        "storageClass": storageClass,
        "size": size,
        "md5Hash": md5Hash,
        "crc32c": crc32C,
        "etag": etag,
        "timeCreated": timeCreated.toIso8601String(),
        "updated": updated.toIso8601String(),
        "timeStorageClassUpdated": timeStorageClassUpdated.toIso8601String(),
    };
}
