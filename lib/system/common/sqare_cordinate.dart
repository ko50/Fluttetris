class SqareCordinate {
  int x;
  int y;

  SqareCordinate(this.x, this.y);

  String toString() => "($x, $y)";

  SqareCordinate operator +(SqareCordinate other) =>
      SqareCordinate(x + other.x, y + other.y);

  SqareCordinate operator -(SqareCordinate other) =>
      SqareCordinate(x + other.x, y - other.y);

  bool operator ==(cordinate) => cordinate.x == x && cordinate.y == y;

  @override
  int get hashCode => super.hashCode;

  bool isConflicting(SqareCordinate other) => other.x == x || other.y == y;

  void down() => y -= 1;

  void toRight() => x += 1;

  void toLeft() => x -= 1;
}
