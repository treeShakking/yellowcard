const hw = function* () => {
  yield setTimeout(function* () => {
    yield console.log('hello world')
  })
}

hw()
