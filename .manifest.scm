;; guix time-machine -C .channels.scm -- shell --pure -m .manifest.scm

(specifications->manifest
 '("west"
   "git"
   "nss-certs"
   "cmake"
   "dtc"
   "gperf"
   "ninja"
   "guix"
   "arm-none-eabi-toolchain"
   "teensy-loader-cli"
   "python"
   "python-pyelftools"
   "python-virtualenv"))
