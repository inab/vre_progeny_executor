# VRE PROGENy Tool Executor

## Requirements

- Python 3.6 or later
- R 4.0.2 or later
- [git](https://git-scm.com/downloads)

```bash
sudo apt update
sudo apt install python3
sudo apt install r-base
sudo apt install git
```

In order to install the Python dependencies you need `pip` and `venv` modules.

```bash
sudo apt install python3-pip python3-venv
```

## Installation

Directly from GitHub:

```bash
cd $HOME
git clone https://github.com/inab/vre_progeny_executor.git
cd vre_progeny_executor
```

Create the Python environment:

```bash
python3 -m venv venv
source venv/bin/activate
pip install --upgrade wheel
pip install -r requirements.txt
```

## Run the Wrapper
```bash
./VRE_RUNNER --config tests/basic/config.json --in_metadata tests/basic/in_metadata.json --out_metadata out_metadata.json --log_file VRE_RUNNER.log
```

## License
* © 2020-2021 Barcelona Supercomputing Center (BSC), ES
* © 2020-2021 Heidelberg University Hospital (UKL-HD), DE

Licensed under the Apache License [Version 2.0](https://www.apache.org/licenses/LICENSE-2.0), see the file `LICENSE` for details.
