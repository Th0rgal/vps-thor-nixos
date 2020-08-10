{ lib
, fetchFromGitHub
, buildPythonPackage
, pythonOlder
, withVoice ? true, libopus
, aiohttp
, websockets
, pynacl
}:

buildPythonPackage rec {
  pname = "discord.py";
  version = "1.4.1";
  disabled = pythonOlder "3.5.3";

  # only distributes wheels on pypi now
  src = fetchFromGitHub {
    owner = "Rapptz";
    repo = pname;
    rev = "v${version}";
    sha256 = "c7168a1c0b8ec944ec52626b3f29607cdb4001e32eaf06ac8c4a7b72fea8bd71";
  };

  propagatedBuildInputs = [ aiohttp websockets ];
  patchPhase = ''
    substituteInPlace "requirements.txt" \
      --replace "aiohttp>=3.6.0,<3.7.0" "aiohttp~=3.6.0" \
      --replace "websockets>=6.0,!=7.0,!=8.0,!=8.0.1,<9.0" "websockets>=6"
  '' + lib.optionalString withVoice ''
    substituteInPlace "discord/opus.py" \
      --replace "ctypes.util.find_library('opus')" "'${libopus}/lib/libopus.so.0'"
  '';


  # only have integration tests with discord
  doCheck = false;

  pythonImportsCheck = [
    "discord"
    "discord.file"
    "discord.member"
    "discord.user"
    "discord.state"
    "discord.guild"
    "discord.webhook"
    "discord.ext.commands.bot"
  ];

  meta = {
    description = "A python wrapper for the Discord API";
    homepage    = "https://discordpy.rtfd.org/";
    license     = lib.licenses.mit;
  };
}