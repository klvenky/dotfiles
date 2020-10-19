jfmt() {
  python3 -m json.tool $1 > $1-1;
  echo "formatting complete"
  mv $1-1 $1;
}
subljfmt() {
  jfmt $1
  subl $1;
}

xmlfmt() {
    xmllint --format $1 > $1-q;
    echo "formatting complete"
    mv $1-1 $1;
}

sublxfmt() {
  xfmt $1
  subl $1;
}


