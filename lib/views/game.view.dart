import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutero_assignment_asteroid/Model/Loc.dart';
import 'package:tutero_assignment_asteroid/Model/ShotModel.dart';
import 'package:tutero_assignment_asteroid/shared/common.dart';
import 'package:tutero_assignment_asteroid/shared/player.dart';
import 'package:tutero_assignment_asteroid/shared/shot.dart';
import 'asteroid.dart';

class GameView extends StatefulWidget {
  static const String routeName = "game";

  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late FocusNode _focusNode;
  late bool _requestedFocus;
  late Loc _playerLoc;
  late double _playerRotation;
  late double _playerSpeed;
  double _playerRotationSpeed = pi * 0.05;
  late double _shotsSpeed;
  late DateTime _lastShotTime;

  late Map<LogicalKeyboardKey, bool> _keysDown;
  late List<ShotModel> _shotModels;

  late Size _screenSize;

  int asteroidSpriteCount = 0;
  double asteroidPosX = -0.5;
  double asteroidPosX1 = 0.2;
  double asteroidPosX2 = -0.6;
  double asteroidPosX3 = 0.5;
  double asteroidPosX4 = -0.3;
  double asteroidPosX5 = 0.7;
  double asteroidPosX6 = -0.8;
  double asteroidPosX7 = -0.9;
  double asteroidPosX8 = 0.1;
  double asteroidPosX9 = -1.0;
  double asteroidPosX10 = 0.8;

  double asteroidPosY = 0.2;
  double asteroidPosY1 = 0.1;
  double asteroidPosY2 = 0.3;
  double asteroidPosY3 = 0.5;
  double asteroidPosY4 = 0.5;
  double asteroidPosY5 = 0.6;
  double asteroidPosY6 = 0.7;
  double asteroidPosY7 = 0.9;
  double asteroidPosY8 = 0.8;
  double asteroidPosY9 = 1.0;
  double asteroidPosY10 = 0.2;

  bool gameOver = false;
  bool gameOver1 = false;
  bool gameOver2 = false;
  bool gameOver3 = false;
  bool gameOver4 = false;
  bool gameOver5 = false;
  bool gameOver6 = false;
  bool gameOver7 = false;
  bool gameOver8 = false;
  bool gameOver9 = false;
  bool gameOver10 = false;

