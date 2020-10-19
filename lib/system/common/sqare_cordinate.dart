class SqareCordinate {
  int x;
  int y;

  SqareCordinate(this.x, this.y);

  String toString() => "($x, $y)";

  void operator +(SqareCordinate cordinate) {
    x += cordinate.x;
    y += cordinate.y;
  }
}
