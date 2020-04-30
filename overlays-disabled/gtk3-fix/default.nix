(self: super:
let
  petabyteboyGtk3Nixpkgs = import "${super.fetchFromGitHub {
    owner = "petabyteboy";
    repo = "nixpkgs";
    rev = "bcc7b9adb0378712e4bd7c0e6f51c095814bc5a6";
    sha256 = "168i9brs4fabah0c6cgylflvjsjsfmhj3bamzvxpqxiw6fvpb4zh";
  }}" {};
in
  {
    # fix waybar not showing
    inherit (petabyteboyGtk3Nixpkgs) waybar wofi;
  })
