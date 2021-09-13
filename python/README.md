# DevOps-docker/python

Images to scan / validate / build / deploy python proyects


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites


## Deployment


## Caracteristicas

 - tox-venv
  Eliminado. Se utiliza el paquete virtualenv, no el modulo venv
 - tox
  Realizada precarga de entornos py35,py36,py37,py38,py39,py310
  
## utilidades instaladas. A partir de paquetes oficiales de la distribución

 - pyflakes3 https://launchpad.net/pyflakes
 - pylint https://www.pylint.org/ , https://github.com/PyCQA/pylint
 - isort  https://github.com/PyCQA/isort
 - modernize https://github.com/PyCQA/modernize
 - virtualenv https://pypi.org/project/virtualenv/
 
# pyenv
https://realpython.com/intro-to-pyenv/#why-use-pyenv
 Instalado entornos 3.6.15, 3.7.12, 3.8.12, 3.9.7
 
 Modificaciones: Al procedimiento de instalación especificado, para bullseye modificado python-openll por python3-openssl


## utilidades instaladas. A partir de pip

 - flake8
 
## Cambios

 # 0.1.1
 
 Primera versión, pruebas. Comprobado que es mala idea.
 
 Se trabajará siempre con los docker "base images", por tanto mejor crear contenedor que genere los tar.gz compilados para 
 el docker destino.
 
 Lo mismo con el tox, que será otra imagen, realmente muy similar a este intento, con herramientas de validación, lint, testeo, etc..
 
 Y dado un tox.ini, genere con futuro docker python-pyenv los pyenv necesarios (si no lo estan) y con un volumen compartido puedan acceder al mismo.
  otra opción es con ese python-pyenv que genere un artefacto del pyenv deseado, y subirlo a un repositorio. Pero dada la votalidad de los entornos
  de prueba, mejor generarlos en local. (aunque sin descartar la opción de un repo)
 

## Authors

* **Esteban Barón** - *Initial work* - [gomibaya](https://github.com/gomibaya)


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

Dockers for DevOps
