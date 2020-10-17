class SqareCordinate {
  int x;
  int y;

  SqareCordinate(this.x, this.y);

  void operator +(SqareCordinate cordinate) {
    x += cordinate.x;
    y += cordinate.y;
  }
}
