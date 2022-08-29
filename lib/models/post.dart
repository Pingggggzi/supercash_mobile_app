// import 'dart:convert';
// import 'package:http/http.dart' as http;

// // Post postFromJson(String str) =>
// //     Post.from(json.decode(str).map((x) => Post.fromJson(x)));

// // String postToJson(Post data) =>
// //     json.encode(dynamic.from(data.map((x) => x.toJson())));

// class Post {
//   String api_key;
//   String package_name;
//   String ref_id;
//   String signature;
//   String onboarding_id;
//   String onboarding_url;
//   // Timestamp expired_at;
//   // DateTime expired_at;
//   String expired_at;
//   String error_code;

//   Post(
//       {required this.api_key,
//       required this.package_name,
//       required this.ref_id,
//       required this.signature,
//       required this.onboarding_id,
//       required this.onboarding_url,
//       required this.expired_at,
//       required this.error_code});

//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//       api_key: json["api_key"],
//       package_name: json["package_name"],
//       ref_id: json["ref_id"],
//       signature: json["signature"],
//       onboarding_id: json["onboarding_id"],
//       onboarding_url: json["onboarding_url"],
//       expired_at: json["expired_at"],
//       error_code: json["error_code"]);

//   // Map<String, dynamic> toJson() => {
//   //       "api_key": api_key,
//   //       "package_name": package_name,
//   //       "ref_id": ref_id,
//   //       "signature": signature,
//   //       "onboarding_id": onboarding_id,
//   //       "onboarding_url": onboarding_url,
//   //       "expired_at": expired_at,
//   //       "error_code": error_code
//   //     };

//   static Future<Post> connectToAPI(
//       String api_key,
//       String package_name,
//       String ref_id,
//       String signature,
//       String onboarding_id,
//       String onboarding_url,
//       // Timestamp expired_at,
//       // DateTime expired_at,
//       String expired_at,
//       String error_code) async {
//     Uri apiURL = Uri.parse(
//         'https://ekyc.ctos.com.my/#/guideline?token=9a57f93ce230147b4f0b83c29029224d62021021');

//     var apiResult = await http.post(apiURL, body: {
//       "api_key": api_key,
//       "package_name": package_name,
//       "ref_id": ref_id,
//       "signature": signature,
//       "onboarding_id": onboarding_id,
//       "onboarding_url": onboarding_url,
//       "expired_at": expired_at,
//       "error_code": error_code
//     });
//     var jsonObject = await json.decode(json.encode(apiResult.body));

//     return Post.fromJson(jsonObject);
//   }
// }
