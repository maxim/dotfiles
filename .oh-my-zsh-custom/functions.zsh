function tlog() {
  if test "$1" = ""; then
    tail -f log/development.log
  else
    tail -f "log/$1.log"
  fi
}

# schema - list table names
# schema users - show structure of table users
function schema() {
  if test "$1" = ""; then
    grep 'create_table' db/schema.rb | cut -d \" -f2
  else
    sed -n "/create_table \"$1/,/^ *end *$/p" db/schema.rb
  fi
}

# structure - list table names
# structure users - show structure of table users
function structure() {
  if test "$1" = ""; then
    grep 'CREATE TABLE' db/structure.sql | cut -d " " -f3
  else
    sed -n "/CREATE TABLE $1 (/,/^);$/p" db/structure.sql
  fi
}

function sizeup() {
  wc -l $1/**/* 2>/dev/null | sort -r
}

function onetest() {
  if [ -d spec ]; then
    ruby -Ispec $1 --color --example $2
  else
    ruby -Itest $1 --name $2
  fi
}

function lc() {
  if [ -d $1 ]; then
    ls -anh $1
  else
    if [ -f $1 ]; then
      cat $1
    fi
  fi
}

function track_git_branch() {
  if test "`current_branch`" = ""; then
    echo 'Not in git repo.';
  else
    echo "running: git branch --set-upstream `current_branch` origin/`current_branch`";
    git branch --set-upstream `current_branch` origin/`current_branch`;
  fi
}
