## Debugging tools in R
# - traceback: prints out the function call stack after an error occurs
# - debug: flags a function for "debug" mode allowing you to step through the execution
# - browser: suspends the execution of a function wherever it's called and puts the function in debug mode
# - trace: allows you to insert debugging code into a function at specific places
#          (applied outside of the function)
# - recover: allows to modify the error behavior so that you can browse the function call stack
#            (by setting the error handler)

### traceback
mean(notDefined)
# traceback is not very handy if function call fails right at the top-level call
traceback()

lm(y - x)
traceback()


### debug
debug(lm)
# you will be taken to the browser
lm(y - x)


### recover
read.csv("nosuchfile")
options(error = recover)
read.csv("nosuchfile")