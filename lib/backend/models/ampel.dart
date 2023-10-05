class Ampel {
  bool lampeGruen;
  bool lampeGelb;
  bool lampeRot;

  Ampel({
    required this.lampeGruen,
    required this.lampeGelb,
    required this.lampeRot,
  });

  void schalten() {
    if (lampeGruen) {
      lampeGruen = false;
      lampeGelb = true;
    } else if (lampeGelb == true && lampeRot == false) {
      lampeGelb = false;
      lampeRot = true;
    } else if (lampeRot == true && lampeGelb == false) {
      lampeRot = true;
      lampeGelb = true;
    } else if (lampeRot == true && lampeGelb == true) {
      lampeRot = false;
      lampeGelb = false;
      lampeGruen = true;
    }
  }

  void setLampen(bool gruen, bool gelb, bool rot) {
    lampeGruen = gruen;
    lampeGelb = gelb;
    lampeRot = rot;
  }

  @override
  String toString() {
    return 'Ampel(lampeGruen: $lampeGruen, lampeGelb: $lampeGelb, lampeRot: $lampeRot)';
  }
}
