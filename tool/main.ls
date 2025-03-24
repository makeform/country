require! <[cheerio]>
fs = require "fs-extra"

$ = cheerio.load(fs.read-file-sync "result.html" .toString!)
ret = Array.from($("tr"))
  .map (tr) -> [0 to 3].map (idx) -> $(Array.from($(tr).find("td"))[idx]).text!
  .filter -> it and it.0
fs.write-file-sync "country.json", JSON.stringify(ret)
