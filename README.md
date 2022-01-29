# A CPP conan template

A template repo to start a cpp projects using the package manager [conan](https://conan.io) and  (with Ninja) + .vscode files added.


# Installation on your local machine

## Install Python with anaconda

```
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
```

## Create env and install Conan fron conda-forge channel

```
conda create -n conan_env python=3.9
activate conan_env
conda install -c conda-forge conan
```

## Configure

1. Change project name in `CMakeList.txt`.
2. Update dependencies in `conanfile.txt`.


## Setup or Refresh env

Run

```sh
./setup.sh
```

## After dependencies changes

```sh
cd build
conan install ..
cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1
```

## Build & Run

On you main directory

```sh
./compile.sh
```



# Use docker

## Build & run the dependencies setup

```
sudo docker build -t {{your_docker_image_name}} .
```

## Run it

You can find the compiled file on /home/{your_home_dir_name}/

* Call the terminal

```bash
sudo docker run -v /home/{{your_home_dir_name}}/:/home/app/build/bin -it {{your_docker_image_name}} /bin/bash
```

* Compile:

```bash
sudo docker run -v /home/{{your_home_dir_name}}/:/home/app/build/bin -it {{your_docker_image_name}} ./compile.sh
```

sudo docker run -v /home/ava/:/home/app/build/bin test ./compile.sh

## Binary

Binary/app can be found in `build/bin/` which will be same as your project name.