  void hasCollided(List<ShotModel> shotModel) {
    shotModel.map((e) {
      if ((e.loc.x - asteroidPosX3).round() < 100 ||
          (e.loc.y - asteroidPosY3).round() < 100) {
        double distBetween = sqrt(
            pow(e.loc.x - asteroidPosX3, 2) + pow(e.loc.y - asteroidPosY3, 2));
        if (distBetween < 100) {
          gameOver3 = true;
        }
      }
      if ((e.loc.x - asteroidPosX).round() < 100 ||
              (e.loc.y - asteroidPosY).round() < 100
          // asteroidPosX3 <= e.loc.x + 100 &&
          // asteroidPosY3 <= e.loc.y + 100
          ) {
        double distBetween = sqrt(
            pow(e.loc.x - asteroidPosX, 2) + pow(e.loc.y - asteroidPosY, 2));
        if (distBetween < 100) {
          gameOver = true;
        }
      }
      if ((e.loc.x - asteroidPosX1).round() < 100 ||
              (e.loc.y - asteroidPosY1).round() < 100
          // asteroidPosX3 <= e.loc.x + 100 &&
          // asteroidPosY3 <= e.loc.y + 100
          ) {
        double distBetween = sqrt(
            pow(e.loc.x - asteroidPosX1, 2) + pow(e.loc.y - asteroidPosY1, 2));
        if (distBetween < 100) {
          gameOver1 = true;
        }
      }
      if ((e.loc.x - asteroidPosX2).round() < 100 ||
              (e.loc.y - asteroidPosY2).round() < 100
          // asteroidPosX2 <= e.loc.x + 100 &&
          // asteroidPosY2 <= e.loc.y + 100
          ) {
        double distBetween = sqrt(
            pow(e.loc.x - asteroidPosX2, 2) + pow(e.loc.y - asteroidPosY2, 2));
        if (distBetween < 100) {
          gameOver2 = true;
        }
      }
      if ((e.loc.x - asteroidPosX4).round() < 100 ||
              (e.loc.y - asteroidPosY4).round() < 100
          // asteroidPosX4 <= e.loc.x + 100 &&
          // asteroidPosY4 <= e.loc.y + 100
          ) {
        double distBetween = sqrt(
            pow(e.loc.x - asteroidPosX4, 2) + pow(e.loc.y - asteroidPosY4, 2));
        if (distBetween < 100) {
          gameOver4 = true;
        }
      }
      if ((e.loc.x - asteroidPosX5).round() < 100 ||
              (e.loc.y - asteroidPosY5).round() < 100
          // asteroidPosX5 <= e.loc.x + 100 &&
          // asteroidPosY5 <= e.loc.y + 100
          ) {
        double distBetween = sqrt(
            pow(e.loc.x - asteroidPosX5, 2) + pow(e.loc.y - asteroidPosY5, 2));
        if (distBetween < 100) {
          gameOver5 = true;
        }
      }
      if ((e.loc.x - asteroidPosX6).round() < 100 ||
              (e.loc.y - asteroidPosY6).round() < 100
          // asteroidPosX6 <= e.loc.x + 100 &&
          // asteroidPosY6 <= e.loc.y + 100
          ) {
        double distBetween = sqrt(
            pow(e.loc.x - asteroidPosX6, 2) + pow(e.loc.y - asteroidPosY6, 2));
        if (distBetween < 100) {
          gameOver6 = true;
        }
      }
      if ((e.loc.x - asteroidPosX7).round() < 100 ||
              (e.loc.y - asteroidPosY7).round() < 100
          // asteroidPosX7 <= e.loc.x + 100 &&
          // asteroidPosY7 <= e.loc.y + 100
          ) {
        double distBetween = sqrt(
            pow(e.loc.x - asteroidPosX7, 2) + pow(e.loc.y - asteroidPosY7, 2));
        if (distBetween < 100) {
          gameOver7 = true;
        }
      }
      if ((e.loc.x - asteroidPosX8).round() < 100 ||
              (e.loc.y - asteroidPosY8).round() < 100
          // asteroidPosX8 <= e.loc.x + 100 &&
          // asteroidPosY8 <= e.loc.y + 100
          ) {
        double distBetween = sqrt(
            pow(e.loc.x - asteroidPosX8, 2) + pow(e.loc.y - asteroidPosY8, 2));
        if (distBetween < 100) {
          gameOver8 = true;
        }
      }
      if ((e.loc.x - asteroidPosX9).round() < 100 ||
              (e.loc.y - asteroidPosY9).round() < 100
          // asteroidPosX9 <= e.loc.x + 100 &&
          // asteroidPosY9 <= e.loc.y + 100
          ) {
        double distBetween = sqrt(
            pow(e.loc.x - asteroidPosX9, 2) + pow(e.loc.y - asteroidPosY9, 2));
        if (distBetween < 100) {
          gameOver9 = true;
        }
      }
      if ((e.loc.x - asteroidPosX10).round() < 100 ||
              (e.loc.y - asteroidPosY10).round() < 100
          // asteroidPosX10 <= e.loc.x + 100 &&
          // asteroidPosY10 <= e.loc.y + 100
          ) {
        double distBetween = sqrt(pow(e.loc.x - asteroidPosX10, 2) +
            pow(e.loc.y - asteroidPosY10, 2));
        if (distBetween > 100) {
          gameOver10 = true;
        }
      }
    }).toList();
  }

  void moveAsteroid() {
    Timer.periodic(Duration(milliseconds: 550), (timer) {
      setState(() {
        asteroidPosX += 0.01;
        asteroidPosX1 += 0.03;
        asteroidPosX2 += 0.05;
        asteroidPosX3 -= 0.07;
        asteroidPosX4 -= 0.04;
        asteroidPosX5 += 0.08;
        asteroidPosX6 += 0.09;
        asteroidPosX7 -= 0.05;
        asteroidPosX8 += 0.07;
        asteroidPosX9 += 0.02;
        asteroidPosX10 += 0.04;

        asteroidPosY += 0.05;
        asteroidPosY1 -= 0.06;
        asteroidPosY2 += 0.05;
        asteroidPosY3 -= 0.02;
        asteroidPosY4 -= 0.07;
        asteroidPosY5 += 0.01;
        asteroidPosY6 -= 0.03;
        asteroidPosY7 += 0.01;
        asteroidPosY8 += 0.08;
        asteroidPosY9 -= 0.06;
        asteroidPosY10 -= 0.04;
      });
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      _playerLoc.x = details.position.dx;
      _playerLoc.y = details.position.dy;
    });
  }

