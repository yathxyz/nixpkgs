{ lib
, aiohttp
, bidict
, buildPythonPackage
, fetchFromGitHub
, mock
, msgpack
, pytestCheckHook
, python-engineio
, pythonOlder
, requests
, websocket-client
}:

buildPythonPackage rec {
  pname = "python-socketio";
  version = "5.10.0";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "miguelgrinberg";
    repo = "python-socketio";
    rev = "refs/tags/v${version}";
    hash = "sha256-nlzTzIswMRjvJ9l9TOtVvRvbKlQPvNH0/P1NIbQCmy8=";
  };

  propagatedBuildInputs = [
    bidict
    python-engineio
  ];

  passthru.optional-dependencies = {
    client = [
      requests
      websocket-client
    ];
    asyncio_client = [
      aiohttp
    ];
  };

  nativeCheckInputs = [
    mock
    msgpack
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "socketio"
  ];

  meta = with lib; {
    description = "Python Socket.IO server and client";
    longDescription = ''
      Socket.IO is a lightweight transport protocol that enables real-time
      bidirectional event-based communication between clients and a server.
    '';
    homepage = "https://github.com/miguelgrinberg/python-socketio/";
    changelog = "https://github.com/miguelgrinberg/python-socketio/blob/v${version}/CHANGES.md";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ mic92 ];
  };
}
