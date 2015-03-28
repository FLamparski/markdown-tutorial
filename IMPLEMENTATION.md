# Markdown Tutorial - Implementation

## Mental model

A **lesson** is a collection of one or more **tasks**. Completion of all
mandatory tasks will be required to consider the lesson complete, however tasks
can be optional.

In the **session**, I should store the current lesson and task, as well as
the state of all completed tasks and lessons, including all the user
input to them (output can be generated on demand). Progress should be saved
automatically after completing every task or every minute.

The session should also contain a record of badges the user was awarded, if
any.

## Tech

ES6 and maybe even ES7 via the traceur compiler. Supporting IE10 and up, and
modern browsers.

Will need to build some sort of UI first - possibly using Polymer? Don't want
to use Bootstrap for this one. Could however use Riot + ES6.

Code and Renderer - use CodeMirror with a custom style for the editor.
