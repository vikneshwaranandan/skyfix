class S3Config {
  final String accessKey;
  final String accessKeyId;
  final String? authenticationType;
  final String bucketName;
  final String endpoint;
  final String folderPath;
  final String region;
  final String s3URLStyle;
  final STSDetails? stsDetails;

  S3Config({
    required this.accessKey,
    required this.accessKeyId,
    this.authenticationType,
    required this.bucketName,
    required this.endpoint,
    required this.folderPath,
    required this.region,
    required this.s3URLStyle,
    this.stsDetails,
  });

  factory S3Config.fromJson(Map<String, dynamic> json) {
    return S3Config(
      accessKey: json['accessKey'] ?? '',
      accessKeyId: json['accessKeyId'] ?? '',
      authenticationType: json['authenticationType'],
      bucketName: json['bucketName'] ?? '',
      endpoint: json['endpoint'] ?? '',
      folderPath: json['folderPath'] ?? '',
      region: json['region'] ?? '',
      s3URLStyle: json['s3URLStyle'] ?? '',
      stsDetails: json['stsDetails'] != null 
          ? STSDetails.fromJson(json['stsDetails']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessKey': accessKey,
      'accessKeyId': accessKeyId,
      'authenticationType': authenticationType,
      'bucketName': bucketName,
      'endpoint': endpoint,
      'folderPath': folderPath,
      'region': region,
      's3URLStyle': s3URLStyle,
      'stsDetails': stsDetails?.toJson(),
    };
  }

  @override
  String toString() {
    return 'S3Config(accessKey: $accessKey, accessKeyId: $accessKeyId, '
           'authenticationType: $authenticationType, bucketName: $bucketName, '
           'endpoint: $endpoint, folderPath: $folderPath, region: $region, '
           's3URLStyle: $s3URLStyle, stsDetails: $stsDetails)';
  }
}

class STSDetails {
  final String? awsRoleArn;
  final String? oidcClientID;
  final String? oidcClientScopes;
  final String? oidcClientSecret;
  final String? oidcIdmTokenUrl;
  final bool? oidcSecretAsBasicAuth;

  STSDetails({
    this.awsRoleArn,
    this.oidcClientID,
    this.oidcClientScopes,
    this.oidcClientSecret,
    this.oidcIdmTokenUrl,
    this.oidcSecretAsBasicAuth,
  });

  factory STSDetails.fromJson(Map<String, dynamic> json) {
    return STSDetails(
      awsRoleArn: json['awsRoleArn'],
      oidcClientID: json['oidcClientID'],
      oidcClientScopes: json['oidcClientScopes'],
      oidcClientSecret: json['oidcClientSecret'],
      oidcIdmTokenUrl: json['oidcIdmTokenUrl'],
      oidcSecretAsBasicAuth: json['oidcSecretAsBasicAuth'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'awsRoleArn': awsRoleArn,
      'oidcClientID': oidcClientID,
      'oidcClientScopes': oidcClientScopes,
      'oidcClientSecret': oidcClientSecret,
      'oidcIdmTokenUrl': oidcIdmTokenUrl,
      'oidcSecretAsBasicAuth': oidcSecretAsBasicAuth,
    };
  }

  @override
  String toString() {
    return 'STSDetails(awsRoleArn: $awsRoleArn, oidcClientID: $oidcClientID, '
           'oidcClientScopes: $oidcClientScopes, oidcClientSecret: $oidcClientSecret, '
           'oidcIdmTokenUrl: $oidcIdmTokenUrl, oidcSecretAsBasicAuth: $oidcSecretAsBasicAuth)';
  }
} 