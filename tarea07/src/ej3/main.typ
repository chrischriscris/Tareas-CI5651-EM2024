#import "prefix-suffix.typ": prefix-suffix

#let string = json("inputs.json")
#for s in string {
  [\"#s\" $=>$ #prefix-suffix(s)\ ]
}
