{ lib
, buildPythonPackage
, certifi
, fetchPypi
, openssl
, pylsqpack
, pyopenssl
, pytestCheckHook
, pythonOlder
}:

buildPythonPackage rec {
  pname = "aioquic";
  version = "0.9.23";
  format = "setuptools";

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-UsnaYO0IN/6LimoNfc8N++vsjpoCfhDr9yBPBWnFj6g=";
  };

  propagatedBuildInputs = [
    certifi
    pylsqpack
    pyopenssl
  ];

  buildInputs = [
    openssl
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "aioquic"
  ];

  __darwinAllowLocalNetworking = true;

  meta = with lib; {
    description = "Implementation of QUIC and HTTP/3";
    homepage = "https://github.com/aiortc/aioquic";
    license = licenses.bsd3;
    maintainers = with maintainers; [ onny ];
  };
}
