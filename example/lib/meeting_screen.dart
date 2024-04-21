import 'dart:async';
import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_sdk/zoom_options.dart';
import 'package:flutter_zoom_sdk/zoom_view.dart';

class MeetingWidget extends StatefulWidget {
  const MeetingWidget({Key? key}) : super(key: key);

  @override
  _MeetingWidgetState createState() => _MeetingWidgetState();
}

class _MeetingWidgetState extends State<MeetingWidget> {
  TextEditingController meetingIdController = TextEditingController();
  TextEditingController meetingPasswordController = TextEditingController();
  late Timer timer;

  final String _meetingId = '83280573728';
  final String _jwtToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZGtLZXkiOiJqRm1DMkhVT1FsNkpWYl9QSFBYeE5RIiwiYXBwS2V5IjoiakZtQzJIVU9RbDZKVmJfUEhQWHhOUSIsIm1uIjoiODMyODA1NzM3MjgiLCJyb2xlIjoxLCJpYXQiOjE3MTM3MTEzMTMsImV4cCI6MTcxMzcxODUxMywidG9rZW5FeHAiOjE3MTM3MTg1MTN9.soqMcnvTEpeA9LUDI6mLbZmzzfZkAHlBIrVU489mj0w';
  final String _zakToken =
      'eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJhdWQiOiJjbGllbnRzbSIsInVpZCI6IjBzUmJDdjNQUXktb1F2VU1XbW40ZFEiLCJpc3MiOiJ3ZWIiLCJzayI6IjAiLCJzdHkiOjEwMCwid2NkIjoidXMwNiIsImNsdCI6MCwiZXhwIjoxNzEzNzE4NTEzLCJpYXQiOjE3MTM3MTEzMTMsImFpZCI6IkthVXp0ZHlBUkRPMDJ2aXdaQmZZYnciLCJjaWQiOiIifQ.ytiEiMwTvR1t8-BgEAfwiLx09jycYHE9VfUT_SPs14c';
  final String _displayName = 'عبدالرحمن الهمداني';

