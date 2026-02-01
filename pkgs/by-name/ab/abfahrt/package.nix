{
  lib,
  buildGoModule,
  fetchFromCodeberg,
}:

buildGoModule rec {
  pname = "abfahrt";
  version = "0.2.0";

  src = fetchFromCodeberg {
    owner = "1H0";
    repo = "abfahrt";
    rev = "v${version}";
    hash = "sha256-l3sKPVJtDXJjE4Ynfzt2e2WoYL3pl2Mrr6WyVsTlTJs=";
  };

  vendorHash = null;
  ldflags = [
    "-X 'main.version=${version}'"
  ];

  env.CGO_ENABLED = 0;

  meta = {
    description = "Simple command line timetable for swiss public transport";
    homepage = "https://codeberg.org/1H0/abfahrt";
    license = lib.licenses.mit;
    mainProgram = "abfahrt";
    maintainers = with lib.maintainers; [ lks ];
  };
}
