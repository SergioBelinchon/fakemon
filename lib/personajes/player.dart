import 'dart:async';
import 'dart:html';

import 'package:fakemon/fakemon.dart';
import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

enum PlayerState { inactivo, corriendo }
enum PlayerDirection { right, left, up, down, none }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<Fakemon>,
        KeyboardHandler
{
  String personaje;
  Player({position, required this.personaje}) : super(position: position);

  late final SpriteAnimation animacionInactivo;
  late final SpriteAnimation animacionCorriendo;
  final double stepTime = 0.05;
  double horizontalMovement = 0;
  double verticalMovement = 0;

  PlayerDirection playerDirection = PlayerDirection.right;
  double moveSpeed = 50;
  Vector2 velocity = Vector2.zero();
  Vector2 startingPosition = Vector2.zero();

  double fixedDeltaTime = 1 / 60;
  double accumulatedTime = 0;

  @override
  FutureOr<void> onLoad()
  {
    _cargarAnimaciones();
    startingPosition = Vector2(position.x, position.y);

    return super.onLoad();
  }

  @override
  void update(double dt)
  {
    accumulatedTime += dt;

    while (accumulatedTime >= fixedDeltaTime) {
        _updatePlayerState();
        _updatePlayerMovement(fixedDeltaTime);
       // _checkHorizontalColisiones();
        //_aplicarGravedad(fixedDeltaTime);
        //_checkVerticalColisiones();

      accumulatedTime -= fixedDeltaTime;
    }

    super.update(dt);
  }


  /*
  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed)
  {
    final isLeftKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyA) ||
    keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final isRightKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight);
    final isUpKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyW) ||
        keysPressed.contains(LogicalKeyboardKey.arrowUp);
    final isDownKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyS) ||
        keysPressed.contains(LogicalKeyboardKey.arrowDown);

    /*
    if(isLeftKeyPressed && isRightKeyPressed)
      {
        playerDirection = PlayerDirection.none;
      }
    else if(isDownKeyPressed && isUpKeyPressed)
      {
        playerDirection = PlayerDirection.none;
      }
    else if(isLeftKeyPressed)
      {
        playerDirection = PlayerDirection.left;
      }
    else if(isRightKeyPressed)
    {
      playerDirection = PlayerDirection.right;
    }
    else if(isDownKeyPressed)
    {
      playerDirection = PlayerDirection.down;
    }
    else if(isUpKeyPressed)
    {
      playerDirection = PlayerDirection.up;
    }
    else
      {
        playerDirection = PlayerDirection.none;
      }*/

    if(isLeftKeyPressed && isRightKeyPressed)
      {
        playerDirection = PlayerDirection.none;
      }
    else if(isLeftKeyPressed)
      {
        playerDirection = PlayerDirection.left;
      }
    else if(isRightKeyPressed)
      {
        playerDirection = PlayerDirection.right;
      }
    else
      {
        playerDirection = PlayerDirection.right;
      }
    return super.onKeyEvent(event, keysPressed);
  }
*/

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    horizontalMovement = 0;
    verticalMovement = 0;

    final isLeftKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyA) || keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    final isRightKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyD) || keysPressed.contains(LogicalKeyboardKey.arrowRight);
    final isDownKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyS)|| keysPressed.contains(LogicalKeyboardKey.arrowDown);
    final isUpKeyPressed = keysPressed.contains(LogicalKeyboardKey.keyW)|| keysPressed.contains(LogicalKeyboardKey.arrowUp);

    horizontalMovement += isLeftKeyPressed ? -1 : 0;
    horizontalMovement += isRightKeyPressed ? 1 : 0;
    verticalMovement += isDownKeyPressed ? 1 : 0;
    verticalMovement += isUpKeyPressed ? -1 : 0;

    return super.onKeyEvent(event, keysPressed);
  }

  void _cargarAnimaciones() 
  {
    animacionInactivo = _animacionSprite('Inactivo', 11);
    animacionCorriendo = _animacionSprite('Corriendo', 12);

    //Lista de animaciones
    animations = {PlayerState.inactivo: animacionInactivo};
    animations = {PlayerState.corriendo: animacionCorriendo};

    //Establecer animacion inicial
    current = PlayerState.corriendo;
  }

 SpriteAnimation _animacionSprite(String state, int amount)
  {
    return SpriteAnimation.fromFrameData(game.images.fromCache('characters/$personaje/$state (32x32).png'),
        SpriteAnimationData.sequenced(
          amount: amount,
          stepTime: stepTime,
          textureSize: Vector2.all(32),
        ));
  }

  void _updatePlayerMovement(double dt)
  {
    velocity.x = horizontalMovement * moveSpeed;
    position.x += velocity.x * dt;

    velocity.y = verticalMovement * dt;
    position.y += velocity.y * dt;
    /*
      double dirX = 0.0;
      double dirY = 0.0;

      switch(playerDirection)
          {
        case PlayerDirection.left:
          if(!isFacingLeft)
            {
              flipHorizontallyAroundCenter();
              isFacingLeft = true;
            }
          current = PlayerState.corriendo;
          dirX -= moveSpeed;
          break;
        case PlayerDirection.right:
          if(!isFacingRight)
          {
            flipHorizontallyAroundCenter();
            isFacingRight = true;
          }
          current = PlayerState.corriendo;
          dirX += moveSpeed;
          break;
        case PlayerDirection.up:
          if(!isFacingUp)
          {
            flipHorizontallyAroundCenter();
            isFacingUp = true;
          }
          current = PlayerState.corriendo;
          dirY -= moveSpeed;
          break;
        case PlayerDirection.down:
          if(!isFacingDown)
          {
            flipHorizontallyAroundCenter();
            isFacingDown = true;
          }
          current = PlayerState.corriendo;
          dirY += moveSpeed;
          break;
        case PlayerDirection.none:
          current = PlayerState.inactivo;
          isFacingRight = true;
          break;
        default:
      }
      velocity = Vector2(dirX, dirY);
      position += velocity * dt;
  }
  */

  }

  void _updatePlayerState()
  {
    PlayerState playerState = PlayerState.inactivo;

    if (velocity.x < 0 && scale.x > 0) {
      flipHorizontallyAroundCenter();
    }
    else if (velocity.x > 0 && scale.x < 0) {
      flipHorizontallyAroundCenter();
    }

    else if (velocity.y > 0 && scale.y < 0) {
      flipHorizontallyAroundCenter();
    }
    else if(velocity.y < 0 && scale.y > 0)
      {
        flipHorizontallyAroundCenter();
      }

    //Si se mueve, corre
    if (velocity.x > 0 || velocity.x < 0) playerState = PlayerState.corriendo;
    if (velocity.y > 0 || velocity.y < 0) playerState = PlayerState.corriendo;

    current = playerState;

  }


}