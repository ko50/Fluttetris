class Cordinate {
  int x;
  int y;

  Cordinate(this.x, this.y);

  String toString() => "($x, $y)";

  Cordinate operator +(Cordinate other) => Cordinate(x + other.x, y + other.y);

  Cordinate operator -(Cordinate other) => Cordinate(x + other.x, y - other.y);

  bool operator ==(dynamic cordinate) => cordinate?.x == x && cordinate?.y == y;

  @override
  int get hashCode => super.hashCode;

  bool get isExcess => x < 0 || x > 9 || y < 0;

  bool isStucking(Cordinate other) => other.x == x || other.y == y;

  void down() => y -= 1;

  void toRight() => x += 1;

  void toLeft() => x -= 1;
}
