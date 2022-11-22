#!/bin/bash

# ---------------------------
# Projects(folder names):
#   af  - AFTRS
#   bc  - British Council
#   cl  - Corelogic
#   dp  - Drinkpoint
#   fe  - Forms Express
#   fmc - FitMyCar
#   gs  - Studylane/GSP
#   hr  - Health RFID
#   mhp - M Health Pharma
#   ms  - Metrosix
#   nu  - Nutra Organics
#   pd  - Pundit
#   pi  - PIQ
#   rp  - RPData
#   tq  - Tafe Queensland
#   wc  - Whitecliffe
#   hp  - Happi
#   hp  - WMU
#   hp  - INSTEP
#   mb  - My Bonsai Diary
#   cx  - ConvX
#   td  - TechDirect
#   adlf - ADL Forms
#   adli - ADL Inspect
#   lmdc - Love My Dog Club
#   pwb - Persons Without Borders
#   rr - Rent Rabbit
#   ys - Yardstick
#   oa - OAC
#   tgx - Telegenixx
#   ahc - Agile Help Center
#   et - EmpowerTeams
#   or - Oreana
#   ux - UBX Xpanse
#   pvt - Pivot
# ---------------------------

# Array of folder names.
folder=(af bc cl dp fe fmc gs hr mhp ms nu pd pi rp tq wc hp ge am wmu ins mb cx td piq adv adlf adli lmdc pwb rr ys oa tgx ahc et or ux pvt)
bold=$(tput bold) # Ignore this. I just want to see the folder name in bold.

for dir in "${folder[@]}"
do
  # Reset the value of '- var project = $i' to a constant value "flag" when
  # 'Ctrl+c' is pressed.
  trap "perl -i -pe 's/'$dir'/flag/g if $.==4' options/options.pug" exit

  echo "Generating templates for '${bold}$dir'"

  # Replace the constant string value of '- var project = "flag"'
  # in "options.pug" to
  # its folder name stored in the array object folder.
  # --
  # This will find only the intance of string "flag" exactly on the specified
  # line number.
  perl -i -pe 's/flag/'$dir'/g if $.==4' options/options.pug

  # Compiles all .pug files to .html and place it in the project folder.
  pug --pretty *.pug --out html/$dir

  # Reset the value of '- var project = $i' to a constant string value "flag".
  perl -i -pe 's/'$dir'/flag/g if $.==4' options/options.pug
done