  @override
  Widget build(BuildContext context) {
    // new page needs scaffolding!
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join meeting'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 32.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: meetingIdController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Meeting ID',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: meetingPasswordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(
                builder: (context) {
                  // The basic Material Design action button.
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue, // foreground
                    ),
                    onPressed: () {
                      joinMeeting(
                        displayName: 'Hamada Mohamed',
                        meetingId: '81399246155',
                        password: 'IamThe',
                        zoomAccessToken:
                            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZGtLZXkiOiJqRm1DMkhVT1FsNkpWYl9QSFBYeE5RIiwiYXBwS2V5IjoiakZtQzJIVU9RbDZKVmJfUEhQWHhOUSIsIm1uIjoiODEzOTkyNDYxNTUiLCJyb2xlIjoxLCJpYXQiOjE3MTMxNTc0MDgsImV4cCI6MTcxMzE2NDYwOCwidG9rZW5FeHAiOjE3MTMxNjQ2MDh9.p6ZHRF4TDkuKOO70GIv5EXd34u7yCws2WSflUEO2ixQ',
                      );
                    },
                    child: const Text('Join'),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(
                builder: (context) {
                  // The basic Material Design action button.
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue, // foreground
                    ),
                    onPressed: () {
                      startMeeting(
                        meetingId: _meetingId,
                        jwtToken: _jwtToken,
                        zakToken: _zakToken,
                        displayName: _displayName,
                      );
                    },
                    child: const Text('Start Meeting'),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(
                builder: (context) {
                  // The basic Material Design action button.
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue, // foreground
                    ),
                    onPressed: () => startMeetingNormal(context),
                    child: const Text('Start Meeting With Meeting ID'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  joinMeeting({
    required String meetingId,
    required String zoomAccessToken,
    required String displayName,
    required String password,
  }) {
    ZoomOptions zoomOptions =
        ZoomOptions(domain: "zoom.us", jwtToken: zoomAccessToken
            // jwtToken: generateZoomJWT()
            );
    var meetingOptions = ZoomMeetingOptions(
        zakToken: zoomAccessToken,
        meetingId: meetingId,
        meetingPassword: password,
        displayName: displayName,

        /// pass meeting password for join meeting only
        disableDialIn: "true",
        disableDrive: "true",
        disableInvite: "true",
        disableShare: "true",
        disableTitlebar: "false",
        viewOptions: "true",
        noAudio: "false",
        noDisconnectAudio: "false");

    var zoom = ZoomView();
    zoom.initZoom(zoomOptions).then((results) {
      print('---------- pip pip success initialize zoom sdk${results}');
      if (results[0] == 0) {
        zoom.onMeetingStatus().listen((status) {
          if (kDebugMode) {
            print("[Meeting Status Stream] : " + status[0] + " - " + status[1]);
          }
          if (_isMeetingEnded(status[0])) {
            unInitialize();
            if (kDebugMode) {
              print("[Meeting Status] :- Ended");
            }
          }
        });
        if (kDebugMode) {
          print("listen on event channel");
        }
        zoom.joinMeeting(meetingOptions).then((joinMeetingResult) {});
      }
    }).catchError((error) {
      if (kDebugMode) {
        print("[Error Generated] : ");
        print(error);
      }
    });
  }

  bool _isMeetingEnded(String status) {
    var result = false;

    if (Platform.isAndroid) {
      result = status == "MEETING_STATUS_DISCONNECTING" ||
          status == "MEETING_STATUS_FAILED";
    } else {
      result = status == "MEETING_STATUS_IDLE";
    }

    return result;
  }

  startMeeting({
    required String meetingId,
    required String zakToken,
    required String displayName,
    required String jwtToken,
  }) {
    ZoomOptions zoomOptions =
        ZoomOptions(domain: "zoom.us", jwtToken: jwtToken);
    var meetingOptions = ZoomMeetingOptions(
        meetingId: meetingId,
        zakToken: zakToken,
        displayName: displayName,
        disableDialIn: "false",
        disableDrive: "false",
        disableInvite: "false",
        disableShare: "false",
        disableTitlebar: "false",
        viewOptions: "false",
        noAudio: "false",
        noDisconnectAudio: "false");

    var zoom = ZoomView();
    zoom.initZoom(zoomOptions).then((results) {
      print('START MEETING FLUTTER ..${results[0]} ');
      if (results[0] == 0) {
        zoom.onMeetingStatus().listen((status) {
          if (kDebugMode) {
            print("[Meeting Status Stream] : " + status[0] + " - " + status[1]);
          }
          if (_isMeetingEnded(status[0])) {
            unInitialize();
            if (kDebugMode) {
              print("[Meeting Status] :- Ended");
            }
          }
          if (status[0] == "MEETING_STATUS_INMEETING") {
            zoom.meetinDetails().then((meetingDetailsResult) {
              if (kDebugMode) {
                print("[MeetingDetailsResult] :- " +
                    meetingDetailsResult.toString());
              }
            });
          }
        });
        zoom.startMeeting(meetingOptions).then((loginResult) {
          if (kDebugMode) {
            print("[LoginResult] :- " + loginResult.toString());
          }
          if (loginResult[0] == "SDK ERROR") {
            //SDK INIT FAILED
            if (kDebugMode) {
              print((loginResult[1]).toString());
            }
          } else if (loginResult[0] == "LOGIN ERROR") {
            //LOGIN FAILED - WITH ERROR CODES
            if (kDebugMode) {
              print((loginResult[1]).toString());
            }
          } else {
            //LOGIN SUCCESS & MEETING STARTED - WITH SUCCESS CODE 200
            if (kDebugMode) {
              print((loginResult[0]).toString());
            }
          }
        });
      }
    }).catchError((error) {
      if (kDebugMode) {
        print("[Error Generated] : ");
        print(error);
      }
    });
  }

  unInitialize() async {
    var zoom = ZoomView();
    await zoom.unInitialize();
  }

  // //Start Meeting With Random Meeting ID ----- Emila & Password For Zoom is required.
  // startMeeting(BuildContext context) {
  //   bool _isMeetingEnded(String status) {
  //     var result = false;
  //
  //     if (Platform.isAndroid) {
  //       result = status == "MEETING_STATUS_DISCONNECTING" ||
  //           status == "MEETING_STATUS_FAILED";
  //     } else {
  //       result = status == "MEETING_STATUS_IDLE";
  //     }
  //
  //     return result;
  //   }
  //
  //   ZoomOptions zoomOptions = ZoomOptions(
  //     domain: "zoom.us",
  //     appKey:
  //         "XKE4uWfeLwWEmh78YMbC6mqKcF8oM4YHTr9I", //API KEY FROM ZOOM -- SDK KEY
  //     appSecret:
  //         "bT7N61pQzaLXU6VLj9TVl7eYuLbqAiB0KAdb", //API SECRET FROM ZOOM -- SDK SECRET
  //   );
  //   var meetingOptions = ZoomMeetingOptions(
  //       // userId: 'evilrattdeveloper@gmail.com', //pass host email for zoom
  //       userPassword: 'Dlinkmoderm0641', //pass host password for zoom
  //       disableDialIn: "false",
  //       disableDrive: "false",
  //       disableInvite: "false",
  //       disableShare: "false",
  //       disableTitlebar: "false",
  //       viewOptions: "true",
  //       noAudio: "false",
  //       noDisconnectAudio: "false");
  //
  //   var zoom = ZoomView();
  //   zoom.initZoom(zoomOptions).then((results) {
  //     if (results[0] == 0) {
  //       zoom.onMeetingStatus().listen((status) {
  //         if (kDebugMode) {
  //           print("[Meeting Status Stream] : " + status[0] + " - " + status[1]);
  //         }
  //         if (_isMeetingEnded(status[0])) {
  //           if (kDebugMode) {
  //             print("[Meeting Status] :- Ended");
  //           }
  //           timer.cancel();
  //         }
  //         if (status[0] == "MEETING_STATUS_INMEETING") {
  //           zoom.meetinDetails().then((meetingDetailsResult) {
  //             if (kDebugMode) {
  //               print("[MeetingDetailsResult] :- " +
  //                   meetingDetailsResult.toString());
  //             }
  //           });
  //         }
  //       });
  //       zoom.startMeeting(meetingOptions).then((loginResult) {
  //         if (kDebugMode) {
  //           print(
  //               "[LoginResult] :- " + loginResult[0] + " - " + loginResult[1]);
  //         }
  //         if (loginResult[0] == "SDK ERROR") {
  //           //SDK INIT FAILED
  //           if (kDebugMode) {
  //             print((loginResult[1]).toString());
  //           }
  //           return;
  //         } else if (loginResult[0] == "LOGIN ERROR") {
  //           //LOGIN FAILED - WITH ERROR CODES
  //           if (kDebugMode) {
  //             if (loginResult[1] ==
  //                 ZoomError.ZOOM_AUTH_ERROR_WRONG_ACCOUNTLOCKED) {
  //               print("Multiple Failed Login Attempts");
  //             }
  //             print((loginResult[1]).toString());
  //           }
  //           return;
  //         } else {
  //           //LOGIN SUCCESS & MEETING STARTED - WITH SUCCESS CODE 200
  //           if (kDebugMode) {
  //             print((loginResult[0]).toString());
  //           }
  //         }
  //       }).catchError((error) {
  //         if (kDebugMode) {
  //           print("[Error Generated] : " + error);
  //         }
  //       });
  //     }
  //   }).catchError((error) {
  //     if (kDebugMode) {
  //       print("[Error Generated] : " + error);
  //     }
  //   });
  // }

  //Start Meeting With Custom Meeting ID ----- Emila & Password For Zoom is required.
  startMeetingNormal(BuildContext context) {
    bool _isMeetingEnded(String status) {
      var result = false;

      if (Platform.isAndroid) {
        result = status == "MEETING_STATUS_DISCONNECTING" ||
            status == "MEETING_STATUS_FAILED";
      } else {
        result = status == "MEETING_STATUS_IDLE";
      }

      return result;
    }

    ZoomOptions zoomOptions = ZoomOptions(
      domain: "zoom.us",
      appKey:
          "XKE4uWfeLwWEmh78YMbC6mqKcF8oM4YHTr9I", //API KEY FROM ZOOM -- SDK KEY
      appSecret:
          "bT7N61pQzaLXU6VLj9TVl7eYuLbqAiB0KAdb", //API SECRET FROM ZOOM -- SDK SECRET
    );
    var meetingOptions = ZoomMeetingOptions(
        // userId: 'evilrattdeveloper@gmail.com', //pass host email for zoom
        userPassword: 'Dlinkmoderm0641',
        //pass host password for zoom
        meetingId: meetingIdController.text,
        //
        disableDialIn: "false",
        disableDrive: "false",
        disableInvite: "false",
        disableShare: "false",
        disableTitlebar: "false",
        viewOptions: "false",
        noAudio: "false",
        noDisconnectAudio: "false");

    var zoom = ZoomView();
    zoom.initZoom(zoomOptions).then((results) {
      if (results[0] == 0) {
        zoom.onMeetingStatus().listen((status) {
          if (kDebugMode) {
            print("[Meeting Status Stream] : " + status[0] + " - " + status[1]);
          }
          if (_isMeetingEnded(status[0])) {
            if (kDebugMode) {
              print("[Meeting Status] :- Ended");
            }
            timer.cancel();
          }
          if (status[0] == "MEETING_STATUS_INMEETING") {
            zoom.meetinDetails().then((meetingDetailsResult) {
              if (kDebugMode) {
                print("[MeetingDetailsResult] :- " +
                    meetingDetailsResult.toString());
              }
            });
          }
        });
        zoom.startMeetingNormal(meetingOptions).then((loginResult) {
          if (kDebugMode) {
            print("[LoginResult] :- " + loginResult.toString());
          }
          if (loginResult[0] == "SDK ERROR") {
            //SDK INIT FAILED
            if (kDebugMode) {
              print((loginResult[1]).toString());
            }
          } else if (loginResult[0] == "LOGIN ERROR") {
            //LOGIN FAILED - WITH ERROR CODES
            if (kDebugMode) {
              print((loginResult[1]).toString());
            }
          } else {
            //LOGIN SUCCESS & MEETING STARTED - WITH SUCCESS CODE 200
            if (kDebugMode) {
              print((loginResult[0]).toString());
            }
          }
        });
      }
    }).catchError((error) {
      if (kDebugMode) {
        print("[Error Generated] : " + error);
      }
    });
  }

  final String kZoomMeetingSdkKeyForJWT = 'jFmC2HUOQl6JVb_PHPXxNQ';
  final String kZoomMeetingSdkSecretForJWT = 'bDIpOXNZR6ETRiRHChnkEIMzTQqMyeys';

  String generateZoomJWT() {
    final iat = DateTime.now().millisecondsSinceEpoch ~/ 1000 - 30;
    final exp = iat + 60 * 60 * 2;

    final oPayload = {
      'sdkKey': kZoomMeetingSdkKeyForJWT,
      'iat': iat,
      'exp': exp,
      'role': 1,
      'appKey': kZoomMeetingSdkKeyForJWT,
      'tokenExp': iat + 60 * 60 * 2
    };

    final jwt = JWT(
      oPayload,
      header: {
        'alg': 'HS256',
        'typ': 'JWT',
      },
    );

    final jwtToken = jwt.sign(SecretKey(kZoomMeetingSdkSecretForJWT));

    return jwtToken;
  }
}
