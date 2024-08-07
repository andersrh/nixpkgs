{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonOlder,

  # native
  poetry-core,

  # propagated
  blessed,
  editor,
  readchar,

  # tests
  pytest-mock,
  pytestCheckHook,
  pexpect,
}:

buildPythonPackage rec {
  pname = "inquirer";
  version = "3.2.5";
  format = "pyproject";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub rec {
    owner = "magmax";
    repo = "python-inquirer";
    rev = "refs/tags/v${version}";
    hash = "sha256-7No4Yw0zBGflvglx7G1/yjrsU/DkTrSz93DfIzokBYM=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [
    blessed
    editor
    readchar
  ];

  nativeCheckInputs = [
    pexpect
    pytest-mock
    pytestCheckHook
  ];

  pythonImportsCheck = [ "inquirer" ];

  meta = with lib; {
    description = "Collection of common interactive command line user interfaces, based on Inquirer.js";
    homepage = "https://github.com/magmax/python-inquirer";
    changelog = "https://github.com/magmax/python-inquirer/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ mmahut ];
  };
}
