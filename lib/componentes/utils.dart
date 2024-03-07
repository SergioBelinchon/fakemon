bool checkColision(jugador, bloque)
{
  final hitbox = jugador.hitbox;
  final playerX = jugador.position.x + hitbox.offsetX;
  final playerY = jugador.position.y + hitbox.offsetY;
  final playerWidth = hitbox.width;
  final playerHeight = hitbox.height;

  final bloqueX = bloque.x;
  final bloqueY = bloque.y;
  final bloqueWidth = bloque.width;
  final bloqueHeight = bloque.height;

  final fixedX = jugador.scale.x < 0
      ? playerX - (hitbox.offsetX * 2) - playerWidth
      : playerX;
  final fixedY = bloque.isPlataforma ? playerY + playerHeight : playerY;

  return (fixedY < bloqueY + bloqueHeight &&
      playerY + playerHeight > bloqueY &&
      fixedX < bloqueX + bloqueWidth &&
      fixedX + playerWidth > bloqueX
  );
}