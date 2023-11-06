abstract class BasisAmpel {
  final int id;
  final bool eingeschaltet;
  final Set<String> zustaende;
  final Map<String, bool> lampen;

  const BasisAmpel({
    required this.id,
    required this.eingeschaltet,
    required this.zustaende,
    required this.lampen,
  });

  // void ausschalten() {}

  // void einschalten() {}

  // void schalten() {}
}
