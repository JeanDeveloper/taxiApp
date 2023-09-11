import 'package:equatable/equatable.dart';

class UploadFileResponse extends Equatable {
  String kind;
  String id;
  String selfLink;
  String mediaLink;
  String name;
  String bucket;
  String generation;
  String metageneration;
  String contentType;
  String storageClass;
  String size;
  String md5Hash;
  String crc32C;
  String etag;
  DateTime timeCreated;
  DateTime updated;
  DateTime timeStorageClassUpdated;

  UploadFileResponse({
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
  });
  
  @override
  List<Object?> get props => [
    kind,
    id,
    selfLink,
    mediaLink,
    name,
    bucket,
    generation,
    metageneration,
    contentType,
    storageClass,
    size,
    md5Hash,
    crc32C,
    etag,
    timeCreated,
    updated,
    timeStorageClassUpdated,
  ];

}
