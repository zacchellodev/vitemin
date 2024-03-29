//REMEMBERING: USE "%2F" instead of "/"
fetch("http://localhost:3000/api/package/version/@types%2Fnode")
  .then(resp => resp.text())
  .then(msg => console.log(msg))