  @override
  void initState() {
    super.initState();
    moveAsteroid();
    _playerLoc = Loc(1, 1);
    _keysDown = {};
    _requestedFocus = false;
    _focusNode = FocusNode(
        descendantsAreFocusable: true,
        onKey: (FocusNode node, RawKeyEvent event) {
          // print("keytap. node: $node, event: $event");
          return true;
        });

    _playerRotation = 0;
    _playerSpeed = 5;
    _shotsSpeed = 5.5;
    _shotModels = [];
    _lastShotTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    // print("Y Axis : $asteroidPosY");

    _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: RawKeyboardListener(
        onKey: (RawKeyEvent event) {
          // print("[RawKeyboardListener] event: $event");

          if (event is RawKeyDownEvent) {
            _keysDown[event.logicalKey] = true;
          }
          if (event is RawKeyUpEvent) {
            _keysDown[event.logicalKey] = false;
          }
        },
        focusNode: _focusNode,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (!_requestedFocus) {
              _requestedFocus = true;
              FocusScope.of(context).requestFocus(_focusNode);
            }

            _handleKeys();

            _updateShots();

            WidgetsBinding.instance?.addPostFrameCallback((_) {
              setState(() {});
            });

            List<Widget> children = [];

            children.add(
              Positioned(
                top: _playerLoc.y,
                left: _playerLoc.x,
                child: Transform.rotate(
                  angle: _playerRotation,
                  child: GestureDetector(
                    onTap: () {
                      print("sscc");
                      if (DateTime.now().millisecondsSinceEpoch -
                              _lastShotTime.millisecondsSinceEpoch >
                          300) {
                        _lastShotTime = DateTime.now();
                        _createShot();
                      }
                    },
                    child: MouseRegion(
                        onEnter: (event) {
                          _updateLocation(event);
                        },
                        child: Player()),
                  ),
                ),
              ),
            );

            children.add(Container(
              alignment: Alignment(asteroidPosX, asteroidPosY),
              child: gameOver
                  ? Container()
                  : Asteroid(
                      asteroidImage: "asteroid1",
                    ),
            ));
            children.add(Container(
              alignment: Alignment(asteroidPosX1, asteroidPosY1),
              child: gameOver1
                  ? Container()
                  : Asteroid(
                      asteroidImage: "asteroid0",
                    ),
            ));
            children.add(Container(
              alignment: Alignment(asteroidPosX2, asteroidPosY2),
              child: gameOver2
                  ? Container()
                  : Asteroid(
                      asteroidImage: "asteroid1",
                    ),
            ));
            children.add(Container(
              alignment: Alignment(asteroidPosX3, asteroidPosY3),
              child: gameOver3
                  ? Container()
                  : Asteroid(
                      asteroidImage: "asteroid2",
                    ),
            ));
            children.add(Container(
              alignment: Alignment(asteroidPosX4, asteroidPosY4),
              child: gameOver4
                  ? Container()
                  : Asteroid(
                      asteroidImage: "asteroid2",
                    ),
            ));
            children.add(Container(
              alignment: Alignment(asteroidPosX5, asteroidPosY5),
              child: gameOver5
                  ? Container()
                  : Asteroid(
                      asteroidImage: "asteroid0",
                    ),
            ));
            children.add(Container(
              alignment: Alignment(asteroidPosX6, asteroidPosY6),
              child: gameOver6
                  ? Container()
                  : Asteroid(
                      asteroidImage: "asteroid1",
                    ),
            ));
            children.add(Container(
              alignment: Alignment(asteroidPosX7, asteroidPosY7),
              child: gameOver7
                  ? Container()
                  : Asteroid(
                      asteroidImage: "asteroid0",
                    ),
            ));
            children.add(Container(
              alignment: Alignment(asteroidPosX8, asteroidPosY8),
              child: gameOver8
                  ? Container()
                  : Asteroid(
                      asteroidImage: "asteroid2",
                    ),
            ));
            children.add(Container(
              alignment: Alignment(asteroidPosX9, asteroidPosY9),
              child: gameOver9
                  ? Container()
                  : Asteroid(
                      asteroidImage: "asteroid1",
                    ),
            ));
            children.add(Container(
              alignment: Alignment(asteroidPosX10, asteroidPosY10),
              child: gameOver10
                  ? Container()
                  : Asteroid(
                      asteroidImage: "asteroid2",
                    ),
            ));

            List<Widget> shots = _shotModels
                .map(
                  (ShotModel shotModel) => Positioned(
                    left: shotModel.loc.x,
                    top: shotModel.loc.y,
                    child: Shot(),
                  ),
                )
                .toList();

            hasCollided(_shotModels);

            children.add(Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.topRight,
                  child: TweenAnimationBuilder<Duration>(
                      duration: Duration(minutes: 3),
                      tween: Tween(begin: Duration.zero, end: Duration(minutes: 5)),
                      onEnd: () {
                        print('Timer ended');
                      },
                      builder: (BuildContext context, Duration value, Widget? child) {
                        final minutes = value.inMinutes;
                        final seconds = value.inSeconds % 60;
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text('Timer $minutes:$seconds',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30)));
                      }),),
            ));

            children.addAll(shots);

            return Container(
              color: Colors.black87,
              // alignment: Alignment.center,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Stack(
                children: children,
              ),
            );
          },
        ),
      ),
    );
  }

  void _initPlayerTransform() {
    _playerLoc = Loc(_screenSize.width / 2, _screenSize.height / 2);
    _playerRotation = 0;
  }

  void _handleKeys() {
    if (_keysDown[LogicalKeyboardKey.keyR] == true) {
      _initPlayerTransform();
    }

    if (_keysDown[LogicalKeyboardKey.keyA] == true) {
      _playerLoc.x -= _playerSpeed;
    }
    if (_keysDown[LogicalKeyboardKey.keyD] == true) {
      _playerLoc.x += _playerSpeed;
    }
    if (_keysDown[LogicalKeyboardKey.keyW] == true) {
      _playerLoc.y -= _playerSpeed;
    }
    if (_keysDown[LogicalKeyboardKey.keyS] == true) {
      _playerLoc.y += _playerSpeed;
    }

    if (_keysDown[LogicalKeyboardKey.arrowLeft] == true) {
      _playerRotation -= _playerRotationSpeed;
    }
    if (_keysDown[LogicalKeyboardKey.arrowRight] == true) {
      _playerRotation += _playerRotationSpeed;
    }

    if (_keysDown[LogicalKeyboardKey.space] == true) {
      if (DateTime.now().millisecondsSinceEpoch -
              _lastShotTime.millisecondsSinceEpoch >
          300) {
        _lastShotTime = DateTime.now();
        _createShot();
      }
    }

    // apply bounderies:
    if (_playerLoc.x < 0) _playerLoc.x = 0;
    if (_playerLoc.y < 0) _playerLoc.y = 0;
    if (_playerLoc.x > _screenSize.width - Common.PLAYER_SIZE)
      _playerLoc.x = _screenSize.width - Common.PLAYER_SIZE;
    if (_playerLoc.y > _screenSize.height - Common.PLAYER_SIZE)
      _playerLoc.y = _screenSize.height - Common.PLAYER_SIZE;
  }

  void _createShot() {
    _shotModels.add(ShotModel(
        Loc(
            _playerLoc.x +
                Common.PLAYER_SIZE / 2 -
                Common.SHOT_SIZE / 2 +
                (Common.PLAYER_SIZE / 2) * cos(_playerRotation),
            _playerLoc.y +
                Common.PLAYER_SIZE / 2 -
                Common.SHOT_SIZE / 2 +
                (Common.PLAYER_SIZE / 2) * sin(_playerRotation)),
        _playerRotation));
  }

  void _updateShots() {
    for (ShotModel shotModel in _shotModels) {
      shotModel.loc.x += _shotsSpeed * cos(shotModel.angle);
      shotModel.loc.y += _shotsSpeed * sin(shotModel.angle);

      if (shotModel.loc.x < 0 ||
          shotModel.loc.x > _screenSize.width ||
          shotModel.loc.y < 0 ||
          shotModel.loc.y > _screenSize.height) {
        shotModel.done = true;
      }
    }

    _shotModels.removeWhere((ShotModel shotModel) => shotModel.done);
  }
}
