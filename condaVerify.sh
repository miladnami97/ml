#!/bin/bash
RED=$(tput setaf 1)
GRN=$(tput setaf 2)
YLO=$(tput setaf 3)
NC=$(tput sgr0)
function verifyConda {
  echo "${YLO}conda installation path:${NC}"
  read condaPath
  if [ -z "${condaPath}" ]; then
    echo "${RED}ERROR ${YLO}no input{NC}"
    exit 1
  fi
  if $(${condaPath}/anaconda3/bin/conda -V &>/tmp/condaVerify); then
    echo "${YLO}conda: ${GRN}Ok${YLO}, version: ${GRN}$(cat /tmp/condaVerify|tail -1) ${NC}"
  else
    echo "${RED}ERROR ${YLO}cannot stat conda ...${NC}"
    exit 1
  fi
  if $(${condaPath}/anaconda3/bin/python3 -c "import numpy; print(numpy.__version__)" &>/tmp/condaVerify); then
    echo "${YLO}numpy: ${GRN}Ok${YLO}, version: ${GRN}$(cat /tmp/condaVerify|tail -1) ${NC}"
  else
    echo "${RED}ERROR ${YLO}cannot stat numpy ...${NC}"
  fi
  if $(${condaPath}/anaconda3/bin/python3 -c "import scipy; print(scipy.__version__)" &>/tmp/condaVerify); then
    echo "${YLO}SciPy: ${GRN}Ok${YLO}, version: ${GRN}$(cat /tmp/condaVerify|tail -1) ${NC}"
  else
    echo "${RED}ERROR ${YLO}cannot stat SciPy ...${NC}"
  fi
  if $(${condaPath}/anaconda3/bin/python3 -c "import pandas; print(pandas.__version__)" &>/tmp/condaVerify); then
    echo "${YLO}pandas: ${GRN}Ok${YLO}, version: ${GRN}$(cat /tmp/condaVerify|tail -1) ${NC}"
  else
    echo "${RED}ERROR ${YLO}cannot stat pandas ...${NC}"
  fi
  if $(${condaPath}/anaconda3/bin/python3 -c "import sklearn; print(sklearn.__version__)" &>/tmp/condaVerify); then
    echo "${YLO}sklearn: ${GRN}Ok${YLO}, version: ${GRN}$(cat /tmp/condaVerify|tail -1) ${NC}"
  else
    echo "${RED}ERROR ${YLO}cannot stat sklearn ...${NC}"
  fi
  if $(${condaPath}/anaconda3/bin/python3 -c "import tensorflow as tf; print(tf.__version__)" &>/tmp/condaVerify); then
    echo "${YLO}tensorflow: ${GRN}Ok${YLO}, version: ${GRN}$(cat /tmp/condaVerify|tail -1) ${NC}"
  else
    echo "${RED}ERROR ${YLO}cannot stat tensorflow ...${NC}"
  fi
}
verifyConda "$@"
